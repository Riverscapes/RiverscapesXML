"""Publish metadata from local 
IE. push .parquet files from local dist folder to AWS s3 bucket for Athena to pick up
With ver 0.8 we keep the partition-like folder structure but no longer partition the athena table.
The former partition keys (authority, authority-name (now renamed tool-schema-name) and tool-schema-version are now in the parquet file. 
Therefore rebuilding the table is not necessary. 

-Written by Copilot with Lorin directing Fall 2025
"""
import os
import time
import argparse
import logging
from pathlib import Path
from urllib.parse import urlparse
import boto3

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')


def upload_directory_to_s3(source_dir: Path, s3_uri: str):
    """
    Syncs a local directory to an S3 bucket. IF anything other than .parquet files are found will abort.
    """
    logging.info(f"Syncing {source_dir} to {s3_uri}")
    s3 = boto3.resource('s3')
    parts = urlparse(s3_uri)
    bucket_name = parts.netloc
    prefix = parts.path.lstrip('/')

    bucket = s3.Bucket(bucket_name)

    source_dir = Path(source_dir)
    for file_path in source_dir.rglob('*'):
        if file_path.is_file():
            # ABORT if we find unexpected files (like CSVs) that would break the table
            if file_path.suffix.lower() != '.parquet': 
                logging.error(f"Found unexpected file: {file_path}")
                raise ValueError(
                    f"Aborting upload: Found non-Parquet file '{file_path.name}'. "
                    "The metadata directory should only contain Parquet files to prevent Athena corruption."
                )

            # calculate relative path and force forward slashes for S3
            relative_path = file_path.relative_to(source_dir).as_posix()
            s3_key = f"{prefix}/{relative_path}" if prefix else relative_path

            logging.info(f"Uploading {file_path} to s3://{bucket_name}/{s3_key}")
            bucket.upload_file(str(file_path), s3_key)


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

    dist_dir = Path(args.root) / 'dist'
    metadata_dir = dist_dir /  'metadata'

    # Environment variables from GitHub Actions
    table_name = os.environ.get('TABLE_NAME', 'layer_definitions')
    s3_base_path = os.environ.get('S3_BASE_PATH', 's3://riverscapes-athena/riverscapes_metadata/layer_definitions_raw/0.8/')
    athena_database = os.environ.get('ATHENA_DATABASE', 'default')
    athena_result_bucket = os.environ.get('ATHENA_RESULT_BUCKET', 's3://riverscapes-athena-output/query-results/metadata')

    if not metadata_dir.is_dir():
        logging.error(f"Metadata directory not found: {metadata_dir}")
        return

    # 1. Upload metadata to S3
    upload_directory_to_s3(metadata_dir, s3_base_path)

    # # 2. Repair partitions
    # run_athena_query(f"MSCK REPAIR TABLE {table_name}", athena_database, athena_result_bucket)

    # # 3. Verify partition count
    # partition_qid = run_athena_query(f"SHOW PARTITIONS {table_name}", athena_database, athena_result_bucket)
    # partition_results = get_athena_query_results(partition_qid)
    # # The first row is the header
    # partition_count = len(partition_results['ResultSet']['Rows']) - 1
    # logging.info(f"Found {partition_count} partitions.")

    # 4. Sample query (count rows)
    count_qid = run_athena_query(f"SELECT count(*) FROM {table_name}", athena_database, athena_result_bucket)
    count_results = get_athena_query_results(count_qid)
    row_count = count_results['ResultSet']['Rows'][1]['Data'][0]['VarCharValue']
    logging.info(f"Table {table_name} now contains {row_count} rows.")

    logging.info("Metadata publishing script finished successfully.")


if __name__ == "__main__":
    main()
