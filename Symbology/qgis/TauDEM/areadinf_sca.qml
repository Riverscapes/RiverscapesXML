<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" version="3.18.2-Zürich" minScale="1e+08" maxScale="0">
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
    <property value="false" key="WMSBackgroundLayer"/>
    <property value="false" key="WMSPublishDataSourceUrl"/>
    <property value="0" key="embeddedWidgets/count"/>
    <property value="Value" key="identify/format"/>
  </customproperties>
  <pipe>
    <provider>
      <resampling maxOversampling="2" enabled="false" zoomedInResamplingMethod="nearestNeighbour" zoomedOutResamplingMethod="nearestNeighbour"/>
    </provider>
    <rasterrenderer type="singlebandpseudocolor" opacity="0.6" nodataColor="" classificationMin="5" alphaBand="-1" classificationMax="10000" band="1">
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
        <colorrampshader minimumValue="5" clip="0" classificationMode="1" labelPrecision="4" maximumValue="10000" colorRampType="INTERPOLATED">
          <colorramp type="gradient" name="[source]">
            <Option type="Map">
              <Option type="QString" name="color1" value="241,238,246,255"/>
              <Option type="QString" name="color2" value="24,2,132,255"/>
              <Option type="QString" name="discrete" value="0"/>
              <Option type="QString" name="rampType" value="gradient"/>
              <Option type="QString" name="stops" value="0.00050025;241,238,246,255:0.002001;194,238,246,255:0.00950475;90,203,240,255:0.0245123;12,179,244,255:0.0495248;19,130,220,255:0.0995498;62,90,229,255"/>
            </Option>
            <prop k="color1" v="241,238,246,255"/>
            <prop k="color2" v="24,2,132,255"/>
            <prop k="discrete" v="0"/>
            <prop k="rampType" v="gradient"/>
            <prop k="stops" v="0.00050025;241,238,246,255:0.002001;194,238,246,255:0.00950475;90,203,240,255:0.0245123;12,179,244,255:0.0495248;19,130,220,255:0.0995498;62,90,229,255"/>
          </colorramp>
          <item alpha="255" color="#f1eef6" value="5" label="5.0000"/>
          <item alpha="255" color="#f1eef6" value="10" label="10.0000"/>
          <item alpha="255" color="#c2eef6" value="25" label="25.0000"/>
          <item alpha="255" color="#5acbf0" value="100" label="100.0000"/>
          <item alpha="255" color="#0cb3f4" value="250" label="250.0000"/>
          <item alpha="255" color="#1382dc" value="500" label="500.0000"/>
          <item alpha="255" color="#3e5ae5" value="1000" label="1000.0000"/>
          <item alpha="255" color="#180284" value="10000" label="10000.0000"/>
          <rampLegendSettings prefix="" direction="0" suffix="" orientation="2" minimumLabel="" maximumLabel="" useContinuousLegend="1">
            <numericFormat id="basic">
              <Option type="Map">
                <Option type="QChar" name="decimal_separator" value=""/>
                <Option type="int" name="decimals" value="6"/>
                <Option type="int" name="rounding_type" value="0"/>
                <Option type="bool" name="show_plus" value="false"/>
                <Option type="bool" name="show_thousand_separator" value="true"/>
                <Option type="bool" name="show_trailing_zeros" value="false"/>
                <Option type="QChar" name="thousand_separator" value=""/>
              </Option>
            </numericFormat>
          </rampLegendSettings>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast gamma="1" contrast="0" brightness="0"/>
    <huesaturation colorizeBlue="128" colorizeOn="0" colorizeGreen="128" grayscaleMode="0" colorizeRed="255" colorizeStrength="100" saturation="0"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
