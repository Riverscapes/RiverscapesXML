<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" minScale="1e+08" version="3.16.8-Hannover" hasScaleBasedVisibilityFlag="0" styleCategories="AllStyleCategories">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
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
      <resampling zoomedInResamplingMethod="nearestNeighbour" zoomedOutResamplingMethod="nearestNeighbour" maxOversampling="2" enabled="false"/>
    </provider>
    <rasterrenderer classificationMin="-20" type="singlebandpseudocolor" alphaBand="-1" opacity="0.5" nodataColor="" classificationMax="40" band="1">
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
        <colorrampshader clip="0" colorRampType="INTERPOLATED" classificationMode="1" maximumValue="40" minimumValue="-20" labelPrecision="1">
          <colorramp name="[source]" type="gradient">
            <prop k="color1" v="255,252,255,255"/>
            <prop k="color2" v="128,0,0,255"/>
            <prop k="discrete" v="0"/>
            <prop k="rampType" v="gradient"/>
            <prop k="stops" v="0.167;255,0,255,255:0.323;0,0,255,255:0.419;0,255,255,255:0.564;0,255,0,255:0.697;255,255,0,255:0.872;255,128,0,255"/>
          </colorramp>
          <item color="#fffcff" alpha="255" label="-20.0" value="-20"/>
          <item color="#ff00ff" alpha="255" label=" " value="-11.5625"/>
          <item color="#001bff" alpha="255" label=" " value="-3.125"/>
          <item color="#00ffed" alpha="255" label=" " value="5.54688"/>
          <item color="#00ff13" alpha="255" label=" " value="13.9844"/>
          <item color="#ffff00" alpha="255" label=" " value="22.6562"/>
          <item color="#ff8000" alpha="255" label=" " value="31.0938"/>
          <item color="#800000" alpha="255" label="40.0" value="40"/>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast contrast="0" gamma="1" brightness="0"/>
    <huesaturation colorizeOn="0" colorizeGreen="128" grayscaleMode="0" saturation="0" colorizeBlue="128" colorizeStrength="100" colorizeRed="255"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
