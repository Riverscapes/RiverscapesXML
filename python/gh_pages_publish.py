import hashlib
import glob
import json
import os
import shutil

# These are the folders we will scrape
FOLDERS = [
    'Programs', 'Projects', 'Symbology', 'RaveBusinessLogic'
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
        return hash_md5.hexdigest()
    except Exception as e:
        print(e)
        return None

# This script should be run in the Root folder of the repo


def build_index():
    """
    Create an index file with MD5s we can compare to
    """
    output = {}
    for folder in FOLDERS:
        files = glob.glob(os.path.join('.', folder, '**', '**', '*.*'))
        for fl in files:
            if os.path.isfile(fl):
                relp = os.path.relpath(fl)
                output[relp] = md5(fl)

    if os.path.isfile(INDEX_JSON):
        os.remove(INDEX_JSON)

    with open(INDEX_JSON, 'w') as indf:
        json.dump(output, indf, sort_keys=True, indent=4)


def prep_copy():
    """
    Copy everything into a PUBLIC folder for deployment
    """
    if os.path.isdir(PUBLIC_DIR):
        shutil.rmtree(PUBLIC_DIR)

    os.mkdir(PUBLIC_DIR)

    if os.path.isfile(INDEX_JSON):
        shutil.copy(INDEX_JSON, os.path.join('.', PUBLIC_DIR, INDEX_JSON))

    if os.path.isfile(INDEX_HTML):
        shutil.copy(INDEX_HTML, os.path.join('.', PUBLIC_DIR, INDEX_HTML))

    for folder in FOLDERS:
        src = os.path.join('.', folder)
        dst = os.path.join('.', PUBLIC_DIR, folder)
        shutil.copytree(src, dst)


if __name__ == '__main__':
    build_index()
    prep_copy()
