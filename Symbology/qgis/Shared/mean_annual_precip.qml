<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" hasScaleBasedVisibilityFlag="0" version="3.20.0-Odense" styleCategories="AllStyleCategories" minScale="1e+08">
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
      <Option name="WMSBackgroundLayer" type="QString" value="false"/>
      <Option name="WMSPublishDataSourceUrl" type="QString" value="false"/>
      <Option name="embeddedWidgets/count" type="QString" value="0"/>
      <Option name="identify/format" type="QString" value="Value"/>
    </Option>
  </customproperties>
  <pipe>
    <provider>
      <resampling zoomedInResamplingMethod="nearestNeighbour" zoomedOutResamplingMethod="nearestNeighbour" enabled="false" maxOversampling="2"/>
    </provider>
    <rasterrenderer alphaBand="-1" type="singlebandpseudocolor" band="1" classificationMin="300" classificationMax="2000" opacity="0.5" nodataColor="">
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
        <colorrampshader minimumValue="300" classificationMode="1" labelPrecision="2" colorRampType="INTERPOLATED" clip="0" maximumValue="2000">
          <colorramp name="[source]" type="gradient">
            <Option type="Map">
              <Option name="color1" type="QString" value="128,0,2,255"/>
              <Option name="color2" type="QString" value="255,252,255,255"/>
              <Option name="discrete" type="QString" value="0"/>
              <Option name="rampType" type="QString" value="gradient"/>
              <Option name="stops" type="QString" value="0.163462;255,128,0,255:0.270433;255,255,0,255:0.378606;0,255,0,255:0.503606;0,255,255,255:0.63;2,0,255,255:0.686;255,0,255,255:0.882;255,252,255,255"/>
            </Option>
            <prop v="128,0,2,255" k="color1"/>
            <prop v="255,252,255,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
            <prop v="0.163462;255,128,0,255:0.270433;255,255,0,255:0.378606;0,255,0,255:0.503606;0,255,255,255:0.63;2,0,255,255:0.686;255,0,255,255:0.882;255,252,255,255" k="stops"/>
          </colorramp>
          <item label="300.00" color="#800002" alpha="255" value="300"/>
          <item label="577.89" color="#ff8000" alpha="255" value="577.8854"/>
          <item label="759.74" color="#ffff00" alpha="255" value="759.7361"/>
          <item label="943.63" color="#00ff00" alpha="255" value="943.6302"/>
          <item label="1156.13" color="#00ffff" alpha="255" value="1156.1302"/>
          <item label="1371.00" color="#0200ff" alpha="255" value="1371"/>
          <item label="1466.20" color="#ff00ff" alpha="255" value="1466.2"/>
          <item label="1799.40" color="#fffcff" alpha="255" value="1799.4"/>
          <item label="2000.00" color="#fffcff" alpha="255" value="2000"/>
          <rampLegendSettings minimumLabel="" maximumLabel="" prefix="" direction="0" suffix="" useContinuousLegend="1" orientation="2">
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
    <huesaturation colorizeBlue="128" grayscaleMode="0" colorizeStrength="100" colorizeRed="255" saturation="0" colorizeOn="0" colorizeGreen="128"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
