<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" minScale="0" maxScale="0" version="3.20.1-Odense" styleCategories="AllStyleCategories">
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
    <Option/>
  </customproperties>
  <pipe>
    <provider>
      <resampling maxOversampling="2" enabled="false" zoomedOutResamplingMethod="nearestNeighbour" zoomedInResamplingMethod="nearestNeighbour"/>
    </provider>
    <rasterrenderer alphaBand="-1" classificationMin="0" type="singlebandpseudocolor" nodataColor="" opacity="0.6" classificationMax="1.1" band="1">
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <rastershader>
        <colorrampshader colorRampType="DISCRETE" labelPrecision="6" classificationMode="1" clip="0" minimumValue="0" maximumValue="1.1000000000000001">
          <colorramp name="[source]" type="gradient">
            <Option type="Map">
              <Option name="color1" type="QString" value="0,0,0,255"/>
              <Option name="color2" type="QString" value="255,255,255,255"/>
              <Option name="discrete" type="QString" value="0"/>
              <Option name="rampType" type="QString" value="gradient"/>
            </Option>
            <prop v="0,0,0,255" k="color1"/>
            <prop v="255,255,255,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
          </colorramp>
          <item alpha="255" value="0.1" label="0.00 to 0.10" color="#f2f1a2"/>
          <item alpha="255" value="0.2" label="0.10 to 0.20" color="#faf570"/>
          <item alpha="255" value="0.3" label="0.20 to 0.30" color="#fffc38"/>
          <item alpha="255" value="0.4" label="0.30 to 0.40" color="#ffd500"/>
          <item alpha="255" value="0.5" label="0.40 to 0.50" color="#ff8000"/>
          <item alpha="255" value="0.6" label="0.50 to 0.60" color="#ff0000"/>
          <item alpha="255" value="0.7" label="0.60 to 0.70" color="#f505a5"/>
          <item alpha="255" value="0.8" label="0.70 to 0.80" color="#e007f0"/>
          <item alpha="255" value="0.9" label="0.80 to 0.90" color="#9112e0"/>
          <item alpha="255" value="1" label="0.90 to 1.00" color="#581cc7"/>
          <item alpha="255" value="1.1" label="> 1.00" color="#0c1cad"/>
          <rampLegendSettings direction="0" orientation="2" useContinuousLegend="1" prefix="" suffix="" minimumLabel="" maximumLabel="">
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
    <brightnesscontrast brightness="0" contrast="0" gamma="1"/>
    <huesaturation colorizeGreen="128" colorizeStrength="100" colorizeOn="0" grayscaleMode="0" colorizeRed="255" colorizeBlue="128" saturation="0"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
