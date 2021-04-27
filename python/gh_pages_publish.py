import hashlib
import glob
import json
import os
import shutil
import logging

logging.basicConfig(level=logging.DEBUG)

# These are the folders we will scrape
FOLDERS = [
    'Programs', 'Projects', 'Symbology', 'RaveBusinessLogic'
]
FILES = [
    'CNAME',
    'BaseMaps.xml'
]
PUBLIC_DIR = 'PUBLIC'
INDEX_JSON = 'index.json'
INDEX_HTML = 'index.html'


def md5(fname: str) -> str:
    try:
        hash_md5 = hashlib.md5()
        with open(fname, "rb") as f:
            for chunk in iter(lambda: f.read(4096), b""):
                hash_md5.update(chunk)
        dig = hash_md5.hexdigest()
        logging.debug('   {} :: {}'.format(dig, fname))
        return dig
    except Exception as e:
        print(e)
        return None

# This script should be run in the Root folder of the repo


def build_index():
    """
    Create an index file with MD5s we can compare to
    """
    logging.info('Building Index:')
    output = {}
    for folder in FOLDERS:
        files = glob.glob(os.path.join(
            '.', folder, '**', '*.*'), recursive=True)
        for fl in files:
            if os.path.isfile(fl):
                relp = os.path.relpath(fl)
                output[relp] = md5(fl)

    if os.path.isfile(INDEX_JSON):
        logging.warning('Removing file: {}'.format(INDEX_JSON))
        os.remove(INDEX_JSON)

    # Basemaps is a special case
    for fl in FILES:
        if os.path.isfile(fl):
            relp = os.path.relpath(fl)
            output[relp] = md5(fl)

    with open(INDEX_JSON, 'w') as indf:
        logging.info('Writing {}'.format(INDEX_JSON))
        json.dump(output, indf, sort_keys=True, indent=4)

    logging.info('  complete.')


def prep_copy():
    """
    Copy everything into a PUBLIC folder for deployment
    """
    if os.path.isdir(PUBLIC_DIR):
        logging.warning('Folder exists: deleting {}'.format(PUBLIC_DIR))
        shutil.rmtree(PUBLIC_DIR)

    os.mkdir(PUBLIC_DIR)

    if os.path.isfile(INDEX_JSON):
        src = INDEX_JSON
        dst = os.path.join('.', PUBLIC_DIR, INDEX_JSON)
        shutil.copy(src, dst)
        logging.info('Copied {} --> {}'.format(src, dst))

    if os.path.isfile(INDEX_HTML):
        src = INDEX_HTML
        dst = os.path.join('.', PUBLIC_DIR, INDEX_HTML)
        shutil.copy(src, dst)
        logging.info('Copied {} --> {}'.format(src, dst))

    for folder in FOLDERS:
        src = os.path.join('.', folder)
        dst = os.path.join('.', PUBLIC_DIR, folder)
        shutil.copytree(src, dst)
        logging.info('Copied {} --> {}'.format(src, dst))

    for fl in FILES:
        src = os.path.join('.', fl)
        dst = os.path.join('.', PUBLIC_DIR, fl)
        shutil.copy(src, dst)
        logging.info('Copied {} --> {}'.format(src, dst))
    logging.info('Copied {} individual files'.format(len(FILES)))


if __name__ == '__main__':
    build_index()
    prep_copy()
