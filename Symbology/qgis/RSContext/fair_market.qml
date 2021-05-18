<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.18.2-Zürich" styleCategories="AllStyleCategories" maxScale="0" hasScaleBasedVisibilityFlag="0" minScale="1e+08">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal fetchMode="0" enabled="0" mode="0">
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
      <resampling maxOversampling="2" zoomedInResamplingMethod="nearestNeighbour" enabled="false" zoomedOutResamplingMethod="nearestNeighbour"/>
    </provider>
    <rasterrenderer classificationMax="1248562.25" opacity="0.6" alphaBand="-1" type="singlebandpseudocolor" nodataColor="" classificationMin="1204.0541992" band="1">
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
        <colorrampshader clip="0" maximumValue="1248562.25" classificationMode="2" minimumValue="1204.0541992" colorRampType="DISCRETE" labelPrecision="4">
          <colorramp type="gradient" name="[source]">
            <Option type="Map">
              <Option value="0,97,0,255" type="QString" name="color1"/>
              <Option value="255,34,0,255" type="QString" name="color2"/>
              <Option value="0" type="QString" name="discrete"/>
              <Option value="gradient" type="QString" name="rampType"/>
              <Option value="0.00304319;51,129,0,255:0.00705166;102,160,0,255:0.0190771;153,192,0,255:0.0391194;204,224,0,255:0.0792042;255,255,0,255:0.159374;255,211,0,255:0.199458;255,167,0,255:0.399882;255,122,0,255:0.800729;255,78,0,255" type="QString" name="stops"/>
            </Option>
            <prop v="0,97,0,255" k="color1"/>
            <prop v="255,34,0,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
            <prop v="0.00304319;51,129,0,255:0.00705166;102,160,0,255:0.0190771;153,192,0,255:0.0391194;204,224,0,255:0.0792042;255,255,0,255:0.159374;255,211,0,255:0.199458;255,167,0,255:0.399882;255,122,0,255:0.800729;255,78,0,255" k="stops"/>
          </colorramp>
          <item value="1000" color="#006100" label="&lt; $1,000" alpha="255"/>
          <item value="5000" color="#338100" label="$1,000 to $5,000" alpha="255"/>
          <item value="10000" color="#66a000" label="$5,000 to $10,000" alpha="255"/>
          <item value="25000" color="#99c000" label="$10,000 to $25,000" alpha="255"/>
          <item value="50000" color="#cce000" label="$25,000 to $50,000" alpha="255"/>
          <item value="100000" color="#ffff00" label="$50,000 to $100,000" alpha="255"/>
          <item value="200000" color="#ffd300" label="$100,000 to $200,000" alpha="255"/>
          <item value="250000" color="#ffa700" label="$200,000 to $250,000" alpha="255"/>
          <item value="500000" color="#ff7a00" label="$250,000 to $500,000" alpha="255"/>
          <item value="1000000" color="#ff4e00" label="$500,000 to $1,000,000" alpha="255"/>
          <item value="inf" color="#ff2200" label="> $1,000,000" alpha="255"/>
          <rampLegendSettings maximumLabel="" useContinuousLegend="1" prefix="" direction="0" suffix="" orientation="2" minimumLabel="">
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
    <brightnesscontrast brightness="0" contrast="0" gamma="1"/>
    <huesaturation colorizeStrength="100" grayscaleMode="0" colorizeBlue="128" colorizeOn="0" colorizeRed="255" colorizeGreen="128" saturation="0"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
