<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" minScale="0" version="3.20.0-Odense" hasScaleBasedVisibilityFlag="0" styleCategories="AllStyleCategories">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal fetchMode="0" mode="0" enabled="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <customproperties>
    <Option/>
  </customproperties>
  <pipe>
    <provider>
      <resampling zoomedInResamplingMethod="nearestNeighbour" maxOversampling="2" zoomedOutResamplingMethod="nearestNeighbour" enabled="false"/>
    </provider>
    <rasterrenderer band="1" alphaBand="-1" opacity="0.6" nodataColor="" type="paletted">
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <colorPalette>
        <paletteEntry label="Closed tree canopy" alpha="255" color="#003300" value="7010"/>
        <paletteEntry label="Dwarf-shrubland" alpha="255" color="#c7b081" value="7011"/>
        <paletteEntry label="Herbaceous - grassland" alpha="255" color="#ffe282" value="7017"/>
        <paletteEntry label="Herbaceous - shrub-steppe" alpha="255" color="#c7b081" value="7045"/>
        <paletteEntry label="No Dominant Lifeform" alpha="255" color="#ff7a8f" value="7050"/>
        <paletteEntry label="Non-vegetated" alpha="255" color="#0000ff" value="7053"/>
        <paletteEntry label="Open tree canopy" alpha="255" color="#b4ff94" value="7062"/>
        <paletteEntry label="Shrubland" alpha="255" color="#826548" value="7065"/>
        <paletteEntry label="Sparse tree canopy" alpha="255" color="#3792ad" value="7080"/>
        <paletteEntry label="Sparsely vegetated" alpha="255" color="#646464" value="7106"/>
      </colorPalette>
    </rasterrenderer>
    <brightnesscontrast gamma="1" contrast="0" brightness="0"/>
    <huesaturation colorizeGreen="128" grayscaleMode="0" colorizeBlue="128" colorizeStrength="100" colorizeOn="0" colorizeRed="255" saturation="0"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
