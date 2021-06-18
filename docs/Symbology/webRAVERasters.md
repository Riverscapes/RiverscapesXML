# WebRAVE Raster Symbology files

After a discussion from @joewheaton we decided to simplify the work necessary to bring our QML files from QRave into the web so we can have symbolized rasters in WebRAVE. @lauren-herbine and @shelbysawyer this might apply to you at some point

So how do we convert our QML raster symbolization to color ramps for the web?

1. Use QGIS and QRAVE to load up the raster layer you want to symbolize for the web (assuming you already have a `.qml` for this layer of course)
2. Open the symbology menu and click the little save icon. 

<img width="575" alt="119533048-519e1700-bd3a-11eb-8dbe-759a2bcb3590" src="https://user-images.githubusercontent.com/1063391/122590840-f39de000-d016-11eb-920a-e43b25993285.png">

That's it. Now just name it and put it in the right folder and push it to git.

## File naming

The only trick here is putting it in the right place with the right file name

The filename must be `somename.txt` and the `somename` part should match what's in the symbology attribute in the business logic XML file (this is the same naming convention as the qml files. 

So if my business logic looks like this:

``` xml
 <Node label="Detrended DEM (HAND - Height Above Nearest Drainge)" xpath="Raster[@id='HAND']" type="raster" symbology="hand" transparency="40" />
```

then my file name should be `hand.txt`

## **_CASE MATTERS_**

the `.txt` part should always be lowercase and the case of the filename should match EXACTLY what's in the business logic XML


## Folder naming

These files should live alongside the `.json` files for the webRAVE vectors

``` bash
# so if I want to put in a file shared across all projects then
RiverscapesXML/Symbology/web/Shared/whatever.txt
# otherwise, for project-specific symbologies
RiverscapesXML/Symbology/web/ProjectTypeName/whatever.txt
```