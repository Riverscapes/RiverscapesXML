<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" minScale="100000000" simplifyMaxScale="1" version="3.20.0-Odense" labelsEnabled="0" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" readOnly="0" styleCategories="AllStyleCategories" simplifyLocal="1" simplifyAlgorithm="0" simplifyDrawingHints="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal endField="" durationUnit="min" durationField="" enabled="0" accumulate="0" startField="" endExpression="" mode="0" startExpression="" fixedDuration="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <renderer-v2 enableorderby="0" graduatedMethod="GraduatedColor" type="graduatedSymbol" attr="mCC_HPE_CT" symbollevels="0" forceraster="0">
    <ranges>
      <range render="true" symbol="0" lower="0.000000000000000" upper="0.000000000000000" label="No Dams"/>
      <range render="true" symbol="1" lower="0.000000000000000" upper="1.000001000000000" label="Single Dam"/>
      <range render="true" symbol="2" lower="1.000001000000000" upper="3.000001000000000" label="Small Complex (1-3 dams)"/>
      <range render="true" symbol="3" lower="3.000001000000000" upper="5.000001000000000" label="Medium Complex (3-5 dams)"/>
      <range render="true" symbol="4" lower="5.000001000000000" upper="100.000000000000000" label="Large Complex (>5 dams)"/>
    </ranges>
    <symbols>
      <symbol force_rhr="0" alpha="1" clip_to_extent="1" type="line" name="0">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" enabled="1" class="SimpleLine" locked="0">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="square"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="line_color" value="255,0,0,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="0.26"/>
            <Option type="QString" name="line_width_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <prop k="align_dash_pattern" v="0"/>
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="dash_pattern_offset" v="0"/>
          <prop k="dash_pattern_offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="dash_pattern_offset_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="255,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.26"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="ring_filter" v="0"/>
          <prop k="trim_distance_end" v="0"/>
          <prop k="trim_distance_end_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="trim_distance_end_unit" v="MM"/>
          <prop k="trim_distance_start" v="0"/>
          <prop k="trim_distance_start_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="trim_distance_start_unit" v="MM"/>
          <prop k="tweak_dash_pattern_on_corners" v="0"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" alpha="1" clip_to_extent="1" type="line" name="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" enabled="1" class="SimpleLine" locked="0">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="square"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="line_color" value="255,170,0,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="0.26"/>
            <Option type="QString" name="line_width_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <prop k="align_dash_pattern" v="0"/>
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="dash_pattern_offset" v="0"/>
          <prop k="dash_pattern_offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="dash_pattern_offset_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="255,170,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.26"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="ring_filter" v="0"/>
          <prop k="trim_distance_end" v="0"/>
          <prop k="trim_distance_end_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="trim_distance_end_unit" v="MM"/>
          <prop k="trim_distance_start" v="0"/>
          <prop k="trim_distance_start_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="trim_distance_start_unit" v="MM"/>
          <prop k="tweak_dash_pattern_on_corners" v="0"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" alpha="1" clip_to_extent="1" type="line" name="2">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" enabled="1" class="SimpleLine" locked="0">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="square"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="line_color" value="255,255,0,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="0.26"/>
            <Option type="QString" name="line_width_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <prop k="align_dash_pattern" v="0"/>
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="dash_pattern_offset" v="0"/>
          <prop k="dash_pattern_offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="dash_pattern_offset_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="255,255,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.26"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="ring_filter" v="0"/>
          <prop k="trim_distance_end" v="0"/>
          <prop k="trim_distance_end_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="trim_distance_end_unit" v="MM"/>
          <prop k="trim_distance_start" v="0"/>
          <prop k="trim_distance_start_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="trim_distance_start_unit" v="MM"/>
          <prop k="tweak_dash_pattern_on_corners" v="0"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" alpha="1" clip_to_extent="1" type="line" name="3">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" enabled="1" class="SimpleLine" locked="0">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="square"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="line_color" value="76,230,0,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="0.5"/>
            <Option type="QString" name="line_width_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <prop k="align_dash_pattern" v="0"/>
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="dash_pattern_offset" v="0"/>
          <prop k="dash_pattern_offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="dash_pattern_offset_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="76,230,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.5"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="ring_filter" v="0"/>
          <prop k="trim_distance_end" v="0"/>
          <prop k="trim_distance_end_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="trim_distance_end_unit" v="MM"/>
          <prop k="trim_distance_start" v="0"/>
          <prop k="trim_distance_start_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="trim_distance_start_unit" v="MM"/>
          <prop k="tweak_dash_pattern_on_corners" v="0"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" alpha="1" clip_to_extent="1" type="line" name="4">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" enabled="1" class="SimpleLine" locked="0">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="square"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="line_color" value="0,92,230,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="0.75"/>
            <Option type="QString" name="line_width_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <prop k="align_dash_pattern" v="0"/>
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="dash_pattern_offset" v="0"/>
          <prop k="dash_pattern_offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="dash_pattern_offset_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,92,230,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.75"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="ring_filter" v="0"/>
          <prop k="trim_distance_end" v="0"/>
          <prop k="trim_distance_end_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="trim_distance_end_unit" v="MM"/>
          <prop k="trim_distance_start" v="0"/>
          <prop k="trim_distance_start_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="trim_distance_start_unit" v="MM"/>
          <prop k="tweak_dash_pattern_on_corners" v="0"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <source-symbol>
      <symbol force_rhr="0" alpha="1" clip_to_extent="1" type="line" name="0">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" enabled="1" class="SimpleLine" locked="0">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="square"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="line_color" value="255,158,23,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="0.26"/>
            <Option type="QString" name="line_width_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <prop k="align_dash_pattern" v="0"/>
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="dash_pattern_offset" v="0"/>
          <prop k="dash_pattern_offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="dash_pattern_offset_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="255,158,23,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.26"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="ring_filter" v="0"/>
          <prop k="trim_distance_end" v="0"/>
          <prop k="trim_distance_end_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="trim_distance_end_unit" v="MM"/>
          <prop k="trim_distance_start" v="0"/>
          <prop k="trim_distance_start_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="trim_distance_start_unit" v="MM"/>
          <prop k="tweak_dash_pattern_on_corners" v="0"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </source-symbol>
    <colorramp type="gradient" name="[source]">
      <Option type="Map">
        <Option type="QString" name="color1" value="255,255,255,255"/>
        <Option type="QString" name="color2" value="255,0,0,255"/>
        <Option type="QString" name="discrete" value="0"/>
        <Option type="QString" name="rampType" value="gradient"/>
      </Option>
      <prop k="color1" v="255,255,255,255"/>
      <prop k="color2" v="255,0,0,255"/>
      <prop k="discrete" v="0"/>
      <prop k="rampType" v="gradient"/>
    </colorramp>
    <classificationMethod id="Quantile">
      <symmetricMode enabled="0" astride="0" symmetrypoint="0"/>
      <labelFormat trimtrailingzeroes="1" labelprecision="4" format="%1 - %2"/>
      <parameters>
        <Option/>
      </parameters>
      <extraInformation/>
    </classificationMethod>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <customproperties>
    <Option type="Map">
      <Option type="int" name="embeddedWidgets/count" value="0"/>
      <Option name="variableNames"/>
      <Option name="variableValues"/>
    </Option>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory spacing="5" penWidth="0" width="15" rotationOffset="270" scaleDependency="Area" showAxis="1" lineSizeType="MM" minimumSize="0" labelPlacementMethod="XHeight" spacingUnitScale="3x:0,0,0,0,0,0" barWidth="5" opacity="1" spacingUnit="MM" enabled="0" backgroundColor="#ffffff" maxScaleDenominator="1e+08" height="15" penAlpha="255" diagramOrientation="Up" penColor="#000000" sizeScale="3x:0,0,0,0,0,0" minScaleDenominator="0" direction="0" backgroundAlpha="255" scaleBasedVisibility="0" sizeType="MM" lineSizeScale="3x:0,0,0,0,0,0">
      <fontProperties style="" description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0"/>
      <attribute label="" field="" color="#000000"/>
      <axisSymbol>
        <symbol force_rhr="0" alpha="1" clip_to_extent="1" type="line" name="">
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <layer pass="0" enabled="1" class="SimpleLine" locked="0">
            <Option type="Map">
              <Option type="QString" name="align_dash_pattern" value="0"/>
              <Option type="QString" name="capstyle" value="square"/>
              <Option type="QString" name="customdash" value="5;2"/>
              <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
              <Option type="QString" name="customdash_unit" value="MM"/>
              <Option type="QString" name="dash_pattern_offset" value="0"/>
              <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
              <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
              <Option type="QString" name="draw_inside_polygon" value="0"/>
              <Option type="QString" name="joinstyle" value="bevel"/>
              <Option type="QString" name="line_color" value="35,35,35,255"/>
              <Option type="QString" name="line_style" value="solid"/>
              <Option type="QString" name="line_width" value="0.26"/>
              <Option type="QString" name="line_width_unit" value="MM"/>
              <Option type="QString" name="offset" value="0"/>
              <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
              <Option type="QString" name="offset_unit" value="MM"/>
              <Option type="QString" name="ring_filter" value="0"/>
              <Option type="QString" name="trim_distance_end" value="0"/>
              <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
              <Option type="QString" name="trim_distance_end_unit" value="MM"/>
              <Option type="QString" name="trim_distance_start" value="0"/>
              <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
              <Option type="QString" name="trim_distance_start_unit" value="MM"/>
              <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
              <Option type="QString" name="use_custom_dash" value="0"/>
              <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            </Option>
            <prop k="align_dash_pattern" v="0"/>
            <prop k="capstyle" v="square"/>
            <prop k="customdash" v="5;2"/>
            <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
            <prop k="customdash_unit" v="MM"/>
            <prop k="dash_pattern_offset" v="0"/>
            <prop k="dash_pattern_offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
            <prop k="dash_pattern_offset_unit" v="MM"/>
            <prop k="draw_inside_polygon" v="0"/>
            <prop k="joinstyle" v="bevel"/>
            <prop k="line_color" v="35,35,35,255"/>
            <prop k="line_style" v="solid"/>
            <prop k="line_width" v="0.26"/>
            <prop k="line_width_unit" v="MM"/>
            <prop k="offset" v="0"/>
            <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
            <prop k="offset_unit" v="MM"/>
            <prop k="ring_filter" v="0"/>
            <prop k="trim_distance_end" v="0"/>
            <prop k="trim_distance_end_map_unit_scale" v="3x:0,0,0,0,0,0"/>
            <prop k="trim_distance_end_unit" v="MM"/>
            <prop k="trim_distance_start" v="0"/>
            <prop k="trim_distance_start_map_unit_scale" v="3x:0,0,0,0,0,0"/>
            <prop k="trim_distance_start_unit" v="MM"/>
            <prop k="tweak_dash_pattern_on_corners" v="0"/>
            <prop k="use_custom_dash" v="0"/>
            <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
          </layer>
        </symbol>
      </axisSymbol>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings placement="2" zIndex="0" showAll="1" linePlacementFlags="18" obstacle="0" priority="0" dist="0">
    <properties>
      <Option type="Map">
        <Option type="QString" name="name" value=""/>
        <Option name="properties"/>
        <Option type="QString" name="type" value="collection"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <legend type="default-vector" showLabelLegend="0"/>
  <referencedLayers/>
  <fieldConfiguration>
    <field name="ReachID" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="WatershedID" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ReachCode" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="IsPeren" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="StreamName" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Orig_DA" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iGeo_Slope" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iGeo_ElMax" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iGeo_ElMin" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iGeo_Len" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iGeo_DA" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iVeg100EX" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iVeg_30EX" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iVeg100HPE" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iVeg_30HPE" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iPC_Road" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iPC_RoadX" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iPC_RoadVB" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iPC_Rail" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iPC_RailVB" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iPC_LU" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iPC_VLowLU" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iPC_LowLU" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iPC_ModLU" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iPC_HighLU" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iHyd_QLow" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iHyd_Q2" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iHyd_SPLow" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iHyd_SP2" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="AgencyID" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="oVC_HPE" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="oVC_EX" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="oCC_HPE" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="mCC_HPE_CT" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="oCC_EX" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="mCC_EX_CT" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="LimitationID" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="RiskID" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="OpportunityID" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iPC_Canal" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iPC_DivPts" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="iPC_Privat" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="oPC_Dist" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="IsMainCh" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="IsMultiCh" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="mCC_HisDep" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Watershed" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ReachType" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Agency" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Limitation" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Risk" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Opportunity" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="ReachID"/>
    <alias name="" index="1" field="WatershedID"/>
    <alias name="" index="2" field="ReachCode"/>
    <alias name="" index="3" field="IsPeren"/>
    <alias name="" index="4" field="StreamName"/>
    <alias name="" index="5" field="Orig_DA"/>
    <alias name="" index="6" field="iGeo_Slope"/>
    <alias name="" index="7" field="iGeo_ElMax"/>
    <alias name="" index="8" field="iGeo_ElMin"/>
    <alias name="" index="9" field="iGeo_Len"/>
    <alias name="" index="10" field="iGeo_DA"/>
    <alias name="" index="11" field="iVeg100EX"/>
    <alias name="" index="12" field="iVeg_30EX"/>
    <alias name="" index="13" field="iVeg100HPE"/>
    <alias name="" index="14" field="iVeg_30HPE"/>
    <alias name="" index="15" field="iPC_Road"/>
    <alias name="" index="16" field="iPC_RoadX"/>
    <alias name="" index="17" field="iPC_RoadVB"/>
    <alias name="" index="18" field="iPC_Rail"/>
    <alias name="" index="19" field="iPC_RailVB"/>
    <alias name="" index="20" field="iPC_LU"/>
    <alias name="" index="21" field="iPC_VLowLU"/>
    <alias name="" index="22" field="iPC_LowLU"/>
    <alias name="" index="23" field="iPC_ModLU"/>
    <alias name="" index="24" field="iPC_HighLU"/>
    <alias name="" index="25" field="iHyd_QLow"/>
    <alias name="" index="26" field="iHyd_Q2"/>
    <alias name="" index="27" field="iHyd_SPLow"/>
    <alias name="" index="28" field="iHyd_SP2"/>
    <alias name="" index="29" field="AgencyID"/>
    <alias name="" index="30" field="oVC_HPE"/>
    <alias name="" index="31" field="oVC_EX"/>
    <alias name="" index="32" field="oCC_HPE"/>
    <alias name="" index="33" field="mCC_HPE_CT"/>
    <alias name="" index="34" field="oCC_EX"/>
    <alias name="" index="35" field="mCC_EX_CT"/>
    <alias name="" index="36" field="LimitationID"/>
    <alias name="" index="37" field="RiskID"/>
    <alias name="" index="38" field="OpportunityID"/>
    <alias name="" index="39" field="iPC_Canal"/>
    <alias name="" index="40" field="iPC_DivPts"/>
    <alias name="" index="41" field="iPC_Privat"/>
    <alias name="" index="42" field="oPC_Dist"/>
    <alias name="" index="43" field="IsMainCh"/>
    <alias name="" index="44" field="IsMultiCh"/>
    <alias name="" index="45" field="mCC_HisDep"/>
    <alias name="" index="46" field="Watershed"/>
    <alias name="" index="47" field="ReachType"/>
    <alias name="" index="48" field="Agency"/>
    <alias name="" index="49" field="Limitation"/>
    <alias name="" index="50" field="Risk"/>
    <alias name="" index="51" field="Opportunity"/>
  </aliases>
  <defaults>
    <default expression="" field="ReachID" applyOnUpdate="0"/>
    <default expression="" field="WatershedID" applyOnUpdate="0"/>
    <default expression="" field="ReachCode" applyOnUpdate="0"/>
    <default expression="" field="IsPeren" applyOnUpdate="0"/>
    <default expression="" field="StreamName" applyOnUpdate="0"/>
    <default expression="" field="Orig_DA" applyOnUpdate="0"/>
    <default expression="" field="iGeo_Slope" applyOnUpdate="0"/>
    <default expression="" field="iGeo_ElMax" applyOnUpdate="0"/>
    <default expression="" field="iGeo_ElMin" applyOnUpdate="0"/>
    <default expression="" field="iGeo_Len" applyOnUpdate="0"/>
    <default expression="" field="iGeo_DA" applyOnUpdate="0"/>
    <default expression="" field="iVeg100EX" applyOnUpdate="0"/>
    <default expression="" field="iVeg_30EX" applyOnUpdate="0"/>
    <default expression="" field="iVeg100HPE" applyOnUpdate="0"/>
    <default expression="" field="iVeg_30HPE" applyOnUpdate="0"/>
    <default expression="" field="iPC_Road" applyOnUpdate="0"/>
    <default expression="" field="iPC_RoadX" applyOnUpdate="0"/>
    <default expression="" field="iPC_RoadVB" applyOnUpdate="0"/>
    <default expression="" field="iPC_Rail" applyOnUpdate="0"/>
    <default expression="" field="iPC_RailVB" applyOnUpdate="0"/>
    <default expression="" field="iPC_LU" applyOnUpdate="0"/>
    <default expression="" field="iPC_VLowLU" applyOnUpdate="0"/>
    <default expression="" field="iPC_LowLU" applyOnUpdate="0"/>
    <default expression="" field="iPC_ModLU" applyOnUpdate="0"/>
    <default expression="" field="iPC_HighLU" applyOnUpdate="0"/>
    <default expression="" field="iHyd_QLow" applyOnUpdate="0"/>
    <default expression="" field="iHyd_Q2" applyOnUpdate="0"/>
    <default expression="" field="iHyd_SPLow" applyOnUpdate="0"/>
    <default expression="" field="iHyd_SP2" applyOnUpdate="0"/>
    <default expression="" field="AgencyID" applyOnUpdate="0"/>
    <default expression="" field="oVC_HPE" applyOnUpdate="0"/>
    <default expression="" field="oVC_EX" applyOnUpdate="0"/>
    <default expression="" field="oCC_HPE" applyOnUpdate="0"/>
    <default expression="" field="mCC_HPE_CT" applyOnUpdate="0"/>
    <default expression="" field="oCC_EX" applyOnUpdate="0"/>
    <default expression="" field="mCC_EX_CT" applyOnUpdate="0"/>
    <default expression="" field="LimitationID" applyOnUpdate="0"/>
    <default expression="" field="RiskID" applyOnUpdate="0"/>
    <default expression="" field="OpportunityID" applyOnUpdate="0"/>
    <default expression="" field="iPC_Canal" applyOnUpdate="0"/>
    <default expression="" field="iPC_DivPts" applyOnUpdate="0"/>
    <default expression="" field="iPC_Privat" applyOnUpdate="0"/>
    <default expression="" field="oPC_Dist" applyOnUpdate="0"/>
    <default expression="" field="IsMainCh" applyOnUpdate="0"/>
    <default expression="" field="IsMultiCh" applyOnUpdate="0"/>
    <default expression="" field="mCC_HisDep" applyOnUpdate="0"/>
    <default expression="" field="Watershed" applyOnUpdate="0"/>
    <default expression="" field="ReachType" applyOnUpdate="0"/>
    <default expression="" field="Agency" applyOnUpdate="0"/>
    <default expression="" field="Limitation" applyOnUpdate="0"/>
    <default expression="" field="Risk" applyOnUpdate="0"/>
    <default expression="" field="Opportunity" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint constraints="0" exp_strength="0" field="ReachID" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="WatershedID" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="ReachCode" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="IsPeren" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="StreamName" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="Orig_DA" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iGeo_Slope" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iGeo_ElMax" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iGeo_ElMin" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iGeo_Len" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iGeo_DA" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iVeg100EX" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iVeg_30EX" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iVeg100HPE" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iVeg_30HPE" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iPC_Road" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iPC_RoadX" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iPC_RoadVB" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iPC_Rail" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iPC_RailVB" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iPC_LU" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iPC_VLowLU" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iPC_LowLU" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iPC_ModLU" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iPC_HighLU" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iHyd_QLow" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iHyd_Q2" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iHyd_SPLow" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iHyd_SP2" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="AgencyID" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="oVC_HPE" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="oVC_EX" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="oCC_HPE" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="mCC_HPE_CT" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="oCC_EX" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="mCC_EX_CT" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="LimitationID" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="RiskID" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="OpportunityID" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iPC_Canal" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iPC_DivPts" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="iPC_Privat" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="oPC_Dist" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="IsMainCh" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="IsMultiCh" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="mCC_HisDep" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="Watershed" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="ReachType" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="Agency" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="Limitation" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="Risk" unique_strength="0" notnull_strength="0"/>
    <constraint constraints="0" exp_strength="0" field="Opportunity" unique_strength="0" notnull_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="ReachID"/>
    <constraint exp="" desc="" field="WatershedID"/>
    <constraint exp="" desc="" field="ReachCode"/>
    <constraint exp="" desc="" field="IsPeren"/>
    <constraint exp="" desc="" field="StreamName"/>
    <constraint exp="" desc="" field="Orig_DA"/>
    <constraint exp="" desc="" field="iGeo_Slope"/>
    <constraint exp="" desc="" field="iGeo_ElMax"/>
    <constraint exp="" desc="" field="iGeo_ElMin"/>
    <constraint exp="" desc="" field="iGeo_Len"/>
    <constraint exp="" desc="" field="iGeo_DA"/>
    <constraint exp="" desc="" field="iVeg100EX"/>
    <constraint exp="" desc="" field="iVeg_30EX"/>
    <constraint exp="" desc="" field="iVeg100HPE"/>
    <constraint exp="" desc="" field="iVeg_30HPE"/>
    <constraint exp="" desc="" field="iPC_Road"/>
    <constraint exp="" desc="" field="iPC_RoadX"/>
    <constraint exp="" desc="" field="iPC_RoadVB"/>
    <constraint exp="" desc="" field="iPC_Rail"/>
    <constraint exp="" desc="" field="iPC_RailVB"/>
    <constraint exp="" desc="" field="iPC_LU"/>
    <constraint exp="" desc="" field="iPC_VLowLU"/>
    <constraint exp="" desc="" field="iPC_LowLU"/>
    <constraint exp="" desc="" field="iPC_ModLU"/>
    <constraint exp="" desc="" field="iPC_HighLU"/>
    <constraint exp="" desc="" field="iHyd_QLow"/>
    <constraint exp="" desc="" field="iHyd_Q2"/>
    <constraint exp="" desc="" field="iHyd_SPLow"/>
    <constraint exp="" desc="" field="iHyd_SP2"/>
    <constraint exp="" desc="" field="AgencyID"/>
    <constraint exp="" desc="" field="oVC_HPE"/>
    <constraint exp="" desc="" field="oVC_EX"/>
    <constraint exp="" desc="" field="oCC_HPE"/>
    <constraint exp="" desc="" field="mCC_HPE_CT"/>
    <constraint exp="" desc="" field="oCC_EX"/>
    <constraint exp="" desc="" field="mCC_EX_CT"/>
    <constraint exp="" desc="" field="LimitationID"/>
    <constraint exp="" desc="" field="RiskID"/>
    <constraint exp="" desc="" field="OpportunityID"/>
    <constraint exp="" desc="" field="iPC_Canal"/>
    <constraint exp="" desc="" field="iPC_DivPts"/>
    <constraint exp="" desc="" field="iPC_Privat"/>
    <constraint exp="" desc="" field="oPC_Dist"/>
    <constraint exp="" desc="" field="IsMainCh"/>
    <constraint exp="" desc="" field="IsMultiCh"/>
    <constraint exp="" desc="" field="mCC_HisDep"/>
    <constraint exp="" desc="" field="Watershed"/>
    <constraint exp="" desc="" field="ReachType"/>
    <constraint exp="" desc="" field="Agency"/>
    <constraint exp="" desc="" field="Limitation"/>
    <constraint exp="" desc="" field="Risk"/>
    <constraint exp="" desc="" field="Opportunity"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortExpression="" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column width="-1" type="field" name="ReachID" hidden="0"/>
      <column width="-1" type="field" name="WatershedID" hidden="0"/>
      <column width="-1" type="field" name="ReachCode" hidden="0"/>
      <column width="-1" type="field" name="IsPeren" hidden="0"/>
      <column width="-1" type="field" name="StreamName" hidden="0"/>
      <column width="-1" type="field" name="Orig_DA" hidden="0"/>
      <column width="-1" type="field" name="iGeo_Slope" hidden="0"/>
      <column width="-1" type="field" name="iGeo_ElMax" hidden="0"/>
      <column width="-1" type="field" name="iGeo_ElMin" hidden="0"/>
      <column width="-1" type="field" name="iGeo_Len" hidden="0"/>
      <column width="-1" type="field" name="iGeo_DA" hidden="0"/>
      <column width="-1" type="field" name="iVeg100EX" hidden="0"/>
      <column width="-1" type="field" name="iVeg_30EX" hidden="0"/>
      <column width="-1" type="field" name="iVeg100HPE" hidden="0"/>
      <column width="-1" type="field" name="iVeg_30HPE" hidden="0"/>
      <column width="-1" type="field" name="iPC_Road" hidden="0"/>
      <column width="-1" type="field" name="iPC_RoadX" hidden="0"/>
      <column width="-1" type="field" name="iPC_RoadVB" hidden="0"/>
      <column width="-1" type="field" name="iPC_Rail" hidden="0"/>
      <column width="-1" type="field" name="iPC_RailVB" hidden="0"/>
      <column width="-1" type="field" name="iPC_LU" hidden="0"/>
      <column width="-1" type="field" name="iPC_VLowLU" hidden="0"/>
      <column width="-1" type="field" name="iPC_LowLU" hidden="0"/>
      <column width="-1" type="field" name="iPC_ModLU" hidden="0"/>
      <column width="-1" type="field" name="iPC_HighLU" hidden="0"/>
      <column width="-1" type="field" name="iHyd_QLow" hidden="0"/>
      <column width="-1" type="field" name="iHyd_Q2" hidden="0"/>
      <column width="-1" type="field" name="iHyd_SPLow" hidden="0"/>
      <column width="-1" type="field" name="iHyd_SP2" hidden="0"/>
      <column width="-1" type="field" name="AgencyID" hidden="0"/>
      <column width="-1" type="field" name="oVC_HPE" hidden="0"/>
      <column width="-1" type="field" name="oVC_EX" hidden="0"/>
      <column width="-1" type="field" name="oCC_HPE" hidden="0"/>
      <column width="-1" type="field" name="mCC_HPE_CT" hidden="0"/>
      <column width="-1" type="field" name="oCC_EX" hidden="0"/>
      <column width="-1" type="field" name="mCC_EX_CT" hidden="0"/>
      <column width="-1" type="field" name="LimitationID" hidden="0"/>
      <column width="-1" type="field" name="RiskID" hidden="0"/>
      <column width="-1" type="field" name="OpportunityID" hidden="0"/>
      <column width="-1" type="field" name="iPC_Canal" hidden="0"/>
      <column width="-1" type="field" name="iPC_DivPts" hidden="0"/>
      <column width="-1" type="field" name="iPC_Privat" hidden="0"/>
      <column width="-1" type="field" name="oPC_Dist" hidden="0"/>
      <column width="-1" type="field" name="IsMainCh" hidden="0"/>
      <column width="-1" type="field" name="IsMultiCh" hidden="0"/>
      <column width="-1" type="field" name="mCC_HisDep" hidden="0"/>
      <column width="-1" type="field" name="Watershed" hidden="0"/>
      <column width="-1" type="field" name="ReachType" hidden="0"/>
      <column width="-1" type="field" name="Agency" hidden="0"/>
      <column width="-1" type="field" name="Limitation" hidden="0"/>
      <column width="-1" type="field" name="Risk" hidden="0"/>
      <column width="-1" type="field" name="Opportunity" hidden="0"/>
      <column width="-1" type="actions" hidden="1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field editable="1" name="Agency"/>
    <field editable="1" name="AgencyID"/>
    <field editable="1" name="IsMainCh"/>
    <field editable="1" name="IsMultiCh"/>
    <field editable="1" name="IsPeren"/>
    <field editable="1" name="Limitation"/>
    <field editable="1" name="LimitationID"/>
    <field editable="1" name="Opportunity"/>
    <field editable="1" name="OpportunityID"/>
    <field editable="1" name="Orig_DA"/>
    <field editable="1" name="ReachCode"/>
    <field editable="1" name="ReachID"/>
    <field editable="1" name="ReachType"/>
    <field editable="1" name="Risk"/>
    <field editable="1" name="RiskID"/>
    <field editable="1" name="StreamName"/>
    <field editable="1" name="Watershed"/>
    <field editable="1" name="WatershedID"/>
    <field editable="1" name="iGeo_DA"/>
    <field editable="1" name="iGeo_ElMax"/>
    <field editable="1" name="iGeo_ElMin"/>
    <field editable="1" name="iGeo_Len"/>
    <field editable="1" name="iGeo_Slope"/>
    <field editable="1" name="iHyd_Q2"/>
    <field editable="1" name="iHyd_QLow"/>
    <field editable="1" name="iHyd_SP2"/>
    <field editable="1" name="iHyd_SPLow"/>
    <field editable="1" name="iPC_Canal"/>
    <field editable="1" name="iPC_DivPts"/>
    <field editable="1" name="iPC_HighLU"/>
    <field editable="1" name="iPC_LU"/>
    <field editable="1" name="iPC_LowLU"/>
    <field editable="1" name="iPC_ModLU"/>
    <field editable="1" name="iPC_Privat"/>
    <field editable="1" name="iPC_Rail"/>
    <field editable="1" name="iPC_RailVB"/>
    <field editable="1" name="iPC_Road"/>
    <field editable="1" name="iPC_RoadVB"/>
    <field editable="1" name="iPC_RoadX"/>
    <field editable="1" name="iPC_VLowLU"/>
    <field editable="1" name="iVeg100EX"/>
    <field editable="1" name="iVeg100HPE"/>
    <field editable="1" name="iVeg_30EX"/>
    <field editable="1" name="iVeg_30HPE"/>
    <field editable="1" name="mCC_EX_CT"/>
    <field editable="1" name="mCC_HPE_CT"/>
    <field editable="1" name="mCC_HisDep"/>
    <field editable="1" name="oCC_EX"/>
    <field editable="1" name="oCC_HPE"/>
    <field editable="1" name="oPC_Dist"/>
    <field editable="1" name="oVC_EX"/>
    <field editable="1" name="oVC_HPE"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="Agency"/>
    <field labelOnTop="0" name="AgencyID"/>
    <field labelOnTop="0" name="IsMainCh"/>
    <field labelOnTop="0" name="IsMultiCh"/>
    <field labelOnTop="0" name="IsPeren"/>
    <field labelOnTop="0" name="Limitation"/>
    <field labelOnTop="0" name="LimitationID"/>
    <field labelOnTop="0" name="Opportunity"/>
    <field labelOnTop="0" name="OpportunityID"/>
    <field labelOnTop="0" name="Orig_DA"/>
    <field labelOnTop="0" name="ReachCode"/>
    <field labelOnTop="0" name="ReachID"/>
    <field labelOnTop="0" name="ReachType"/>
    <field labelOnTop="0" name="Risk"/>
    <field labelOnTop="0" name="RiskID"/>
    <field labelOnTop="0" name="StreamName"/>
    <field labelOnTop="0" name="Watershed"/>
    <field labelOnTop="0" name="WatershedID"/>
    <field labelOnTop="0" name="iGeo_DA"/>
    <field labelOnTop="0" name="iGeo_ElMax"/>
    <field labelOnTop="0" name="iGeo_ElMin"/>
    <field labelOnTop="0" name="iGeo_Len"/>
    <field labelOnTop="0" name="iGeo_Slope"/>
    <field labelOnTop="0" name="iHyd_Q2"/>
    <field labelOnTop="0" name="iHyd_QLow"/>
    <field labelOnTop="0" name="iHyd_SP2"/>
    <field labelOnTop="0" name="iHyd_SPLow"/>
    <field labelOnTop="0" name="iPC_Canal"/>
    <field labelOnTop="0" name="iPC_DivPts"/>
    <field labelOnTop="0" name="iPC_HighLU"/>
    <field labelOnTop="0" name="iPC_LU"/>
    <field labelOnTop="0" name="iPC_LowLU"/>
    <field labelOnTop="0" name="iPC_ModLU"/>
    <field labelOnTop="0" name="iPC_Privat"/>
    <field labelOnTop="0" name="iPC_Rail"/>
    <field labelOnTop="0" name="iPC_RailVB"/>
    <field labelOnTop="0" name="iPC_Road"/>
    <field labelOnTop="0" name="iPC_RoadVB"/>
    <field labelOnTop="0" name="iPC_RoadX"/>
    <field labelOnTop="0" name="iPC_VLowLU"/>
    <field labelOnTop="0" name="iVeg100EX"/>
    <field labelOnTop="0" name="iVeg100HPE"/>
    <field labelOnTop="0" name="iVeg_30EX"/>
    <field labelOnTop="0" name="iVeg_30HPE"/>
    <field labelOnTop="0" name="mCC_EX_CT"/>
    <field labelOnTop="0" name="mCC_HPE_CT"/>
    <field labelOnTop="0" name="mCC_HisDep"/>
    <field labelOnTop="0" name="oCC_EX"/>
    <field labelOnTop="0" name="oCC_HPE"/>
    <field labelOnTop="0" name="oPC_Dist"/>
    <field labelOnTop="0" name="oVC_EX"/>
    <field labelOnTop="0" name="oVC_HPE"/>
  </labelOnTop>
  <reuseLastValue>
    <field reuseLastValue="0" name="Agency"/>
    <field reuseLastValue="0" name="AgencyID"/>
    <field reuseLastValue="0" name="IsMainCh"/>
    <field reuseLastValue="0" name="IsMultiCh"/>
    <field reuseLastValue="0" name="IsPeren"/>
    <field reuseLastValue="0" name="Limitation"/>
    <field reuseLastValue="0" name="LimitationID"/>
    <field reuseLastValue="0" name="Opportunity"/>
    <field reuseLastValue="0" name="OpportunityID"/>
    <field reuseLastValue="0" name="Orig_DA"/>
    <field reuseLastValue="0" name="ReachCode"/>
    <field reuseLastValue="0" name="ReachID"/>
    <field reuseLastValue="0" name="ReachType"/>
    <field reuseLastValue="0" name="Risk"/>
    <field reuseLastValue="0" name="RiskID"/>
    <field reuseLastValue="0" name="StreamName"/>
    <field reuseLastValue="0" name="Watershed"/>
    <field reuseLastValue="0" name="WatershedID"/>
    <field reuseLastValue="0" name="iGeo_DA"/>
    <field reuseLastValue="0" name="iGeo_ElMax"/>
    <field reuseLastValue="0" name="iGeo_ElMin"/>
    <field reuseLastValue="0" name="iGeo_Len"/>
    <field reuseLastValue="0" name="iGeo_Slope"/>
    <field reuseLastValue="0" name="iHyd_Q2"/>
    <field reuseLastValue="0" name="iHyd_QLow"/>
    <field reuseLastValue="0" name="iHyd_SP2"/>
    <field reuseLastValue="0" name="iHyd_SPLow"/>
    <field reuseLastValue="0" name="iPC_Canal"/>
    <field reuseLastValue="0" name="iPC_DivPts"/>
    <field reuseLastValue="0" name="iPC_HighLU"/>
    <field reuseLastValue="0" name="iPC_LU"/>
    <field reuseLastValue="0" name="iPC_LowLU"/>
    <field reuseLastValue="0" name="iPC_ModLU"/>
    <field reuseLastValue="0" name="iPC_Privat"/>
    <field reuseLastValue="0" name="iPC_Rail"/>
    <field reuseLastValue="0" name="iPC_RailVB"/>
    <field reuseLastValue="0" name="iPC_Road"/>
    <field reuseLastValue="0" name="iPC_RoadVB"/>
    <field reuseLastValue="0" name="iPC_RoadX"/>
    <field reuseLastValue="0" name="iPC_VLowLU"/>
    <field reuseLastValue="0" name="iVeg100EX"/>
    <field reuseLastValue="0" name="iVeg100HPE"/>
    <field reuseLastValue="0" name="iVeg_30EX"/>
    <field reuseLastValue="0" name="iVeg_30HPE"/>
    <field reuseLastValue="0" name="mCC_EX_CT"/>
    <field reuseLastValue="0" name="mCC_HPE_CT"/>
    <field reuseLastValue="0" name="mCC_HisDep"/>
    <field reuseLastValue="0" name="oCC_EX"/>
    <field reuseLastValue="0" name="oCC_HPE"/>
    <field reuseLastValue="0" name="oPC_Dist"/>
    <field reuseLastValue="0" name="oVC_EX"/>
    <field reuseLastValue="0" name="oVC_HPE"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"StreamName"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
