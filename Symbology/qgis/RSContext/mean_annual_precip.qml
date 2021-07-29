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
    <rasterrenderer type="singlebandpseudocolor" band="1" classificationMin="1253.63" alphaBand="-1" classificationMax="2544.69" opacity="0.5" nodataColor="">
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
        <colorrampshader clip="0" colorRampType="INTERPOLATED" minimumValue="1253.6300000000001" labelPrecision="2" maximumValue="2544.6900000000001" classificationMode="1">
          <colorramp type="gradient" name="[source]">
            <prop v="128,0,2,255" k="color1"/>
            <prop v="255,252,255,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
            <prop v="0.163462;255,128,0,255:0.270433;255,255,0,255:0.378606;0,255,0,255:0.503606;0,255,255,255:0.63;2,0,255,255:0.686;255,0,255,255:0.882;255,252,255,255" k="stops"/>
          </colorramp>
          <item color="#800002" alpha="255" value="1253.63" label="Low : 1253.63"/>
          <item color="#ff8000" alpha="255" value="1464.668653846154" label=" "/>
          <item color="#ffff00" alpha="255" value="1602.7748317307692" label=" "/>
          <item color="#00ff00" alpha="255" value="1742.432764423077" label=" "/>
          <item color="#00ffff" alpha="255" value="1903.8152644230772" label=" "/>
          <item color="#0200ff" alpha="255" value="2066.9978" label=" "/>
          <item color="#ff00ff" alpha="255" value="2139.29716" label=" "/>
          <item color="#fffcff" alpha="255" value="2392.34492" label=" "/>
          <item color="#fffcff" alpha="255" value="2544.69" label="High : 2544.69"/>
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
