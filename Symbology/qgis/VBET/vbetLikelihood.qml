<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis minScale="1e+08" styleCategories="AllStyleCategories" version="3.18.2-Zürich" hasScaleBasedVisibilityFlag="0" maxScale="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal fetchMode="0" mode="0" enabled="0">
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
      <resampling zoomedInResamplingMethod="nearestNeighbour" zoomedOutResamplingMethod="nearestNeighbour" maxOversampling="2" enabled="false"/>
    </provider>
    <rasterrenderer opacity="0.6" alphaBand="-1" type="singlebandpseudocolor" classificationMin="0" nodataColor="" band="1" classificationMax="0.995">
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
        <colorrampshader minimumValue="0" clip="0" colorRampType="INTERPOLATED" maximumValue="0.995" labelPrecision="4" classificationMode="1">
          <colorramp name="[source]" type="gradient">
            <Option type="Map">
              <Option value="255,255,255,255" name="color1" type="QString"/>
              <Option value="48,48,182,255" name="color2" type="QString"/>
              <Option value="0" name="discrete" type="QString"/>
              <Option value="gradient" name="rampType" type="QString"/>
              <Option value="0.40201;200,126,57,255:0.502513;255,136,0,255:0.603015;255,217,0,255:0.683417;224,255,173,255:0.80402;123,255,0,255:0.994975;38,115,0,255" name="stops" type="QString"/>
            </Option>
            <prop k="color1" v="255,255,255,255"/>
            <prop k="color2" v="48,48,182,255"/>
            <prop k="discrete" v="0"/>
            <prop k="rampType" v="gradient"/>
            <prop k="stops" v="0.40201;200,126,57,255:0.502513;255,136,0,255:0.603015;255,217,0,255:0.683417;224,255,173,255:0.80402;123,255,0,255:0.994975;38,115,0,255"/>
          </colorramp>
          <item label="0.0000" color="#ffffff" value="0" alpha="255"/>
          <item label="0.4000" color="#c87e39" value="0.4" alpha="255"/>
          <item label="0.5000" color="#ff8800" value="0.5" alpha="255"/>
          <item label="0.6000" color="#ffd900" value="0.6" alpha="255"/>
          <item label="0.6800" color="#e0ffad" value="0.68" alpha="255"/>
          <item label="0.8000" color="#7bff00" value="0.8" alpha="255"/>
          <item label="0.9900" color="#267300" value="0.99" alpha="255"/>
          <item label="0.9950" color="#3030b6" value="0.995" alpha="255"/>
          <rampLegendSettings prefix="" minimumLabel="" useContinuousLegend="1" maximumLabel="" direction="0" suffix="" orientation="2">
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
    <brightnesscontrast contrast="0" brightness="0" gamma="1"/>
    <huesaturation colorizeRed="255" saturation="0" colorizeGreen="128" colorizeOn="0" colorizeBlue="128" grayscaleMode="0" colorizeStrength="100"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
