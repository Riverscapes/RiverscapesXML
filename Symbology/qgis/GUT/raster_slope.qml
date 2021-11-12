<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis minScale="0" version="3.20.1-Odense" maxScale="0" styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0">
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
      <resampling enabled="false" maxOversampling="2" zoomedOutResamplingMethod="nearestNeighbour" zoomedInResamplingMethod="nearestNeighbour"/>
    </provider>
    <rasterrenderer classificationMax="50" alphaBand="-1" type="singlebandpseudocolor" band="1" classificationMin="0" opacity="1" nodataColor="">
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <rastershader>
        <colorrampshader classificationMode="1" maximumValue="50" labelPrecision="6" minimumValue="0" colorRampType="DISCRETE" clip="0">
          <colorramp name="[source]" type="gradient">
            <Option type="Map">
              <Option name="color1" value="0,0,0,255" type="QString"/>
              <Option name="color2" value="255,255,255,255" type="QString"/>
              <Option name="discrete" value="0" type="QString"/>
              <Option name="rampType" value="gradient" type="QString"/>
            </Option>
            <prop v="0,0,0,255" k="color1"/>
            <prop v="255,255,255,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
          </colorramp>
          <item color="#fff3cf" value="0.5" alpha="255" label="0 - 0.5"/>
          <item color="#ffe9b6" value="1" alpha="255" label="0.5 - 1"/>
          <item color="#ffdf9f" value="1.5" alpha="255" label="1.000000001 - 1.5"/>
          <item color="#ffd587" value="2" alpha="255" label="1.500000001 - 2"/>
          <item color="#ffcb63" value="3" alpha="255" label="2.000000001 - 3"/>
          <item color="#ffb263" value="4" alpha="255" label="3.000000001 - 4"/>
          <item color="#ff9763" value="5" alpha="255" label="4.000000001 - 5"/>
          <item color="#ff7d63" value="7" alpha="255" label="5.000000001 - 7"/>
          <item color="#bfabab" value="10" alpha="255" label="7.000000001 - 10"/>
          <item color="#b3b3b3" value="15" alpha="255" label="10.00000001 - 15"/>
          <item color="#000000" value="50" alpha="255" label="15.00000001 - 50"/>
          <rampLegendSettings direction="0" useContinuousLegend="1" minimumLabel="" suffix="" maximumLabel="" orientation="2" prefix="">
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
    <brightnesscontrast gamma="1" contrast="0" brightness="0"/>
    <huesaturation colorizeBlue="128" colorizeOn="0" saturation="0" colorizeGreen="128" grayscaleMode="0" colorizeRed="255" colorizeStrength="100"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
