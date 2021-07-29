<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" styleCategories="AllStyleCategories" version="3.16.8-Hannover" hasScaleBasedVisibilityFlag="0" minScale="1e+08">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <temporal enabled="0" fetchMode="0" mode="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <customproperties>
    <property value="false" key="WMSBackgroundLayer"/>
    <property value="false" key="WMSPublishDataSourceUrl"/>
    <property value="0" key="embeddedWidgets/count"/>
    <property value="Value" key="identify/format"/>
  </customproperties>
  <pipe>
    <provider>
      <resampling enabled="false" maxOversampling="2" zoomedInResamplingMethod="nearestNeighbour" zoomedOutResamplingMethod="nearestNeighbour"/>
    </provider>
    <rasterrenderer type="singlebandpseudocolor" band="1" classificationMin="0" alphaBand="-1" classificationMax="60" opacity="0.5" nodataColor="">
      <rasterTransparency/>
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <rastershader>
        <colorrampshader clip="0" colorRampType="INTERPOLATED" minimumValue="0" labelPrecision="4" maximumValue="60" classificationMode="1">
          <colorramp type="gradient" name="[source]">
            <prop v="11,44,122,255" k="color1"/>
            <prop v="194,82,60,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
            <prop v="0.18;32,153,143,255:0.436;0,219,0,255:0.59;255,255,0,255:0.846;237,161,19,255" k="stops"/>
          </colorramp>
          <item color="#0b2c7a" alpha="255" value="0" label="0.0000"/>
          <item color="#1d898c" alpha="255" value="9.24" label=" "/>
          <item color="#03d40f" alpha="255" value="24.599999999999998" label=" "/>
          <item color="#d4f900" alpha="255" value="33.839999999999996" label=" "/>
          <item color="#efaa11" alpha="255" value="49.199999999999996" label=" "/>
          <item color="#c2523c" alpha="255" value="60" label="60.0000"/>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast contrast="0" brightness="0" gamma="1"/>
    <huesaturation grayscaleMode="0" colorizeStrength="100" saturation="0" colorizeOn="0" colorizeGreen="128" colorizeBlue="128" colorizeRed="255"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
