<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="AllStyleCategories" version="3.30.2-'s-Hertogenbosch" minScale="0" hasScaleBasedVisibilityFlag="0" maxScale="0">
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
  <elevation band="1" symbology="Line" zscale="1" enabled="0" zoffset="0">
    <data-defined-properties>
      <Option type="Map">
        <Option name="name" value="" type="QString"/>
        <Option name="properties"/>
        <Option name="type" value="collection" type="QString"/>
      </Option>
    </data-defined-properties>
    <profileLineSymbol>
      <symbol force_rhr="0" name="" clip_to_extent="1" frame_rate="10" alpha="1" is_animated="0" type="line">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" id="{02db3020-63cc-476a-91db-d83a23f1802e}" locked="0" enabled="1">
          <Option type="Map">
            <Option name="align_dash_pattern" value="0" type="QString"/>
            <Option name="capstyle" value="square" type="QString"/>
            <Option name="customdash" value="5;2" type="QString"/>
            <Option name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="customdash_unit" value="MM" type="QString"/>
            <Option name="dash_pattern_offset" value="0" type="QString"/>
            <Option name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="dash_pattern_offset_unit" value="MM" type="QString"/>
            <Option name="draw_inside_polygon" value="0" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="line_color" value="231,113,72,255" type="QString"/>
            <Option name="line_style" value="solid" type="QString"/>
            <Option name="line_width" value="0.6" type="QString"/>
            <Option name="line_width_unit" value="MM" type="QString"/>
            <Option name="offset" value="0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="ring_filter" value="0" type="QString"/>
            <Option name="trim_distance_end" value="0" type="QString"/>
            <Option name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="trim_distance_end_unit" value="MM" type="QString"/>
            <Option name="trim_distance_start" value="0" type="QString"/>
            <Option name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="trim_distance_start_unit" value="MM" type="QString"/>
            <Option name="tweak_dash_pattern_on_corners" value="0" type="QString"/>
            <Option name="use_custom_dash" value="0" type="QString"/>
            <Option name="width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </profileLineSymbol>
    <profileFillSymbol>
      <symbol force_rhr="0" name="" clip_to_extent="1" frame_rate="10" alpha="1" is_animated="0" type="fill">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleFill" id="{d1c6229c-f381-48eb-8329-4b3d05fa47d8}" locked="0" enabled="1">
          <Option type="Map">
            <Option name="border_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="color" value="231,113,72,255" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,35,35,255" type="QString"/>
            <Option name="outline_style" value="no" type="QString"/>
            <Option name="outline_width" value="0.26" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="style" value="solid" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </profileFillSymbol>
  </elevation>
  <customproperties>
    <Option type="Map">
      <Option name="identify/format" value="Value" type="QString"/>
    </Option>
  </customproperties>
  <mapTip></mapTip>
  <pipe-data-defined-properties>
    <Option type="Map">
      <Option name="name" value="" type="QString"/>
      <Option name="properties"/>
      <Option name="type" value="collection" type="QString"/>
    </Option>
  </pipe-data-defined-properties>
  <pipe>
    <provider>
      <resampling zoomedInResamplingMethod="nearestNeighbour" zoomedOutResamplingMethod="nearestNeighbour" enabled="false" maxOversampling="2"/>
    </provider>
    <rasterrenderer opacity="1" band="1" alphaBand="-1" type="paletted" nodataColor="">
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <colorPalette>
        <paletteEntry alpha="255" label="Fill-NoData" value="-9999" color="#ffffff"/>
        <paletteEntry alpha="255" label="Fill-Not Mapped" value="-1111" color="#6f6f6f"/>
        <paletteEntry alpha="255" label="0" value="0" color="#00f0ff"/>
        <paletteEntry alpha="255" label="1" value="1" color="#00e5ee"/>
        <paletteEntry alpha="255" label="2" value="2" color="#00dadd"/>
        <paletteEntry alpha="255" label="3" value="3" color="#00cfcc"/>
        <paletteEntry alpha="255" label="4" value="4" color="#00c4bb"/>
        <paletteEntry alpha="255" label="5" value="5" color="#00b9aa"/>
        <paletteEntry alpha="255" label="6" value="6" color="#00ae99"/>
        <paletteEntry alpha="255" label="7" value="7" color="#00a388"/>
        <paletteEntry alpha="255" label="8" value="8" color="#009877"/>
        <paletteEntry alpha="255" label="9" value="9" color="#008d66"/>
        <paletteEntry alpha="255" label="10" value="10" color="#008255"/>
        <paletteEntry alpha="255" label="11" value="11" color="#007744"/>
        <paletteEntry alpha="255" label="12" value="12" color="#006c33"/>
        <paletteEntry alpha="255" label="13" value="13" color="#006122"/>
        <paletteEntry alpha="255" label="14" value="14" color="#005611"/>
        <paletteEntry alpha="255" label="15" value="15" color="#004b00"/>
        <paletteEntry alpha="255" label="16" value="16" color="#0e5900"/>
        <paletteEntry alpha="255" label="17" value="17" color="#1c6600"/>
        <paletteEntry alpha="255" label="18" value="18" color="#2a7400"/>
        <paletteEntry alpha="255" label="19" value="19" color="#388100"/>
        <paletteEntry alpha="255" label="20" value="20" color="#468f00"/>
        <paletteEntry alpha="255" label="21" value="21" color="#549c00"/>
        <paletteEntry alpha="255" label="22" value="22" color="#62aa00"/>
        <paletteEntry alpha="255" label="23" value="23" color="#70b700"/>
        <paletteEntry alpha="255" label="24" value="24" color="#7ec500"/>
        <paletteEntry alpha="255" label="25" value="25" color="#8cd200"/>
        <paletteEntry alpha="255" label="26" value="26" color="#9ad815"/>
        <paletteEntry alpha="255" label="27" value="27" color="#a9dd2b"/>
        <paletteEntry alpha="255" label="28" value="28" color="#b7e340"/>
        <paletteEntry alpha="255" label="29" value="29" color="#c6e955"/>
        <paletteEntry alpha="255" label="30" value="30" color="#d4ee6a"/>
        <paletteEntry alpha="255" label="31" value="31" color="#e2f480"/>
        <paletteEntry alpha="255" label="32" value="32" color="#f1f995"/>
        <paletteEntry alpha="255" label="33" value="33" color="#ffffaa"/>
        <paletteEntry alpha="255" label="34" value="34" color="#ffffa0"/>
        <paletteEntry alpha="255" label="35" value="35" color="#ffff96"/>
        <paletteEntry alpha="255" label="36" value="36" color="#ffff8c"/>
        <paletteEntry alpha="255" label="37" value="37" color="#ffff82"/>
        <paletteEntry alpha="255" label="38" value="38" color="#ffff78"/>
        <paletteEntry alpha="255" label="39" value="39" color="#ffff6e"/>
        <paletteEntry alpha="255" label="40" value="40" color="#ffff64"/>
        <paletteEntry alpha="255" label="41" value="41" color="#ffff5a"/>
        <paletteEntry alpha="255" label="42" value="42" color="#ffff50"/>
        <paletteEntry alpha="255" label="43" value="43" color="#ffff46"/>
        <paletteEntry alpha="255" label="44" value="44" color="#ffff3c"/>
        <paletteEntry alpha="255" label="45" value="45" color="#ffff32"/>
        <paletteEntry alpha="255" label="46" value="46" color="#ffff28"/>
        <paletteEntry alpha="255" label="47" value="47" color="#ffff1e"/>
        <paletteEntry alpha="255" label="48" value="48" color="#ffff14"/>
        <paletteEntry alpha="255" label="49" value="49" color="#ffff0a"/>
        <paletteEntry alpha="255" label="50" value="50" color="#ffff00"/>
        <paletteEntry alpha="255" label="51" value="51" color="#fff500"/>
        <paletteEntry alpha="255" label="52" value="52" color="#ffeb00"/>
        <paletteEntry alpha="255" label="53" value="53" color="#ffe000"/>
        <paletteEntry alpha="255" label="54" value="54" color="#ffd600"/>
        <paletteEntry alpha="255" label="55" value="55" color="#ffcc00"/>
        <paletteEntry alpha="255" label="56" value="56" color="#ffc200"/>
        <paletteEntry alpha="255" label="57" value="57" color="#ffb800"/>
        <paletteEntry alpha="255" label="58" value="58" color="#ffad00"/>
        <paletteEntry alpha="255" label="59" value="59" color="#ffa300"/>
        <paletteEntry alpha="255" label="60" value="60" color="#ff9900"/>
        <paletteEntry alpha="255" label="61" value="61" color="#ff8f00"/>
        <paletteEntry alpha="255" label="62" value="62" color="#ff8500"/>
        <paletteEntry alpha="255" label="63" value="63" color="#ff7a00"/>
        <paletteEntry alpha="255" label="64" value="64" color="#ff7000"/>
        <paletteEntry alpha="255" label="65" value="65" color="#ff6600"/>
        <paletteEntry alpha="255" label="66" value="66" color="#ff5c00"/>
        <paletteEntry alpha="255" label="67" value="67" color="#ff5200"/>
        <paletteEntry alpha="255" label="68" value="68" color="#ff4700"/>
        <paletteEntry alpha="255" label="69" value="69" color="#ff3d00"/>
        <paletteEntry alpha="255" label="70" value="70" color="#ff3300"/>
        <paletteEntry alpha="255" label="71" value="71" color="#ff2900"/>
        <paletteEntry alpha="255" label="72" value="72" color="#ff1f00"/>
        <paletteEntry alpha="255" label="73" value="73" color="#ff1400"/>
        <paletteEntry alpha="255" label="74" value="74" color="#ff0a00"/>
        <paletteEntry alpha="255" label="75" value="75" color="#ff0000"/>
        <paletteEntry alpha="255" label="76" value="76" color="#fb0000"/>
        <paletteEntry alpha="255" label="77" value="77" color="#f70000"/>
        <paletteEntry alpha="255" label="78" value="78" color="#f20000"/>
        <paletteEntry alpha="255" label="79" value="79" color="#ee0000"/>
        <paletteEntry alpha="255" label="80" value="80" color="#ea0000"/>
        <paletteEntry alpha="255" label="81" value="81" color="#e60000"/>
        <paletteEntry alpha="255" label="82" value="82" color="#e10000"/>
        <paletteEntry alpha="255" label="83" value="83" color="#dd0000"/>
        <paletteEntry alpha="255" label="84" value="84" color="#d90000"/>
        <paletteEntry alpha="255" label="85" value="85" color="#d50000"/>
        <paletteEntry alpha="255" label="86" value="86" color="#d00000"/>
        <paletteEntry alpha="255" label="87" value="87" color="#cc0000"/>
        <paletteEntry alpha="255" label="88" value="88" color="#c80000"/>
        <paletteEntry alpha="255" label="89" value="89" color="#c40000"/>
        <paletteEntry alpha="255" label="90" value="90" color="#c00000"/>
        <paletteEntry alpha="255" label="91" value="91" color="#bb0000"/>
        <paletteEntry alpha="255" label="92" value="92" color="#b70000"/>
        <paletteEntry alpha="255" label="93" value="93" color="#b30000"/>
        <paletteEntry alpha="255" label="94" value="94" color="#af0000"/>
        <paletteEntry alpha="255" label="95" value="95" color="#aa0000"/>
        <paletteEntry alpha="255" label="96" value="96" color="#a60000"/>
        <paletteEntry alpha="255" label="97" value="97" color="#a20000"/>
        <paletteEntry alpha="255" label="98" value="98" color="#9e0000"/>
        <paletteEntry alpha="255" label="99" value="99" color="#990000"/>
        <paletteEntry alpha="255" label="100" value="100" color="#950000"/>
        <paletteEntry alpha="255" label="Water" value="111" color="#0000ff"/>
        <paletteEntry alpha="255" label="Snow/Ice" value="112" color="#9fa1f0"/>
        <paletteEntry alpha="255" label="Developed" value="120" color="#8400a8"/>
        <paletteEntry alpha="255" label="Barren or Sparse" value="132" color="#bfbfbf"/>
        <paletteEntry alpha="255" label="Agriculture" value="180" color="#df73ff"/>
      </colorPalette>
      <colorramp name="[source]" type="random">
        <Option type="Map">
          <Option name="count" value="100" type="QString"/>
          <Option name="hueMax" value="360" type="QString"/>
          <Option name="hueMin" value="0" type="QString"/>
          <Option name="rampType" value="random" type="QString"/>
          <Option name="satMax" value="255" type="QString"/>
          <Option name="satMin" value="0" type="QString"/>
          <Option name="valMax" value="255" type="QString"/>
          <Option name="valMin" value="0" type="QString"/>
        </Option>
      </colorramp>
    </rasterrenderer>
    <brightnesscontrast brightness="0" gamma="1" contrast="0"/>
    <huesaturation colorizeRed="255" invertColors="0" colorizeGreen="128" grayscaleMode="0" saturation="0" colorizeStrength="100" colorizeOn="0" colorizeBlue="128"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
