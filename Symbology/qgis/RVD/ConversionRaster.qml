<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" styleCategories="AllStyleCategories" version="3.16.8-Hannover" minScale="0" maxScale="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <temporal fetchMode="0" mode="0" enabled="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <customproperties/>
  <pipe>
    <provider>
      <resampling zoomedInResamplingMethod="nearestNeighbour" zoomedOutResamplingMethod="nearestNeighbour" enabled="false" maxOversampling="2"/>
    </provider>
    <rasterrenderer alphaBand="-1" opacity="1" nodataColor="" band="1" type="paletted">
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <colorPalette>
        <paletteEntry alpha="255" value="-50" color="#00e6a9" label="Riparian Expansion"/>
        <paletteEntry alpha="255" value="0" color="#cccccc" label="No Change"/>
        <paletteEntry alpha="255" value="35" color="#aaff00" label="Conversion to Deciduous"/>
        <paletteEntry alpha="255" value="50" color="#ffaa00" label="Conversion to Grassland/Shrubland"/>
        <paletteEntry alpha="255" value="60" color="#d7c29e" label="Devegetated"/>
        <paletteEntry alpha="255" value="80" color="#70a800" label="Conifer Encroachment"/>
        <paletteEntry alpha="255" value="97" color="#a900e6" label="Conversion to Invasive/Introduced"/>
        <paletteEntry alpha="255" value="98" color="#e60000" label="Developed"/>
        <paletteEntry alpha="255" value="99" color="#ffffbe" label="Conversion to Agriculture"/>
      </colorPalette>
      <colorramp name="[source]" type="random">
        <prop v="100" k="count"/>
        <prop v="360" k="hueMax"/>
        <prop v="0" k="hueMin"/>
        <prop v="random" k="rampType"/>
        <prop v="255" k="satMax"/>
        <prop v="0" k="satMin"/>
        <prop v="255" k="valMax"/>
        <prop v="0" k="valMin"/>
      </colorramp>
    </rasterrenderer>
    <brightnesscontrast gamma="1" contrast="0" brightness="0"/>
    <huesaturation colorizeRed="255" colorizeBlue="128" grayscaleMode="0" colorizeOn="0" colorizeGreen="128" colorizeStrength="100" saturation="0"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
