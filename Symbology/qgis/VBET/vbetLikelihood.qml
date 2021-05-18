<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.12.1-București" maxScale="0" styleCategories="AllStyleCategories" minScale="1e+08" hasScaleBasedVisibilityFlag="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <customproperties>
    <property value="false" key="WMSBackgroundLayer"/>
    <property value="false" key="WMSPublishDataSourceUrl"/>
    <property value="0" key="embeddedWidgets/count"/>
    <property value="Value" key="identify/format"/>
  </customproperties>
  <pipe>
    <rasterrenderer classificationMax="1" type="singlebandpseudocolor" band="1" opacity="1" alphaBand="-1" classificationMin="0" nodataColor="">
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
        <colorrampshader clip="0" classificationMode="1" colorRampType="INTERPOLATED">
          <colorramp name="[source]" type="gradient">
            <prop v="255,255,255,255" k="color1"/>
            <prop v="0,77,168,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
            <prop v="0.1;168,138,27,255:0.235577;236,144,38,255:0.5;255,236,23,255:0.601;233,255,190,255:0.7;163,255,115,255:0.85;38,115,0,255" k="stops"/>
          </colorramp>
          <item label="Not Vallley Bottom" value="0" color="#ffffff" alpha="255"/>
          <item label="Scarce Plausiblity" value="0.1" color="#a88a1b" alpha="255"/>
          <item label="Low Plausability" value="0.25" color="#ec9026" alpha="255"/>
          <item label="Plausible Valley Bottom" value="0.5" color="#ffec17" alpha="255"/>
          <item label="Possible Valley Bottom" value="0.6" color="#e9ffbe" alpha="255"/>
          <item label="Likely Valley Bottom" value="0.8" color="#a3ff73" alpha="255"/>
          <item label="Highly Likely Valley Bottom" value="0.98" color="#267300" alpha="255"/>
          <item label="Estimated Active Channel" value="1" color="#004da8" alpha="255"/>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast contrast="0" brightness="0"/>
    <huesaturation saturation="0" colorizeOn="0" colorizeBlue="128" colorizeStrength="100" colorizeRed="255" colorizeGreen="128" grayscaleMode="0"/>
    <rasterresampler maxOversampling="2"/>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
