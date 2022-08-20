from ast import dump
import json
from migration.logger import Logger


def create_summary(conn, curs):
    log = Logger('Summary')

    curs.execute("""
        SELECT COUNT(*) as count, error FROM projectFiles
        WHERE error is not null
        GROUP BY error;
    """)
    result = curs.fetchall()
    log.info('Projectfile Errors')
    log.info(json.dumps(result, indent=2))

    dump_stats(curs, 'Dataset Errors', """
        SELECT COUNT(*) as count, error FROM datasets WHERE
            error is not null
        GROUP BY error;
    """, [])

    dump_stats(curs, 'Project Errors', """
        SELECT COUNT(*) as count, migration_status, migration_msg FROM projects
        GROUP BY migration_status;
    """, [])

    dump_stats(curs, 'Duplicate file paths', """
        select id, projectId, relPath, new_path from projectFiles
        WHERE
            new_path is not null
        GROUP BY projectId,new_path having count(*) > 1;
    """, [])

    pass


def dump_stats(curs, title, qry, vars):
    log = Logger('Summary')

    curs.execute(qry, vars)
    result = curs.fetchall()

    log.info('\n\n')
    log.info(title)
    log.info('=========================================================================')
    log.info(json.dumps(result, indent=2))
