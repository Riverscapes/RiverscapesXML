<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.20.0-Odense" hasScaleBasedVisibilityFlag="0" maxScale="0" styleCategories="AllStyleCategories" minScale="0">
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
    <Option type="Map">
      <Option value="false" name="WMSBackgroundLayer" type="bool"/>
      <Option value="false" name="WMSPublishDataSourceUrl" type="bool"/>
      <Option value="0" name="embeddedWidgets/count" type="int"/>
    </Option>
  </customproperties>
  <pipe>
    <provider>
      <resampling zoomedInResamplingMethod="nearestNeighbour" zoomedOutResamplingMethod="nearestNeighbour" enabled="false" maxOversampling="2"/>
    </provider>
    <rasterrenderer classificationMax="10" alphaBand="-1" classificationMin="0" nodataColor="" band="1" type="singlebandpseudocolor" opacity="0.6">
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
        <colorrampshader colorRampType="INTERPOLATED" clip="0" minimumValue="0" classificationMode="1" maximumValue="10" labelPrecision="6">
          <colorramp name="[source]" type="gradient">
            <Option type="Map">
              <Option value="255,255,127,255" name="color1" type="QString"/>
              <Option value="12,16,120,255" name="color2" type="QString"/>
              <Option value="0" name="discrete" type="QString"/>
              <Option value="gradient" name="rampType" type="QString"/>
              <Option value="0.333333;56,224,9,255:0.666667;26,147,171,255" name="stops" type="QString"/>
            </Option>
            <prop v="255,255,127,255" k="color1"/>
            <prop v="12,16,120,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
            <prop v="0.333333;56,224,9,255:0.666667;26,147,171,255" k="stops"/>
          </colorramp>
          <item value="0" label="0.000000" color="#ffff7f" alpha="255"/>
          <item value="3.33333" label="3.333330" color="#38e009" alpha="255"/>
          <item value="6.66667" label="6.666670" color="#1a93ab" alpha="255"/>
          <item value="10" label="10.000000" color="#0c1078" alpha="255"/>
          <rampLegendSettings direction="0" orientation="2" suffix="" maximumLabel="" prefix="" useContinuousLegend="1" minimumLabel="">
            <numericFormat id="basic">
              <Option type="Map">
                <Option value="" name="decimal_separator" type="QChar"/>
                <Option value="6" name="decimals" type="int"/>
                <Option value="0" name="rounding_type" type="int"/>
                <Option value="false" name="show_plus" type="bool"/>
                <Option value="true" name="show_thousand_separator" type="bool"/>
                <Option value="false" name="show_trailing_zeros" type="bool"/>
                <Option value="" name="thousand_separator" type="QChar"/>
              </Option>
            </numericFormat>
          </rampLegendSettings>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast contrast="0" gamma="1" brightness="0"/>
    <huesaturation colorizeStrength="100" colorizeBlue="128" colorizeRed="255" saturation="0" grayscaleMode="0" colorizeOn="0" colorizeGreen="128"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
