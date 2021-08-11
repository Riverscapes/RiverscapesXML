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
    <rasterrenderer type="singlebandpseudocolor" band="1" opacity="0.6" nodataColor="" classificationMax="10000" classificationMin="5" alphaBand="-1">
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
        <colorrampshader classificationMode="1" clip="0" labelPrecision="4" minimumValue="5" colorRampType="INTERPOLATED" maximumValue="10000">
          <colorramp name="[source]" type="gradient">
            <Option type="Map">
              <Option name="color1" type="QString" value="241,238,246,255"/>
              <Option name="color2" type="QString" value="24,2,132,255"/>
              <Option name="discrete" type="QString" value="0"/>
              <Option name="rampType" type="QString" value="gradient"/>
              <Option name="stops" type="QString" value="0.00050025;241,238,246,255:0.002001;194,238,246,255:0.00950475;90,203,240,255:0.0245123;12,179,244,255:0.0495248;19,130,220,255:0.0995498;62,90,229,255"/>
            </Option>
            <prop k="color1" v="241,238,246,255"/>
            <prop k="color2" v="24,2,132,255"/>
            <prop k="discrete" v="0"/>
            <prop k="rampType" v="gradient"/>
            <prop k="stops" v="0.00050025;241,238,246,255:0.002001;194,238,246,255:0.00950475;90,203,240,255:0.0245123;12,179,244,255:0.0495248;19,130,220,255:0.0995498;62,90,229,255"/>
          </colorramp>
          <item color="#f1eef6" label="5.0000" value="5" alpha="255"/>
          <item color="#f1eef6" label="10.0000" value="10" alpha="255"/>
          <item color="#c2eef6" label="25.0000" value="25" alpha="255"/>
          <item color="#5acbf0" label="100.0000" value="100" alpha="255"/>
          <item color="#0cb3f4" label="250.0000" value="250" alpha="255"/>
          <item color="#1382dc" label="500.0000" value="500" alpha="255"/>
          <item color="#3e5ae5" label="1000.0000" value="1000" alpha="255"/>
          <item color="#180284" label="10000.0000" value="10000" alpha="255"/>
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
