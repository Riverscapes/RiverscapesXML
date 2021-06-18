# WebRAVE Vector Symbology files

The WebRave vector symbology format has evolved a bit. Here's an example.

``` json
{
  "$schema": "https://xml.riverscapes.xyz/Symbology/webRAVEVector.schema.json",
  "legend": [
    ["hsl(116, 57%, 39%)", "legend table layer 1"],
    ["hsl(108, 87%, 59%)", "legend table layer 1"],
    ["hsl(29, 100%, 50%)", "legend table layer 1"]
  ],
  "layerStyles": [
      {
          "id": "confinement-ratio-3oldrq",
          "type": "line",
          "source": "composite",
          "source-layer": "confinement_ratio-3oldrq",
          "layout": {},
          "paint": {
              "line-color": [
                  "step",
                  ["get", "Confinement_Ratio"],
                  "hsl(116, 57%, 39%)", 0.1,
                  "hsl(108, 87%, 59%)", 0.5,
                  "hsl(29, 100%, 50%)", 0.85,
                  "hsl(8, 100%, 50%)", 1.0000000000002822,
                  "hsl(8, 100%, 50%)"
              ]
          }
      }
  ]
}

```

Let's talk about the overall scructure

``` JSON
{
  "$schema": "https://xml.riverscapes.xyz/Symbology/webRAVEVector.schema.json",
  "legend": [],
  "layerStyles": []
}
```

* `"$schema"` This points to the schema file. It's optional but if you use it then vscode will be able to tell you if there are problems with the file.
* `"legend"`: This is the legend table information. You need to build this manually (see Below)
* `"layerStyles"`: This is copied and pasted directly from mapBox style exports.


## Creating a JSON file for use with webRAVE vector layers:

Here are rough steps to get something symbolized for the web.

1. In QGIS Export your layer as `GeoJSON`. Projection doesn't really matter but you might save yourself some trouble by using WGS84 so that you can throw baselayers under it in mapbox.
   * You may need to remove the crs line that qgis seems to give it.: `"crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },` Mapbox doesn't seem to support that
   * If the file is too big for mapbox consider using a smaller HUC or not exporting fields you have no intention of symbolizing. You can also remove features in your layer to make it a more manageable size. We're just looking for a small, representative dataset that will let us work over a few zoom ranges.
2. Log into [Mapbox Studio](https://studio.mapbox.com/). Click the `styles` tab and create a "new style" using the button. Choose the blank template. Give it a good name
3. Go to layers and add a new layer. You should get an "Upload Data" option where you can drag and drop your geojson into a box. The notifications in the bottom right will tell you when it's done or if there are problems with the file upload or parsing.
4. Now use the studio to symbolize with a few guidelines
   * You need to duplicate the layer and change the type to get things like labels. So, for example, you might have one mapbox layer for symbols (labels), one for line styling and one for polygon fill styling. All layers consume from the same datasource.
   * You can add copies of your datasource and convert them for things like labels, lines, polygons etc but you're not allowed to use anything else. Everything must derive from the geojson file you uploaded.
   * You can add support layers like satellite maps underneath to help you see what your map will look like but you need to make sure these don't end up in the final product below. More about that later.
5. When you're happy click the share button and export your style to a zip file.
6. Unzip and pull out the JSON file inside.

Here's what you're going to be looking at. Most of this file we can discard. The "layers" array is the only thing we care about.

```json
{
    "version": 8,
    "name": "WebRave Export demo",
    "metadata": {
        "mapbox:autocomposite": true,
        "mapbox:type": "template",
        "mapbox:sdk-support": {
            "android": "9.3.0",
            "ios": "5.10.0",
            "js": "2.0.0"
        },
        "mapbox:groups": {},
        "mapbox:uiParadigm": "layers"
    },
    "center": [-115.7276920252901, 46.04100776943545],
    "zoom": 10.688254550618892,
    "bearing": 0,
    "pitch": 0,
    "sources": {
        "mapbox://mapbox.satellite": {
            "url": "mapbox://mapbox.satellite",
            "type": "raster",
            "tileSize": 256
        },
        "composite": {
            "url": "mapbox://northarrowresearch.5pojlt0g",
            "type": "vector"
        }
    },
    "sprite": "mapbox://sprites/northarrowresearch/ckox2hmjq0yn517p5re1fbtbb/ck2u8j60r58fu0sgyxrigm3cu",
    "glyphs": "mapbox://fonts/northarrowresearch/{fontstack}/{range}.pbf",
    "layers": [
        {
            "id": "confinement-ratio-3oldrq",
            "type": "line",
            "source": "composite",
            "source-layer": "confinement_ratio-3oldrq",
            "layout": {},
            "paint": {
                "line-color": [
                    "step",
                    ["get", "Confinement_Ratio"],
                    "hsl(116, 57%, 39%)", 0.1,
                    "hsl(108, 87%, 59%)", 0.5,
                    "hsl(29, 100%, 50%)", 0.85,
                    "hsl(8, 100%, 50%)", 1.0000000000002822,
                    "hsl(8, 100%, 50%)"
                ]
            }
        }
    ],
    "created": "2021-05-20T15:47:03.419Z",
    "modified": "2021-05-20T15:54:44.257Z",
    "id": "ckox2hmjq0yn517p5re1fbtbb",
    "owner": "northarrowresearch",
    "visibility": "private",
    "draft": false
}
```


7. Copy `layers` array and paste it into a new file under the "layerStyles" field

In this case my new JSON file looks something like this:

```json
{
  "$schema": "https://xml.riverscapes.xyz/Symbology/webRAVEVector.schema.json",
  "legend": [],
  "layerStyles": [
      {
          "id": "confinement-ratio-3oldrq",
          "type": "line",
          "source": "composite",
          "source-layer": "confinement_ratio-3oldrq",
          "layout": {},
          "paint": {
              "line-color": [
                  "step",
                  ["get", "Confinement_Ratio"],
                  "hsl(116, 57%, 39%)", 0.1,
                  "hsl(108, 87%, 59%)", 0.5,
                  "hsl(29, 100%, 50%)", 0.85,
                  "hsl(8, 100%, 50%)", 1.0000000000002822,
                  "hsl(8, 100%, 50%)"
              ]
          }
      }
  ]
}
```


## File naming

The only trick here is putting it in the right place with the right file name

The filename must be `somename.json` and the `somename` part should match what's in the symbology attribute in the business logic XML file (this is the same naming convention as the qml files. 

So if my business logic looks like this:

``` xml
<Node xpathlabel="Name" xpath="Outputs/Geopackage/Layers/Vector[@id='CONFINEMENT_RATIO']" type="line" id="confinement_ratio" symbology="confinement_ratio" />
```

then my file name should be `confinement_ratio.json`

## **_CASE MATTERS_**

the `.json` part should always be lowercase and the case of the filename should match EXACTLY what's in the business logic XML


## Folder naming

These files should live alongside the `.txt` files for the webRAVE rasters

``` bash
# so if I want to put in a file shared across all projects then
RiverscapesXML/Symbology/web/Shared/whatever.json
# otherwise, for project-specific symbologies
RiverscapesXML/Symbology/web/ProjectTypeName/whatever.json
```
