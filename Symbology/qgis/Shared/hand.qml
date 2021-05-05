<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="AllStyleCategories" maxScale="0" minScale="1e+08" version="3.16.5-Hannover" hasScaleBasedVisibilityFlag="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <temporal enabled="0" mode="0" fetchMode="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <customproperties>
    <property key="identify/format" value="Value"/>
  </customproperties>
  <pipe>
    <provider>
      <resampling enabled="false" zoomedInResamplingMethod="nearestNeighbour" maxOversampling="2" zoomedOutResamplingMethod="nearestNeighbour"/>
    </provider>
    <rasterrenderer type="singlebandpseudocolor" classificationMin="0" band="1" classificationMax="931.0211792" alphaBand="-1" nodataColor="" opacity="0.7">
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
        <colorrampshader maximumValue="931.02117920000001" colorRampType="DISCRETE" classificationMode="2" clip="0" labelPrecision="1" minimumValue="0">
          <colorramp name="[source]" type="gradient">
            <prop v="215,25,28,255" k="color1"/>
            <prop v="43,131,186,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
            <prop v="0.25;253,174,97,255:0.5;255,255,191,255:0.75;171,221,164,255" k="stops"/>
          </colorramp>
          <item color="#79ac60" alpha="255" label="&lt;= 0.5" value="0.5"/>
          <item color="#7fbd5d" alpha="255" label="0.5 - 1.0" value="1"/>
          <item color="#93db5e" alpha="255" label="1.0 - 2.0" value="2"/>
          <item color="#c3fc5b" alpha="255" label="2.0 - 3.0" value="3"/>
          <item color="#d6ff84" alpha="255" label="3.0 - 4.0" value="4"/>
          <item color="#edffb0" alpha="255" label="4.0 - 5.0" value="5"/>
          <item color="#fff8c7" alpha="255" label="5 - 10" value="10"/>
          <item color="#ffe59e" alpha="255" label="10 - 25" value="25"/>
          <item color="#f2ab00" alpha="255" label="25 - 50" value="50"/>
          <item color="#918568" alpha="255" label="50 - 100" value="100"/>
          <item color="#9c9c9c" alpha="255" label="100- 250" value="250"/>
          <item color="#fcfcfc" alpha="255" label="> 250" value="inf"/>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast brightness="0" contrast="0" gamma="1"/>
    <huesaturation colorizeStrength="100" grayscaleMode="0" colorizeGreen="128" colorizeBlue="128" colorizeRed="255" saturation="0" colorizeOn="0"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
