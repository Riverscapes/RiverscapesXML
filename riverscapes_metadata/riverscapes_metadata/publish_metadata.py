import os
import time
import argparse
import logging
from urllib.parse import urlparse
import boto3

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')


def sync_to_s3(source_dir, s3_uri):
    """
    Syncs a local directory to an S3 bucket.
    """
    logging.info(f"Syncing {source_dir} to {s3_uri}")
    s3 = boto3.resource('s3')
    parts = urlparse(s3_uri)
    bucket_name = parts.netloc
    prefix = parts.path.lstrip('/')

    bucket = s3.Bucket(bucket_name)

    for subdir, _, files in os.walk(source_dir):
        for file in files:
            full_path = os.path.join(subdir, file)
            relative_path = os.path.relpath(full_path, source_dir)
            s3_key = os.path.join(prefix, relative_path).replace("\\", "/")

            logging.info(f"Uploading {full_path} to s3://{bucket_name}/{s3_key}")
            bucket.upload_file(full_path, s3_key)


def run_athena_query(query, database, result_bucket):
    """
    Runs a query on Athena and waits for it to complete.
    """
    logging.info(f"Running Athena query: {query}")
    athena = boto3.client('athena')

    response = athena.start_query_execution(
        QueryString=query,
        QueryExecutionContext={'Database': database},
        ResultConfiguration={'OutputLocation': result_bucket}
    )

    query_execution_id = response['QueryExecutionId']
    logging.info(f"QueryExecutionId: {query_execution_id}")

    while True:
        stats = athena.get_query_execution(QueryExecutionId=query_execution_id)
        status = stats['QueryExecution']['Status']['State']
        if status in ['SUCCEEDED', 'FAILED', 'CANCELLED']:
            break
        time.sleep(5)

    if status != 'SUCCEEDED':
        error_message = stats['QueryExecution']['Status'].get('StateChangeReason', 'Unknown error')
        logging.error(f"Query failed: {error_message}")
        raise Exception(f"Athena query {query_execution_id} failed with status {status}: {error_message}")

    logging.info("Query succeeded.")
    return query_execution_id


def get_athena_query_results(query_execution_id):
    """
    Retrieves the results of a completed Athena query.
    """
    athena = boto3.client('athena')
    results = athena.get_query_results(QueryExecutionId=query_execution_id)
    return results


def main():
    parser = argparse.ArgumentParser(description="Publish metadata to S3 and update Athena.")
    parser.add_argument('--root', default='.', help='The root directory of the project.')
    args = parser.parse_args()

    dist_dir = os.path.join(args.root, 'dist')
    metadata_dir = os.path.join(dist_dir, 'metadata')

    # Environment variables from GitHub Actions
    table_name = os.environ.get('TABLE_NAME', 'layer_definitions')
    s3_base_path = os.environ.get('S3_BASE_PATH', 's3://riverscapes-athena/riverscapes_metadata/layer_definitions')
    athena_database = os.environ.get('ATHENA_DATABASE', 'default')
    athena_result_bucket = os.environ.get('ATHENA_RESULT_BUCKET', 's3://riverscapes-athena-output/query-results/metadata')

    if not os.path.isdir(metadata_dir):
        logging.error(f"Metadata directory not found: {metadata_dir}")
        return

    # 1. Upload metadata to S3
    sync_to_s3(metadata_dir, s3_base_path)

    # 2. Repair partitions
    run_athena_query(f"MSCK REPAIR TABLE {table_name}", athena_database, athena_result_bucket)

    # 3. Verify partition count
    partition_qid = run_athena_query(f"SHOW PARTITIONS {table_name}", athena_database, athena_result_bucket)
    partition_results = get_athena_query_results(partition_qid)
    # The first row is the header
    partition_count = len(partition_results['ResultSet']['Rows']) - 1
    logging.info(f"Found {partition_count} partitions.")

    # 4. Sample query (count rows)
    count_qid = run_athena_query(f"SELECT count(*) FROM {table_name}", athena_database, athena_result_bucket)
    count_results = get_athena_query_results(count_qid)
    row_count = count_results['ResultSet']['Rows'][1]['Data'][0]['VarCharValue']
    logging.info(f"Table contains {row_count} rows.")

    logging.info("Metadata publishing script finished successfully.")


if __name__ == "__main__":
    main()
