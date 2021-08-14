<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.20.0-Odense" hasScaleBasedVisibilityFlag="0" maxScale="0" styleCategories="AllStyleCategories" minScale="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal enabled="0" fetchMode="0" mode="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <customproperties>
    <Option type="Map">
      <Option value="false" name="WMSBackgroundLayer" type="bool"/>
      <Option value="false" name="WMSPublishDataSourceUrl" type="bool"/>
      <Option value="0" name="embeddedWidgets/count" type="int"/>
    </Option>
  </customproperties>
  <pipe>
    <provider>
      <resampling enabled="false" maxOversampling="2" zoomedInResamplingMethod="nearestNeighbour" zoomedOutResamplingMethod="nearestNeighbour"/>
    </provider>
    <rasterrenderer band="1" opacity="1" alphaBand="-1" nodataColor="" type="paletted">
      <rasterTransparency/>
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <colorPalette>
        <paletteEntry label="No Change" value="-9999" alpha="255" color="#cccccc"/>
        <paletteEntry label="Conversion to Agriculture" value="1" alpha="255" color="#ffffbe"/>
        <paletteEntry label="Developed" value="2" alpha="255" color="#e60000"/>
        <paletteEntry label="Conversion to Invasive/Introduced" value="3" alpha="255" color="#a900e6"/>
        <paletteEntry label="Conifer Encroachment" value="20" alpha="255" color="#70a800"/>
        <paletteEntry label="Devegetated" value="40" alpha="255" color="#d7c29e"/>
        <paletteEntry label="Conversion to Grassland/Shrubland" value="50" alpha="255" color="#ffaa00"/>
        <paletteEntry label="Conversion to Deciduous" value="65" alpha="255" color="#aaff00"/>
        <paletteEntry label="Riparian Expansion" value="100" alpha="255" color="#00e6a9"/>
        <paletteEntry label="Open Water" value="500" alpha="255" color="#0889ff"/>
      </colorPalette>
      <colorramp name="[source]" type="random">
        <Option type="Map">
          <Option value="100" name="count" type="QString"/>
          <Option value="360" name="hueMax" type="QString"/>
          <Option value="0" name="hueMin" type="QString"/>
          <Option value="random" name="rampType" type="QString"/>
          <Option value="255" name="satMax" type="QString"/>
          <Option value="0" name="satMin" type="QString"/>
          <Option value="255" name="valMax" type="QString"/>
          <Option value="0" name="valMin" type="QString"/>
        </Option>
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
    <huesaturation colorizeOn="0" colorizeGreen="128" saturation="0" colorizeRed="255" colorizeStrength="100" colorizeBlue="128" grayscaleMode="0"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
