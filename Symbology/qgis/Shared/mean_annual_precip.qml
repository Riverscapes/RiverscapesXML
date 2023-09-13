<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" styleCategories="AllStyleCategories" version="3.20.1-Odense" maxScale="0" minScale="1e+08">
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
    <Option type="Map">
      <Option name="WMSBackgroundLayer" type="QString" value="false"/>
      <Option name="WMSPublishDataSourceUrl" type="QString" value="false"/>
      <Option name="embeddedWidgets/count" type="QString" value="0"/>
      <Option name="identify/format" type="QString" value="Value"/>
    </Option>
  </customproperties>
  <pipe>
    <provider>
      <resampling maxOversampling="2" zoomedOutResamplingMethod="nearestNeighbour" zoomedInResamplingMethod="nearestNeighbour" enabled="false"/>
    </provider>
    <rasterrenderer alphaBand="-1" nodataColor="" band="1" opacity="0.5" type="singlebandpseudocolor" classificationMax="457.1300049" classificationMin="94.1299973">
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
        <colorrampshader labelPrecision="2" classificationMode="1" colorRampType="INTERPOLATED" maximumValue="457.13000490000002" clip="0" minimumValue="94.129997299999999">
          <colorramp name="[source]" type="gradient">
            <Option type="Map">
              <Option name="color1" type="QString" value="128,0,2,255"/>
              <Option name="color2" type="QString" value="255,252,255,255"/>
              <Option name="discrete" type="QString" value="0"/>
              <Option name="rampType" type="QString" value="gradient"/>
              <Option name="stops" type="QString" value="0.163462;255,128,0,255:0.270433;255,255,0,255:0.378606;0,255,0,255:0.503606;0,255,255,255:0.63;2,0,255,255:0.686;255,0,255,255:0.882;255,252,255,255"/>
            </Option>
            <prop k="color1" v="128,0,2,255"/>
            <prop k="color2" v="255,252,255,255"/>
            <prop k="discrete" v="0"/>
            <prop k="rampType" v="gradient"/>
            <prop k="stops" v="0.163462;255,128,0,255:0.270433;255,255,0,255:0.378606;0,255,0,255:0.503606;0,255,255,255:0.63;2,0,255,255:0.686;255,0,255,255:0.882;255,252,255,255"/>
          </colorramp>
          <item label="94.13" alpha="255" color="#800002" value="94.1299973"/>
          <item label="153.47" alpha="255" color="#ff8000" value="153.4667045423112"/>
          <item label="192.30" alpha="255" color="#ffff00" value="192.29717835529078"/>
          <item label="231.56" alpha="255" color="#00ff00" value="231.5639781774056"/>
          <item label="276.94" alpha="255" color="#00ffff" value="276.9389791274056"/>
          <item label="322.82" alpha="255" color="#0200ff" value="322.820002088"/>
          <item label="343.15" alpha="255" color="#ff00ff" value="343.14800251360003"/>
          <item label="414.30" alpha="255" color="#fffcff" value="414.29600400320004"/>
          <item label="457.13" alpha="255" color="#fffcff" value="457.1300049"/>
          <rampLegendSettings minimumLabel="" useContinuousLegend="1" maximumLabel="" prefix="" orientation="2" suffix="" direction="0">
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
    <brightnesscontrast gamma="1" brightness="0" contrast="0"/>
    <huesaturation colorizeGreen="128" grayscaleMode="0" colorizeBlue="128" colorizeStrength="100" colorizeOn="0" colorizeRed="255" saturation="0"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
