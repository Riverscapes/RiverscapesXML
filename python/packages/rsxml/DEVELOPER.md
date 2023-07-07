## Working locally

It's recommended that you use `RSXML-RiverscapesXML.code-workspace` if you're in VSCode. This workspace is designed around our common development environment.

Always work on a branch and use a pull request.

## Running examples locally

In order to run the examples you will need to install `rsxml`. If you want that installed version to be editable, you can use `pip install -e .` from the root rsxml directory.

## Deploying

There are two scripts to deploy the package to PyPI:

- `build.sh` - builds the package and puts it in `dist/`. This script also does some checking for compliance with PyPI's requirements.
- `deploy.sh` - Push the package to the PyPI server. This script will prompt you for your PyPI credentials.

In order to run these scripts, you'll need to install some dependencies:

```bash
pip install wheel twine
# On OSX you'll need to install pandoc. (WINDOWS INSTRUCTIONS PENDING)
brew install pandoc
```