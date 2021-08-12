<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.20.0-Odense" hasScaleBasedVisibilityFlag="0" maxScale="0" styleCategories="AllStyleCategories" minScale="0">
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
      <resampling zoomedInResamplingMethod="nearestNeighbour" zoomedOutResamplingMethod="nearestNeighbour" enabled="false" maxOversampling="2"/>
    </provider>
    <rasterrenderer alphaBand="-1" nodataColor="" band="1" type="paletted" opacity="0.6">
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <colorPalette>
        <paletteEntry value="0" color="#006100" alpha="255" label="Not Developed"/>
        <paletteEntry value="0.33000000000000002" color="#a4c400" alpha="255" label="Agriculture: Lower Intensity"/>
        <paletteEntry value="0.66000000000000003" color="#ffbb00" alpha="255" label="Agriculture: Higher Intensity"/>
        <paletteEntry value="1" color="#ff2600" alpha="255" label="Developed/Urban"/>
      </colorPalette>
      <colorramp name="[source]" type="gradient">
        <Option type="Map">
          <Option value="0,97,0,255" name="color1" type="QString"/>
          <Option value="255,34,0,255" name="color2" type="QString"/>
          <Option value="0" name="discrete" type="QString"/>
          <Option value="gradient" name="rampType" type="QString"/>
          <Option value="0.5;255,255,0,255" name="stops" type="QString"/>
        </Option>
        <prop v="0,97,0,255" k="color1"/>
        <prop v="255,34,0,255" k="color2"/>
        <prop v="0" k="discrete"/>
        <prop v="gradient" k="rampType"/>
        <prop v="0.5;255,255,0,255" k="stops"/>
      </colorramp>
    </rasterrenderer>
    <brightnesscontrast contrast="0" gamma="1" brightness="0"/>
    <huesaturation colorizeStrength="100" colorizeBlue="128" colorizeRed="255" saturation="0" grayscaleMode="0" colorizeOn="0" colorizeGreen="128"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
