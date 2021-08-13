<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.18.2-Zürich" minScale="1e+08" maxScale="0" hasScaleBasedVisibilityFlag="0" styleCategories="AllStyleCategories">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal mode="0" fetchMode="0" enabled="0">
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
      <resampling zoomedOutResamplingMethod="nearestNeighbour" zoomedInResamplingMethod="nearestNeighbour" maxOversampling="2" enabled="false"/>
    </provider>
    <rasterrenderer type="singlebandpseudocolor" band="1" opacity="0.6" nodataColor="" classificationMax="6.2831855" classificationMin="0" alphaBand="-1">
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
        <colorrampshader classificationMode="1" clip="0" labelPrecision="4" minimumValue="0" colorRampType="DISCRETE" maximumValue="6.2831855">
          <colorramp name="[source]" type="gradient">
            <Option type="Map">
              <Option name="color1" type="QString" value="246,233,39,255"/>
              <Option name="color2" type="QString" value="66,231,80,255"/>
              <Option name="discrete" type="QString" value="0"/>
              <Option name="rampType" type="QString" value="gradient"/>
              <Option name="stops" type="QString" value="0.159155;246,233,39,255:0.31831;223,153,21,255:0.477465;230,16,37,255:0.63662;209,28,201,255:0.795775;32,25,223,255:0.95493;116,145,230,255:1.11408;108,239,243,255"/>
            </Option>
            <prop k="color1" v="246,233,39,255"/>
            <prop k="color2" v="66,231,80,255"/>
            <prop k="discrete" v="0"/>
            <prop k="rampType" v="gradient"/>
            <prop k="stops" v="0.159155;246,233,39,255:0.31831;223,153,21,255:0.477465;230,16,37,255:0.63662;209,28,201,255:0.795775;32,25,223,255:0.95493;116,145,230,255:1.11408;108,239,243,255"/>
          </colorramp>
          <item color="#f6e927" label="East" value="1" alpha="255"/>
          <item color="#df9915" label="Northeast" value="2" alpha="255"/>
          <item color="#e61025" label="North" value="3" alpha="255"/>
          <item color="#d11cc9" label="Northwest" value="4" alpha="255"/>
          <item color="#2019df" label="West" value="5" alpha="255"/>
          <item color="#7491e6" label="Southwest" value="6" alpha="255"/>
          <item color="#6ceff3" label="South" value="7" alpha="255"/>
          <item color="#42e750" label="Southeast" value="8" alpha="255"/>
          <rampLegendSettings maximumLabel="" useContinuousLegend="1" prefix="" suffix="" minimumLabel="" direction="0" orientation="2">
            <numericFormat id="basic">
              <Option type="Map">
                <Option name="decimal_separator" type="QChar" value=""/>
                <Option name="decimals" type="int" value="6"/>
                <Option name="rounding_type" type="int" value="0"/>
                <Option name="show_plus" type="bool" value="false"/>
                <Option name="show_thousand_separator" type="bool" value="true"/>
                <Option name="show_trailing_zeros" type="bool" value="false"/>
                <Option name="thousand_separator" type="QChar" value=""/>
              </Option>
            </numericFormat>
          </rampLegendSettings>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast contrast="0" gamma="1" brightness="0"/>
    <huesaturation colorizeRed="255" saturation="0" grayscaleMode="0" colorizeOn="0" colorizeStrength="100" colorizeBlue="128" colorizeGreen="128"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
