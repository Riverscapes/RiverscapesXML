<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis minScale="1e+08" maxScale="0" version="3.18.2-Zürich" styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0">
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
    <property value="false" key="WMSBackgroundLayer"/>
    <property value="false" key="WMSPublishDataSourceUrl"/>
    <property value="0" key="embeddedWidgets/count"/>
    <property value="Value" key="identify/format"/>
  </customproperties>
  <pipe>
    <provider>
      <resampling zoomedInResamplingMethod="nearestNeighbour" enabled="false" zoomedOutResamplingMethod="nearestNeighbour" maxOversampling="2"/>
    </provider>
    <rasterrenderer opacity="0.6" classificationMax="0.5" nodataColor="" band="1" classificationMin="0" alphaBand="-1" type="singlebandpseudocolor">
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
        <colorrampshader classificationMode="1" maximumValue="0.5" clip="0" labelPrecision="4" minimumValue="0" colorRampType="INTERPOLATED">
          <colorramp name="[source]" type="gradient">
            <Option type="Map">
              <Option value="73,177,79,255" name="color1" type="QString"/>
              <Option value="215,25,28,255" name="color2" type="QString"/>
              <Option value="0" name="discrete" type="QString"/>
              <Option value="gradient" name="rampType" type="QString"/>
              <Option value="0.1;222,242,180,255:0.2;254,190,116,255:0.3;246,144,83,255:0.4;231,84,55,255:0.6;221,49,39,255" name="stops" type="QString"/>
            </Option>
            <prop k="color1" v="73,177,79,255"/>
            <prop k="color2" v="215,25,28,255"/>
            <prop k="discrete" v="0"/>
            <prop k="rampType" v="gradient"/>
            <prop k="stops" v="0.1;222,242,180,255:0.2;254,190,116,255:0.3;246,144,83,255:0.4;231,84,55,255:0.6;221,49,39,255"/>
          </colorramp>
          <item label="0.0000" alpha="255" value="0" color="#49b14f"/>
          <item label="0.0500" alpha="255" value="0.05" color="#def2b4"/>
          <item label="0.1000" alpha="255" value="0.1" color="#febe74"/>
          <item label="0.1500" alpha="255" value="0.15" color="#f69053"/>
          <item label="0.2000" alpha="255" value="0.2" color="#e75437"/>
          <item label="0.3000" alpha="255" value="0.3" color="#dd3127"/>
          <item label="0.5000" alpha="255" value="0.5" color="#d7191c"/>
          <rampLegendSettings direction="0" suffix="" minimumLabel="" maximumLabel="" orientation="2" prefix="" useContinuousLegend="1">
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
    <huesaturation colorizeOn="0" colorizeBlue="128" colorizeGreen="128" grayscaleMode="0" saturation="0" colorizeRed="255" colorizeStrength="100"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
