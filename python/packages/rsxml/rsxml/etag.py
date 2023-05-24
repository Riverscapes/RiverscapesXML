import os
import hashlib
from rsxml.constants import MULTIPART_CHUNK_SIZE, MULTIPART_THRESHOLD


def _md5(contents: str):
    return hashlib.md5(contents).hexdigest()


def calculate_etag(filePath: str, chunk_size_bytes: int = MULTIPART_CHUNK_SIZE, chunk_thresh_bytes: int = MULTIPART_THRESHOLD):
    """Calculate the Etag of a file. This is useful for figuring out if 
    it needs to be uploaded to the warehouse or not.

    Args:
        filePath (str): path to the file we want an etag for
        chunk_size_bytes (int): The size of a multipart upload
        chunk_thresh_bytes (int): The threshold before we start using multipart uploads

    Returns:
        str: The Etag of the file

    """
    filesize_bytes = os.stat(filePath).st_size

    etag = ""
    # For files smaller than the threshold size we just MD5 the whole file
    if filesize_bytes < chunk_thresh_bytes:
        with open(filePath, 'rb') as file:
            etag = _md5(file.read())
    # For large files we need to use the MD5 hashing schem prescribed by S3 for multipart uploads
    else:
        parts = filesize_bytes // chunk_size_bytes
        if filesize_bytes % chunk_size_bytes > 0:
            parts += 1

        total_md5 = ''
        with open(filePath, 'rb') as file:
            for part in range(parts):
                skip_bytes = chunk_size_bytes * part
                total_bytes_left = filesize_bytes - skip_bytes
                bytes_to_read = min(total_bytes_left, chunk_size_bytes)
                file.seek(skip_bytes)
                buffer = file.read(bytes_to_read)
                total_md5 += _md5(buffer)

        combined_hash = _md5(bytes.fromhex(total_md5))
        etag = f"{combined_hash}-{parts}"

    return f'"{etag}"'
