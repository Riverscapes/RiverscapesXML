<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" version="3.18.2-Zürich" minScale="1e+08">
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
      <resampling maxOversampling="2" zoomedInResamplingMethod="nearestNeighbour" enabled="false" zoomedOutResamplingMethod="nearestNeighbour"/>
    </provider>
    <rasterrenderer classificationMin="0" type="singlebandpseudocolor" band="1" nodataColor="" classificationMax="30" opacity="0.4" alphaBand="-1">
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
        <colorrampshader colorRampType="DISCRETE" classificationMode="1" clip="0" maximumValue="30" labelPrecision="4" minimumValue="0">
          <colorramp type="gradient" name="[source]">
            <Option type="Map">
              <Option type="QString" value="0,97,0,255" name="color1"/>
              <Option type="QString" value="255,34,0,255" name="color2"/>
              <Option type="QString" value="0" name="discrete"/>
              <Option type="QString" value="gradient" name="rampType"/>
              <Option type="QString" value="0.166667;0,97,0,255:0.333333;123,171,0,255:0.666667;255,255,0,255:1;255,153,0,255" name="stops"/>
            </Option>
            <prop v="0,97,0,255" k="color1"/>
            <prop v="255,34,0,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
            <prop v="0.166667;0,97,0,255:0.333333;123,171,0,255:0.666667;255,255,0,255:1;255,153,0,255" k="stops"/>
          </colorramp>
          <item label="0 - 5" value="5" alpha="255" color="#006100"/>
          <item label="5 -10" value="10" alpha="255" color="#7bab00"/>
          <item label="10 -20" value="20" alpha="255" color="#ffff00"/>
          <item label="20 - 30" value="30" alpha="255" color="#ff9900"/>
          <item label="> 30" value="90" alpha="255" color="#ff2200"/>
          <rampLegendSettings direction="0" minimumLabel="" suffix="" prefix="" orientation="2" useContinuousLegend="1" maximumLabel="">
            <numericFormat id="basic">
              <Option type="Map">
                <Option type="QChar" value="" name="decimal_separator"/>
                <Option type="int" value="6" name="decimals"/>
                <Option type="int" value="0" name="rounding_type"/>
                <Option type="bool" value="false" name="show_plus"/>
                <Option type="bool" value="true" name="show_thousand_separator"/>
                <Option type="bool" value="false" name="show_trailing_zeros"/>
                <Option type="QChar" value="" name="thousand_separator"/>
              </Option>
            </numericFormat>
          </rampLegendSettings>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast brightness="0" contrast="0" gamma="1"/>
    <huesaturation grayscaleMode="0" colorizeOn="0" colorizeGreen="128" saturation="0" colorizeRed="255" colorizeBlue="128" colorizeStrength="100"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
