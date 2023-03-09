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
              <Option name="color1" value="169,129,90,255" type="QString"/>
              <Option name="color2" value="0,68,27,255" type="QString"/>
              <Option name="discrete" value="0" type="QString"/>
              <Option name="rampType" value="gradient" type="QString"/>
              <Option name="stops" value="0.502513;168,157,109,255:0.683417;131,184,115,255:0.753769;97,187,109,255:0.80402;64,170,92,255:0.854271;35,139,69,255:0.994975;0,109,44,255" type="QString"/>
            </Option>
            <prop v="169,129,90,255" k="color1"/>
            <prop v="0,68,27,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
            <prop v="0.502513;168,157,109,255:0.683417;131,184,115,255:0.753769;97,187,109,255:0.80402;64,170,92,255:0.854271;35,139,69,255:0.994975;0,109,44,255" k="stops"/>
          </colorramp>
          <item label="0.0000" value="0" color="#a9815a" alpha="255"/>
          <item label="0.5000" value="0.5" color="#a89d6d" alpha="255"/>
          <item label="0.6800" value="0.68" color="#83b873" alpha="255"/>
          <item label="0.7500" value="0.75" color="#61bb6d" alpha="255"/>
          <item label="0.8000" value="0.8" color="#40aa5c" alpha="255"/>
          <item label="0.8500" value="0.85" color="#238b45" alpha="255"/>
          <item label="0.9900" value="0.99" color="#006d2c" alpha="255"/>
          <item label="0.9950" value="0.995" color="#00441b" alpha="255"/>
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
