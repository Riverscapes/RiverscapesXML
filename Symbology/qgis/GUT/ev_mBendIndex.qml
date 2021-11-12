<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis minScale="0" maxScale="0" hasScaleBasedVisibilityFlag="0" version="3.20.1-Odense" styleCategories="AllStyleCategories">
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
      <resampling zoomedInResamplingMethod="nearestNeighbour" maxOversampling="2" zoomedOutResamplingMethod="nearestNeighbour" enabled="false"/>
    </provider>
    <rasterrenderer opacity="1" band="1" classificationMin="-0.666794419288635" classificationMax="0.794740617275238" nodataColor="" alphaBand="-1" type="singlebandpseudocolor">
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <rastershader>
        <colorrampshader maximumValue="0.79474061727523804" classificationMode="1" minimumValue="-0.66679441928863525" colorRampType="DISCRETE" clip="0" labelPrecision="6">
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
          <item label="&lt; -0.05 (Inside of Bend)" value="-0.05" alpha="255" color="#c2523c"/>
          <item label="-0.05 - 0.05 (Straight)" value="0.05" alpha="255" color="#e1e1e1"/>
          <item label="> 0.05 (Outside of Bend)" value="0.794740617275238" alpha="255" color="#0b2c7a"/>
          <rampLegendSettings minimumLabel="" prefix="" direction="0" useContinuousLegend="1" suffix="" orientation="2" maximumLabel="">
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
    <huesaturation colorizeOn="0" colorizeRed="255" colorizeBlue="128" saturation="0" colorizeGreen="128" grayscaleMode="0" colorizeStrength="100"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
