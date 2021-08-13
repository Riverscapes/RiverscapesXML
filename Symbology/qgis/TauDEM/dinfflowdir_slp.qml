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
    <rasterrenderer type="singlebandpseudocolor" band="1" opacity="0.6" nodataColor="" classificationMax="0.5" classificationMin="0" alphaBand="-1">
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
        <colorrampshader classificationMode="1" clip="0" labelPrecision="4" minimumValue="0" colorRampType="INTERPOLATED" maximumValue="0.5">
          <colorramp name="[source]" type="gradient">
            <Option type="Map">
              <Option name="color1" type="QString" value="215,25,28,255"/>
              <Option name="color2" type="QString" value="73,177,79,255"/>
              <Option name="discrete" type="QString" value="0"/>
              <Option name="rampType" type="QString" value="gradient"/>
              <Option name="stops" type="QString" value="0.04;221,49,39,255:0.1;231,84,55,255:0.2;246,144,83,255:0.3;254,190,116,255:0.6;222,242,180,255"/>
            </Option>
            <prop k="color1" v="215,25,28,255"/>
            <prop k="color2" v="73,177,79,255"/>
            <prop k="discrete" v="0"/>
            <prop k="rampType" v="gradient"/>
            <prop k="stops" v="0.04;221,49,39,255:0.1;231,84,55,255:0.2;246,144,83,255:0.3;254,190,116,255:0.6;222,242,180,255"/>
          </colorramp>
          <item color="#d7191c" label="0.0000" value="0" alpha="255"/>
          <item color="#dd3127" label="0.0200" value="0.02" alpha="255"/>
          <item color="#e75437" label="0.0500" value="0.05" alpha="255"/>
          <item color="#f69053" label="0.1000" value="0.1" alpha="255"/>
          <item color="#febe74" label="0.1500" value="0.15" alpha="255"/>
          <item color="#def2b4" label="0.3000" value="0.3" alpha="255"/>
          <item color="#49b14f" label="0.5000" value="0.5" alpha="255"/>
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
