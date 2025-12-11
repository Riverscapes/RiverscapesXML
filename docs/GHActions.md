# Github Actions for RiverscapesXML

Here are the github actions for this repo:

-------------------------------------

## Action: Docs Publish: `.github/workflows/docs_publish.yml`

This one runs `python/gh_pages_publish.py` does a custom publish to github pages. It only runs when merging to master.

What does `python/gh_pages_publish.py` do?

### 1. Create digest json file `index.json`

Creates `index.json` which contains a digest of every program xml, project XSD, business logic xml and every symbology lyr file for all 3 versions of RAVE. 

```json
{
    "BaseMaps.xml": "30e557b5c5b5a688f24261164203aae8",
    "Programs/Anabranch/Program.xml": "eaa4627e12cdcbff5dda2e25d8b7c017",
    "Programs/AsotinIMW/Program.xml": "f72c1bd5acb889b766046b021acfd929",
    "Programs/BRAT_CRB/Program.xml": "c266684a05051c6eae99c42a2ab03cd4",
...
```

This file is important for each version of RAVE to understand which files are new and to sync them only if necessary.

### 2. Copy files

Selectively publish all the files from the digest above to the github pages site. This **GHPages site is the most important part of the Riverscapes ecosystem** because every tool we use, including the API, the rs-cli and every version of RAVE uses this.

-----------------------------------

## Action: Validator `.github/workflows/test.yml`

This is the checker script that we use to run unit tests contained in `python/test.py`. This python script does a bunch of XML validation and other kinds of checks for things that might break Riverscapes if they are merged. 

This action runs on every branch. **A successful run of these tests is required in order to merge a pull request**.

### Testing locally

Not required but if you are setup with VSCode and python3 you can run this script yourself locally. Look for `RiverscapesXML.code-workspace` to get the right context and then `python/createenv.sh` to setup your environment.

Simply use the `Python: Current File` with `python/test.py` open and selected to run these unit tests.