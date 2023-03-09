<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.18.2-Zürich" maxScale="0" minScale="1e+08" hasScaleBasedVisibilityFlag="0" styleCategories="AllStyleCategories">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal enabled="0" mode="0" fetchMode="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <customproperties>
    <property key="WMSBackgroundLayer" value="false"/>
    <property key="WMSPublishDataSourceUrl" value="false"/>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="identify/format" value="Value"/>
  </customproperties>
  <pipe>
    <provider>
      <resampling maxOversampling="2" enabled="false" zoomedOutResamplingMethod="nearestNeighbour" zoomedInResamplingMethod="nearestNeighbour"/>
    </provider>
    <rasterrenderer opacity="0.6" band="1" classificationMax="0.995" nodataColor="" alphaBand="-1" classificationMin="0" type="singlebandpseudocolor">
      <rasterTransparency/>
      <minMaxOrigin>
        <limits>MinMax</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <rastershader>
        <colorrampshader minimumValue="0" colorRampType="INTERPOLATED" labelPrecision="-10" maximumValue="0.995" classificationMode="1" clip="0">
          <colorramp name="[source]" type="gradient">
            <Option type="Map">
              <Option name="color1" value="252,252,252,255" type="QString"/>
              <Option name="color2" value="0,77,168,255" type="QString"/>
              <Option name="discrete" value="0" type="QString"/>
              <Option name="rampType" value="gradient" type="QString"/>
              <Option name="stops" value="0.100503;156,156,156,255:0.201005;145,133,104,255:0.301508;242,171,0,255:0.40201;255,229,158,255:0.502513;255,248,199,255:0.683417;195,252,91,255:0.703518;147,219,94,255:0.80402;127,189,93,255:0.854271;121,172,96,255:0.994975;38,115,0,255" type="QString"/>
            </Option>
            <prop v="252,252,252,255" k="color1"/>
            <prop v="0,77,168,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
            <prop v="0.100503;156,156,156,255:0.201005;145,133,104,255:0.301508;242,171,0,255:0.40201;255,229,158,255:0.502513;255,248,199,255:0.683417;195,252,91,255:0.703518;147,219,94,255:0.80402;127,189,93,255:0.854271;121,172,96,255:0.994975;38,115,0,255" k="stops"/>
          </colorramp>
          <item label="0 " value="0" color="#fcfcfc" alpha="255"/>
          <item label="0 " value="0.1" color="#9c9c9c" alpha="255"/>
          <item label="0 " value="0.2" color="#918568" alpha="255"/>
          <item label="0 " value="0.3" color="#f2ab00" alpha="255"/>
          <item label="0 " value="0.4" color="#ffe59e" alpha="255"/>
          <item label="0 " value="0.5" color="#fff8c7" alpha="255"/>
          <item label="0 " value="0.68" color="#c3fc5b" alpha="255"/>
          <item label="0 " value="0.7" color="#93db5e" alpha="255"/>
          <item label="0 " value="0.8" color="#7fbd5d" alpha="255"/>
          <item label="0 " value="0.85" color="#79ac60" alpha="255"/>
          <item label="0 " value="0.99" color="#267300" alpha="255"/>
          <item label="0 " value="0.995" color="#004da8" alpha="255"/>
          <rampLegendSettings direction="0" maximumLabel="" suffix="" prefix="" orientation="2" useContinuousLegend="1" minimumLabel="">
            <numericFormat id="basic">
              <Option type="Map">
                <Option name="decimal_separator" value="" type="QChar"/>
                <Option name="decimals" value="6" type="int"/>
                <Option name="rounding_type" value="0" type="int"/>
                <Option name="show_plus" value="false" type="bool"/>
                <Option name="show_thousand_separator" value="true" type="bool"/>
                <Option name="show_trailing_zeros" value="false" type="bool"/>
                <Option name="thousand_separator" value="" type="QChar"/>
              </Option>
            </numericFormat>
          </rampLegendSettings>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast brightness="0" contrast="0" gamma="1"/>
    <huesaturation colorizeOn="0" colorizeRed="255" colorizeBlue="128" colorizeGreen="128" colorizeStrength="100" saturation="0" grayscaleMode="0"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
