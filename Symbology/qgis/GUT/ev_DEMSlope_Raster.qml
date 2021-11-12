<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" maxScale="0" version="3.20.1-Odense" styleCategories="AllStyleCategories" minScale="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal fetchMode="0" enabled="0" mode="0">
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
      <resampling zoomedInResamplingMethod="nearestNeighbour" maxOversampling="2" enabled="false" zoomedOutResamplingMethod="nearestNeighbour"/>
    </provider>
    <rasterrenderer opacity="0.6" classificationMax="90" band="1" alphaBand="-1" nodataColor="" classificationMin="0" type="singlebandpseudocolor">
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <rastershader>
        <colorrampshader minimumValue="0" classificationMode="1" clip="0" colorRampType="DISCRETE" maximumValue="90" labelPrecision="6">
          <colorramp name="[source]" type="gradient">
            <Option type="Map">
              <Option name="color1" value="255,255,127,255" type="QString"/>
              <Option name="color2" value="107,0,0,255" type="QString"/>
              <Option name="discrete" value="0" type="QString"/>
              <Option name="rampType" value="gradient" type="QString"/>
              <Option name="stops" value="0.5;242,167,46,255" type="QString"/>
            </Option>
            <prop v="255,255,127,255" k="color1"/>
            <prop v="107,0,0,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
            <prop v="0.5;242,167,46,255" k="stops"/>
          </colorramp>
          <item value="2" alpha="255" color="#fff3cf" label="0 - 2"/>
          <item value="5" alpha="255" color="#ffe9b6" label="2.000000001 - 5"/>
          <item value="10" alpha="255" color="#ffdf9f" label="5.000000001 - 10"/>
          <item value="15" alpha="255" color="#ffd587" label="10.00000001 - 15"/>
          <item value="25" alpha="255" color="#ffcb63" label="15.00000001 - 25"/>
          <item value="35" alpha="255" color="#ffb263" label="25.00000001 - 35"/>
          <item value="45" alpha="255" color="#ff9763" label="35.00000001 - 45"/>
          <item value="60" alpha="255" color="#ff7d63" label="45.00000001 - 60"/>
          <item value="80" alpha="255" color="#bfabab" label="60.00000001 - 80"/>
          <item value="90" alpha="255" color="#b3b3b3" label="80.00000001 - 90"/>
          <rampLegendSettings maximumLabel="" orientation="2" useContinuousLegend="1" direction="0" minimumLabel="" suffix="" prefix="">
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
    <brightnesscontrast gamma="1" brightness="0" contrast="0"/>
    <huesaturation colorizeBlue="128" colorizeOn="0" colorizeRed="255" grayscaleMode="0" saturation="0" colorizeStrength="100" colorizeGreen="128"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
