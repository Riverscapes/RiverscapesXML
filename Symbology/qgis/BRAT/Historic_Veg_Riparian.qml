<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="AllStyleCategories" version="3.20.0-Odense" maxScale="0" hasScaleBasedVisibilityFlag="0" minScale="0">
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
    <Option/>
  </customproperties>
  <pipe>
    <provider>
      <resampling maxOversampling="2" zoomedInResamplingMethod="nearestNeighbour" enabled="false" zoomedOutResamplingMethod="nearestNeighbour"/>
    </provider>
    <rasterrenderer band="1" opacity="1" nodataColor="" type="paletted" alphaBand="-1">
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <colorPalette>
        <paletteEntry alpha="255" label="Riparian" value="11" color="#38a800"/>
        <paletteEntry alpha="255" label="Non Riparian" value="12" color="#ffffff"/>
        <paletteEntry alpha="255" label="Non Riparian" value="12" color="#ffffff"/>
        <paletteEntry alpha="255" label="Non Riparian" value="12" color="#ffffff"/>
        <paletteEntry alpha="255" label="Non Riparian" value="12" color="#ffffff"/>
        <paletteEntry alpha="255" label="Non Riparian" value="12" color="#ffffff"/>
        <paletteEntry alpha="255" label="Non Riparian" value="12" color="#ffffff"/>
        <paletteEntry alpha="255" label="Non Riparian" value="12" color="#ffffff"/>
        <paletteEntry alpha="255" label="Non Riparian" value="12" color="#ffffff"/>
        <paletteEntry alpha="255" label="Non Riparian" value="12" color="#ffffff"/>
      </colorPalette>
      <colorramp name="[source]" type="random">
        <Option type="Map">
          <Option name="count" type="QString" value="100"/>
          <Option name="hueMax" type="QString" value="360"/>
          <Option name="hueMin" type="QString" value="0"/>
          <Option name="rampType" type="QString" value="random"/>
          <Option name="satMax" type="QString" value="255"/>
          <Option name="satMin" type="QString" value="0"/>
          <Option name="valMax" type="QString" value="255"/>
          <Option name="valMin" type="QString" value="0"/>
        </Option>
        <prop k="count" v="100"/>
        <prop k="hueMax" v="360"/>
        <prop k="hueMin" v="0"/>
        <prop k="rampType" v="random"/>
        <prop k="satMax" v="255"/>
        <prop k="satMin" v="0"/>
        <prop k="valMax" v="255"/>
        <prop k="valMin" v="0"/>
      </colorramp>
    </rasterrenderer>
    <brightnesscontrast gamma="1" brightness="0" contrast="0"/>
    <huesaturation saturation="0" colorizeOn="0" colorizeRed="255" grayscaleMode="0" colorizeBlue="128" colorizeGreen="128" colorizeStrength="100"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
