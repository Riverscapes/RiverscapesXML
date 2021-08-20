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
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <rastershader>
        <colorrampshader minimumValue="0" colorRampType="INTERPOLATED" labelPrecision="4" maximumValue="0.995" classificationMode="1" clip="0">
          <colorramp name="[source]" type="gradient">
            <Option type="Map">
              <Option name="color1" value="211,137,0,255" type="QString"/>
              <Option name="color2" value="8,48,107,255" type="QString"/>
              <Option name="discrete" value="0" type="QString"/>
              <Option name="rampType" value="gradient" type="QString"/>
              <Option name="stops" value="0.683417;255,236,176,255:0.753769;107,174,47,255:0.80402;66,146,198,255:0.854271;33,113,181,255:0.994975;8,81,156,255" type="QString"/>
            </Option>
            <prop v="211,137,0,255" k="color1"/>
            <prop v="8,48,107,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
            <prop v="0.683417;255,236,176,255:0.753769;107,174,47,255:0.80402;66,146,198,255:0.854271;33,113,181,255:0.994975;8,81,156,255" k="stops"/>
          </colorramp>
          <item label="0.0000" value="0" color="#d38900" alpha="255"/>
          <item label="0.6800" value="0.68" color="#ffecb0" alpha="255"/>
          <item label="0.7500" value="0.75" color="#6bae2f" alpha="255"/>
          <item label="0.8000" value="0.8" color="#4292c6" alpha="255"/>
          <item label="0.8500" value="0.85" color="#2171b5" alpha="255"/>
          <item label="0.9900" value="0.99" color="#08519c" alpha="255"/>
          <item label="0.9950" value="0.995" color="#08306b" alpha="255"/>
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
