<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<<<<<<< HEAD
<qgis maxScale="0" minScale="1e+08" version="3.16.8-Hannover" hasScaleBasedVisibilityFlag="0" styleCategories="AllStyleCategories">
=======
<qgis styleCategories="AllStyleCategories" version="3.20.0-Odense" maxScale="0" minScale="0" hasScaleBasedVisibilityFlag="0">
>>>>>>> 3f5296e (Authored .qml for Topography inputs)
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
<<<<<<< HEAD
  </flags>
  <temporal fetchMode="0" enabled="0" mode="0">
=======
    <Private>0</Private>
  </flags>
  <temporal fetchMode="0" mode="0" enabled="0">
>>>>>>> 3f5296e (Authored .qml for Topography inputs)
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <customproperties>
<<<<<<< HEAD
    <property value="false" key="WMSBackgroundLayer"/>
    <property value="false" key="WMSPublishDataSourceUrl"/>
    <property value="0" key="embeddedWidgets/count"/>
    <property value="Value" key="identify/format"/>
  </customproperties>
  <pipe>
    <provider>
      <resampling zoomedInResamplingMethod="nearestNeighbour" zoomedOutResamplingMethod="nearestNeighbour" maxOversampling="2" enabled="false"/>
    </provider>
    <rasterrenderer classificationMin="1" type="singlebandpseudocolor" alphaBand="-1" opacity="0.6" nodataColor="" classificationMax="216232" band="1">
      <rasterTransparency/>
=======
    <Option/>
  </customproperties>
  <pipe>
    <provider>
      <resampling zoomedInResamplingMethod="nearestNeighbour" zoomedOutResamplingMethod="nearestNeighbour" enabled="false" maxOversampling="2"/>
    </provider>
    <rasterrenderer opacity="1" nodataColor="" classificationMin="0" classificationMax="3114.4567871094" type="singlebandpseudocolor" band="1" alphaBand="-1">
>>>>>>> 3f5296e (Authored .qml for Topography inputs)
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <rastershader>
<<<<<<< HEAD
        <colorrampshader clip="0" colorRampType="INTERPOLATED" classificationMode="1" maximumValue="216232" minimumValue="1" labelPrecision="0">
          <colorramp name="[source]" type="gradient">
            <prop k="color1" v="255,255,127,255"/>
            <prop k="color2" v="12,15,120,255"/>
            <prop k="discrete" v="0"/>
            <prop k="rampType" v="gradient"/>
            <prop k="stops" v="0.194712;55,224,9,255:0.378606;25,147,171,255"/>
          </colorramp>
          <item color="#ffff7f" alpha="255" label="1" value="1"/>
          <item color="#37e009" alpha="255" label=" " value="4684.55"/>
          <item color="#1993ab" alpha="255" label=" " value="9368.1"/>
          <item color="#0c0f78" alpha="255" label="216232" value="216232"/>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast contrast="0" gamma="1" brightness="0"/>
    <huesaturation colorizeOn="0" colorizeGreen="128" grayscaleMode="0" saturation="0" colorizeBlue="128" colorizeStrength="100" colorizeRed="255"/>
=======
        <colorrampshader minimumValue="0" classificationMode="1" maximumValue="3114.4567871094" labelPrecision="6" colorRampType="INTERPOLATED" clip="0">
          <colorramp name="[source]" type="gradient">
            <Option type="Map">
              <Option value="255,255,127,255" name="color1" type="QString"/>
              <Option value="12,16,120,255" name="color2" type="QString"/>
              <Option value="0" name="discrete" type="QString"/>
              <Option value="gradient" name="rampType" type="QString"/>
              <Option value="0.333333;56,224,9,255:0.666667;26,147,171,255" name="stops" type="QString"/>
            </Option>
            <prop v="255,255,127,255" k="color1"/>
            <prop v="12,16,120,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
            <prop v="0.333333;56,224,9,255:0.666667;26,147,171,255" k="stops"/>
          </colorramp>
          <item color="#ffff7f" value="0" label="0" alpha="255"/>
          <item color="#38e009" value="1038.1522623698" label="1038" alpha="255"/>
          <item color="#1a93ab" value="2076.3045247396" label="2076" alpha="255"/>
          <item color="#0c1078" value="3114.4567871094" label="3114" alpha="255"/>
          <rampLegendSettings direction="0" suffix="" maximumLabel="" minimumLabel="" orientation="2" useContinuousLegend="1" prefix="">
            <numericFormat id="basic">
              <Option type="Map">
                <Option value="" name="decimal_separator" type="QChar"/>
                <Option value="6" name="decimals" type="int"/>
                <Option value="0" name="rounding_type" type="int"/>
                <Option value="false" name="show_plus" type="bool"/>
                <Option value="true" name="show_thousand_separator" type="bool"/>
                <Option value="false" name="show_trailing_zeros" type="bool"/>
                <Option value="" name="thousand_separator" type="QChar"/>
              </Option>
            </numericFormat>
          </rampLegendSettings>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast brightness="0" gamma="1" contrast="0"/>
    <huesaturation grayscaleMode="0" colorizeRed="255" colorizeOn="0" colorizeBlue="128" saturation="0" colorizeGreen="128" colorizeStrength="100"/>
>>>>>>> 3f5296e (Authored .qml for Topography inputs)
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
