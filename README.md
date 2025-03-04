# Riverscapes XML

This repo contains all the master XML that controls the [Riverscapes Data Exchange](https://data.riverscapes.net) and related software. Refer to the Riverscapes [Developer](https://developer.riverscapes.net) site for background information about the different types of XML in this repository and how to contribute changes.

## Status

The following widgets display the current status of the XML in this repository and whether the master branch passes all validation checks.

[![Deployed to Web](https://github.com/Riverscapes/RiverscapesXML/actions/workflows/docs_publish.yml/badge.svg?branch=master)](https://github.com/Riverscapes/RiverscapesXML/actions/workflows/docs_publish.yml)

[![XML Validation Test](https://github.com/Riverscapes/RiverscapesXML/actions/workflows/test.yml/badge.svg)](https://github.com/Riverscapes/RiverscapesXML/actions/workflows/test.yml)

## Contents

### `/Projects`

Each and every project in the Riverscapes Data Exchange possesses a `project.rs.xml` file that lists all the data in the project. These XML files refer to the `project.xsd` file in this repository and are validated against this XSD rule file.

### QRiS

This folder contains the protocol library XML files for [Riverscapes Studio for QGIS](https://qris.riverscapes.net) (QRiS).

### RaveBusinessLogic

This folder contains the business logic XML files for each type of project. The business logic XML files define how project files are displayed in the [Riverscapes Viewer](https://viewer.riverscapes.net) software.

### Symbology

This folder contains the xymbology files for the different versions of the [Riverscapes Viewer](https://viewer.riverscapes.net) software. There are separate subfolders for each version: QGIS, WebViewer, ArcGIS 10.x and ArcGIS ArcPro.

## AWS SSM Store

These urls are stored in the AWS System manager store for easy lookup by processes like lambda. In the [Riverscapes Data Exchange repo](https://github.com/Riverscapes/rs-web-monorepo) there is a shell script to update this and a `.programs.json` file that is `.gitignore`'d 

`AWS Systems Manager --> Parameter Store`

You might also need to rebuild and redeploy any lambda works. Look for `PROGRAMS_DIR_JSON`
