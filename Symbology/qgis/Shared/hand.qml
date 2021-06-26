<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.18.3-Zürich" minScale="1e+08" styleCategories="AllStyleCategories" maxScale="0" hasScaleBasedVisibilityFlag="0">
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
      <resampling enabled="false" maxOversampling="2" zoomedOutResamplingMethod="nearestNeighbour" zoomedInResamplingMethod="nearestNeighbour"/>
    </provider>
    <rasterrenderer alphaBand="-1" opacity="0.6" classificationMin="0" classificationMax="361.6794739" type="singlebandpseudocolor" nodataColor="" band="1">
      <rasterTransparency/>
      <minMaxOrigin>
        <limits>MinMax</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <rastershader>
        <colorrampshader clip="0" minimumValue="0" classificationMode="2" maximumValue="361.6794739" labelPrecision="0" colorRampType="DISCRETE">
          <colorramp type="gradient" name="[source]">
            <Option type="Map">
              <Option value="0,77,168,255" type="QString" name="color1"/>
              <Option value="252,252,252,255" type="QString" name="color2"/>
              <Option value="0" type="QString" name="discrete"/>
              <Option value="gradient" type="QString" name="rampType"/>
              <Option value="0.00069122;38,115,0,255:0.00138244;121,172,96,255:0.00276488;127,189,93,255:0.00552976;147,219,94,255:0.00829464;195,252,91,255:0.0110595;214,255,132,255:0.0138244;237,255,176,255:0.0276488;255,248,199,255:0.069122;255,229,158,255:0.138244;242,171,0,255:0.276488;145,133,104,255:0.69122;156,156,156,255" type="QString" name="stops"/>
            </Option>
            <prop v="0,77,168,255" k="color1"/>
            <prop v="252,252,252,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
            <prop v="0.00069122;38,115,0,255:0.00138244;121,172,96,255:0.00276488;127,189,93,255:0.00552976;147,219,94,255:0.00829464;195,252,91,255:0.0110595;214,255,132,255:0.0138244;237,255,176,255:0.0276488;255,248,199,255:0.069122;255,229,158,255:0.138244;242,171,0,255:0.276488;145,133,104,255:0.69122;156,156,156,255" k="stops"/>
          </colorramp>
          <item color="#004da8" value="0" alpha="255" label="0 (Active Channel)"/>
          <item color="#267300" value="0.25" alpha="255" label="0.00 - 0.25 m"/>
          <item color="#79ac60" value="0.5" alpha="255" label="0.25 - 0.50 m"/>
          <item color="#7fbd5d" value="1" alpha="255" label="0.50 - 1.00 m"/>
          <item color="#93db5e" value="2" alpha="255" label="1 - 2 m"/>
          <item color="#c3fc5b" value="3" alpha="255" label="2 - 3 m"/>
          <item color="#d6ff84" value="4" alpha="255" label="3 - 4 m"/>
          <item color="#edffb0" value="5" alpha="255" label="4 - 5 m"/>
          <item color="#fff8c7" value="10" alpha="255" label="5 - 10 m"/>
          <item color="#ffe59e" value="25" alpha="255" label="10 - 25 m"/>
          <item color="#f2ab00" value="50" alpha="255" label="25 - 50 m"/>
          <item color="#918568" value="100" alpha="255" label="50 - 100 m"/>
          <item color="#9c9c9c" value="250" alpha="255" label="100- 250 m"/>
          <item color="#fcfcfc" value="inf" alpha="255" label="> 250 m"/>
          <rampLegendSettings minimumLabel="" prefix="" suffix="" maximumLabel="" orientation="2" useContinuousLegend="1" direction="0">
            <numericFormat id="basic">
              <Option type="Map">
                <Option value="" type="QChar" name="decimal_separator"/>
                <Option value="6" type="int" name="decimals"/>
                <Option value="0" type="int" name="rounding_type"/>
                <Option value="false" type="bool" name="show_plus"/>
                <Option value="true" type="bool" name="show_thousand_separator"/>
                <Option value="false" type="bool" name="show_trailing_zeros"/>
                <Option value="" type="QChar" name="thousand_separator"/>
              </Option>
            </numericFormat>
          </rampLegendSettings>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast gamma="1" contrast="0" brightness="0"/>
    <huesaturation grayscaleMode="0" colorizeStrength="100" saturation="0" colorizeOn="0" colorizeRed="255" colorizeGreen="128" colorizeBlue="128"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
