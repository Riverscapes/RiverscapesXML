<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis minScale="0" maxScale="0" hasScaleBasedVisibilityFlag="0" version="3.20.1-Odense" styleCategories="AllStyleCategories">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal mode="0" enabled="0" fetchMode="0">
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
    <rasterrenderer opacity="0.6" band="1" nodataColor="" alphaBand="-1" type="paletted">
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <colorPalette>
        <paletteEntry label="Floodplain" value="0" alpha="255" color="#abcd66"/>
        <paletteEntry label="Active Channel" value="1" alpha="255" color="#00a9e6"/>
      </colorPalette>
      <colorramp name="[source]" type="random">
        <Option type="Map">
          <Option name="count" value="100" type="QString"/>
          <Option name="hueMax" value="360" type="QString"/>
          <Option name="hueMin" value="0" type="QString"/>
          <Option name="rampType" value="random" type="QString"/>
          <Option name="satMax" value="255" type="QString"/>
          <Option name="satMin" value="0" type="QString"/>
          <Option name="valMax" value="255" type="QString"/>
          <Option name="valMin" value="0" type="QString"/>
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
    <huesaturation colorizeOn="0" colorizeRed="255" colorizeBlue="128" saturation="0" colorizeGreen="128" grayscaleMode="0" colorizeStrength="100"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
