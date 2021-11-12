<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.20.1-Odense" minScale="0" hasScaleBasedVisibilityFlag="0" styleCategories="AllStyleCategories" maxScale="0">
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
      <Option name="identify/format" value="Value" type="QString"/>
    </Option>
  </customproperties>
  <pipe>
    <provider>
      <resampling enabled="false" zoomedOutResamplingMethod="nearestNeighbour" maxOversampling="2" zoomedInResamplingMethod="nearestNeighbour"/>
    </provider>
    <rasterrenderer nodataColor="" classificationMax="0.75" opacity="0.6" alphaBand="-1" type="singlebandpseudocolor" band="1" classificationMin="-0.6328125">
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <rastershader>
        <colorrampshader colorRampType="DISCRETE" maximumValue="0.75" labelPrecision="6" classificationMode="1" minimumValue="-0.6328125" clip="0">
          <colorramp name="[source]" type="gradient">
            <Option type="Map">
              <Option name="color1" value="255,0,0,255" type="QString"/>
              <Option name="color2" value="0,0,255,255" type="QString"/>
              <Option name="discrete" value="0" type="QString"/>
              <Option name="rampType" value="gradient" type="QString"/>
              <Option name="stops" value="0.333333;255,255,0,255:0.666667;0,255,255,255" type="QString"/>
            </Option>
            <prop v="255,0,0,255" k="color1"/>
            <prop v="0,0,255,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
            <prop v="0.333333;255,255,0,255:0.666667;0,255,255,255" k="stops"/>
          </colorramp>
          <item color="#0b2c7a" alpha="255" label="-1 - -0.25" value="-0.25"/>
          <item color="#20998f" alpha="255" label="-0.25 - -0.1" value="-0.1"/>
          <item color="#00db00" alpha="255" label="-0.01 - 0" value="0"/>
          <item color="#ffff00" alpha="255" label="0 - 0.1" value="0.1"/>
          <item color="#eda113" alpha="255" label="0.10 - 0.25" value="0.25"/>
          <item color="#c2523c" alpha="255" label="0.25 - 0.75" value="0.75"/>
          <rampLegendSettings prefix="" useContinuousLegend="1" minimumLabel="" maximumLabel="" direction="0" suffix="" orientation="2">
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
    <huesaturation colorizeGreen="128" colorizeStrength="100" colorizeRed="255" saturation="0" grayscaleMode="0" colorizeOn="0" colorizeBlue="128"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
