<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="AllStyleCategories" maxScale="0" minScale="0" version="3.20.1-Odense" hasScaleBasedVisibilityFlag="0">
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
    <Option/>
  </customproperties>
  <pipe>
    <provider>
      <resampling maxOversampling="2" enabled="false" zoomedInResamplingMethod="nearestNeighbour" zoomedOutResamplingMethod="nearestNeighbour"/>
    </provider>
    <rasterrenderer band="1" classificationMax="1" classificationMin="0" type="singlebandpseudocolor" alphaBand="-1" opacity="0.7" nodataColor="">
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <rastershader>
        <colorrampshader maximumValue="1" classificationMode="1" labelPrecision="6" colorRampType="DISCRETE" clip="0" minimumValue="0">
          <colorramp name="[source]" type="gradient">
            <Option type="Map">
              <Option name="color1" value="255,255,127,255" type="QString"/>
              <Option name="color2" value="12,16,120,255" type="QString"/>
              <Option name="discrete" value="0" type="QString"/>
              <Option name="rampType" value="gradient" type="QString"/>
              <Option name="stops" value="0.333333;56,224,9,255:0.666667;26,147,171,255" type="QString"/>
            </Option>
            <prop v="255,255,127,255" k="color1"/>
            <prop v="12,16,120,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
            <prop v="0.333333;56,224,9,255:0.666667;26,147,171,255" k="stops"/>
          </colorramp>
          <item alpha="255" value="0" color="#ffff7f" label="0.0 (Non-concavity)"/>
          <item alpha="255" value="0.1" color="#c8f760" label="0.0 - 0.1 (Shallowest concavity)"/>
          <item alpha="255" value="0.2" color="#8ff041" label="0.1 - 0.2"/>
          <item alpha="255" value="0.3" color="#51e61c" label="0.2 - 0.3"/>
          <item alpha="255" value="0.4" color="#3dd13b" label="0.3 - 0.4"/>
          <item alpha="255" value="0.5" color="#3db868" label="0.4 - 0.5"/>
          <item alpha="255" value="0.6" color="#2fa190" label="0.5 - 0.6"/>
          <item alpha="255" value="0.7" color="#1e84a6" label="0.6 - 0.7"/>
          <item alpha="255" value="0.8" color="#215896" label="0.7 - 0.8"/>
          <item alpha="255" value="0.9" color="#1c3487" label="0.8 - 0.9"/>
          <item alpha="255" value="1" color="#0d1178" label="0.9 - 1.0  (Deepest concavity)"/>
          <rampLegendSettings orientation="2" minimumLabel="" maximumLabel="" useContinuousLegend="1" suffix="" direction="0" prefix="">
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
    <brightnesscontrast contrast="0" brightness="0" gamma="1"/>
    <huesaturation colorizeRed="255" colorizeBlue="128" grayscaleMode="0" colorizeOn="0" colorizeStrength="100" saturation="0" colorizeGreen="128"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
