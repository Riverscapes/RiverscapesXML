<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.20.0-Odense" simplifyDrawingHints="1" labelsEnabled="0" simplifyAlgorithm="0" maxScale="0" simplifyMaxScale="1" readOnly="0" simplifyDrawingTol="1" minScale="100000000" simplifyLocal="1" styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal enabled="0" mode="0" durationField="" durationUnit="min" fixedDuration="0" startExpression="" accumulate="0" endField="" endExpression="" startField="">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <renderer-v2 enableorderby="0" forceraster="0" type="graduatedSymbol" attr="iPC_Rail" graduatedMethod="GraduatedColor" symbollevels="0">
    <ranges>
      <range render="true" upper="30.001000000000001" lower="0.000000000000000" symbol="0" label="Immediately Adjacent (0 - 30 m)"/>
      <range render="true" upper="100.001000000000005" lower="30.001000000000001" symbol="1" label="Within Normal Forage Range (30 - 100 m)"/>
      <range render="true" upper="300.000999999999976" lower="100.001000000000005" symbol="2" label="Within Plausible Forage range (100 - 300 m)"/>
      <range render="true" upper="1000.000999999999976" lower="300.000999999999976" symbol="3" label="Outside Range of Concern (300 m - 1 km)"/>
      <range render="true" upper="1000000.000000000000000" lower="1000.000999999999976" symbol="4" label="Not Close (> 1 km)"/>
    </ranges>
    <symbols>
      <symbol type="line" clip_to_extent="1" force_rhr="0" name="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" class="SimpleLine" locked="0" pass="0">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="round" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="round" name="joinstyle"/>
            <Option type="QString" value="255,34,0,255" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="1.5" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
          </Option>
          <prop k="align_dash_pattern" v="0"/>
          <prop k="capstyle" v="round"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="dash_pattern_offset" v="0"/>
          <prop k="dash_pattern_offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="dash_pattern_offset_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="round"/>
          <prop k="line_color" v="255,34,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="1.5"/>
          <prop k="line_width_unit" v="Point"/>
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
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="line" clip_to_extent="1" force_rhr="0" name="1" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" class="SimpleLine" locked="0" pass="0">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="round" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="round" name="joinstyle"/>
            <Option type="QString" value="255,153,0,255" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="1.25" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
          </Option>
          <prop k="align_dash_pattern" v="0"/>
          <prop k="capstyle" v="round"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="dash_pattern_offset" v="0"/>
          <prop k="dash_pattern_offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="dash_pattern_offset_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="round"/>
          <prop k="line_color" v="255,153,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="1.25"/>
          <prop k="line_width_unit" v="Point"/>
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
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="line" clip_to_extent="1" force_rhr="0" name="2" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" class="SimpleLine" locked="0" pass="0">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="round" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="round" name="joinstyle"/>
            <Option type="QString" value="255,255,0,255" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="1" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
          </Option>
          <prop k="align_dash_pattern" v="0"/>
          <prop k="capstyle" v="round"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="dash_pattern_offset" v="0"/>
          <prop k="dash_pattern_offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="dash_pattern_offset_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="round"/>
          <prop k="line_color" v="255,255,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="1"/>
          <prop k="line_width_unit" v="Point"/>
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
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="line" clip_to_extent="1" force_rhr="0" name="3" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" class="SimpleLine" locked="0" pass="0">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="round" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="round" name="joinstyle"/>
            <Option type="QString" value="122,171,0,255" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="1" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
          </Option>
          <prop k="align_dash_pattern" v="0"/>
          <prop k="capstyle" v="round"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="dash_pattern_offset" v="0"/>
          <prop k="dash_pattern_offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="dash_pattern_offset_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="round"/>
          <prop k="line_color" v="122,171,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="1"/>
          <prop k="line_width_unit" v="Point"/>
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
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="line" clip_to_extent="1" force_rhr="0" name="4" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" class="SimpleLine" locked="0" pass="0">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="round" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="round" name="joinstyle"/>
            <Option type="QString" value="0,97,0,255" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="0.75" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
          </Option>
          <prop k="align_dash_pattern" v="0"/>
          <prop k="capstyle" v="round"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="dash_pattern_offset" v="0"/>
          <prop k="dash_pattern_offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="dash_pattern_offset_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="round"/>
          <prop k="line_color" v="0,97,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.75"/>
          <prop k="line_width_unit" v="Point"/>
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
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <source-symbol>
      <symbol type="line" clip_to_extent="1" force_rhr="0" name="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" class="SimpleLine" locked="0" pass="0">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="114,155,111,255" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="0.26" name="line_width"/>
            <Option type="QString" value="MM" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
          <prop k="line_color" v="114,155,111,255"/>
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
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </source-symbol>
    <colorramp type="gradient" name="[source]">
      <Option type="Map">
        <Option type="QString" value="255,255,255,255" name="color1"/>
        <Option type="QString" value="255,0,0,255" name="color2"/>
        <Option type="QString" value="0" name="discrete"/>
        <Option type="QString" value="gradient" name="rampType"/>
      </Option>
      <prop k="color1" v="255,255,255,255"/>
      <prop k="color2" v="255,0,0,255"/>
      <prop k="discrete" v="0"/>
      <prop k="rampType" v="gradient"/>
    </colorramp>
    <classificationMethod id="Quantile">
      <symmetricMode enabled="0" symmetrypoint="0" astride="0"/>
      <labelFormat format="%1 - %2" labelprecision="0" trimtrailingzeroes="1"/>
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
      <Option type="int" value="0" name="embeddedWidgets/count"/>
      <Option name="variableNames"/>
      <Option name="variableValues"/>
    </Option>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory scaleDependency="Area" height="15" labelPlacementMethod="XHeight" sizeScale="3x:0,0,0,0,0,0" width="15" backgroundAlpha="255" minScaleDenominator="0" maxScaleDenominator="1e+08" opacity="1" backgroundColor="#ffffff" diagramOrientation="Up" showAxis="1" scaleBasedVisibility="0" penColor="#000000" penWidth="0" spacingUnitScale="3x:0,0,0,0,0,0" sizeType="MM" spacingUnit="MM" enabled="0" spacing="5" rotationOffset="270" direction="0" barWidth="5" lineSizeScale="3x:0,0,0,0,0,0" lineSizeType="MM" minimumSize="0" penAlpha="255">
      <fontProperties style="" description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0"/>
      <axisSymbol>
        <symbol type="line" clip_to_extent="1" force_rhr="0" name="" alpha="1">
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <layer enabled="1" class="SimpleLine" locked="0" pass="0">
            <Option type="Map">
              <Option type="QString" value="0" name="align_dash_pattern"/>
              <Option type="QString" value="square" name="capstyle"/>
              <Option type="QString" value="5;2" name="customdash"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
              <Option type="QString" value="MM" name="customdash_unit"/>
              <Option type="QString" value="0" name="dash_pattern_offset"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
              <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
              <Option type="QString" value="0" name="draw_inside_polygon"/>
              <Option type="QString" value="bevel" name="joinstyle"/>
              <Option type="QString" value="35,35,35,255" name="line_color"/>
              <Option type="QString" value="solid" name="line_style"/>
              <Option type="QString" value="0.26" name="line_width"/>
              <Option type="QString" value="MM" name="line_width_unit"/>
              <Option type="QString" value="0" name="offset"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
              <Option type="QString" value="MM" name="offset_unit"/>
              <Option type="QString" value="0" name="ring_filter"/>
              <Option type="QString" value="0" name="trim_distance_end"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
              <Option type="QString" value="MM" name="trim_distance_end_unit"/>
              <Option type="QString" value="0" name="trim_distance_start"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
              <Option type="QString" value="MM" name="trim_distance_start_unit"/>
              <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
              <Option type="QString" value="0" name="use_custom_dash"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
          </layer>
        </symbol>
      </axisSymbol>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings obstacle="0" linePlacementFlags="18" showAll="1" priority="0" zIndex="0" dist="0" placement="2">
    <properties>
      <Option type="Map">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <legend type="default-vector" showLabelLegend="0"/>
  <referencedLayers/>
  <fieldConfiguration>
    <field configurationFlags="None" name="ReachID">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="WatershedID">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="ReachCode">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="IsPeren">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="StreamName">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="Orig_DA">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iGeo_Slope">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iGeo_ElMax">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iGeo_ElMin">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iGeo_Len">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iGeo_DA">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iVeg100EX">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iVeg_30EX">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iVeg100HPE">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iVeg_30HPE">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iPC_Road">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iPC_RoadX">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iPC_RoadVB">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iPC_Rail">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iPC_RailVB">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iPC_LU">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iPC_VLowLU">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iPC_LowLU">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iPC_ModLU">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iPC_HighLU">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iHyd_QLow">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iHyd_Q2">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iHyd_SPLow">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iHyd_SP2">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="AgencyID">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="oVC_HPE">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="oVC_EX">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="oCC_HPE">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="mCC_HPE_CT">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="oCC_EX">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="mCC_EX_CT">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="LimitationID">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="RiskID">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="OpportunityID">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iPC_Canal">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iPC_DivPts">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="iPC_Privat">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="oPC_Dist">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="IsMainCh">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="IsMultiCh">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="mCC_HisDep">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="Watershed">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="ReachType">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="Agency">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="Limitation">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="Risk">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="Opportunity">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="ReachID" index="0" name=""/>
    <alias field="WatershedID" index="1" name=""/>
    <alias field="ReachCode" index="2" name=""/>
    <alias field="IsPeren" index="3" name=""/>
    <alias field="StreamName" index="4" name=""/>
    <alias field="Orig_DA" index="5" name=""/>
    <alias field="iGeo_Slope" index="6" name=""/>
    <alias field="iGeo_ElMax" index="7" name=""/>
    <alias field="iGeo_ElMin" index="8" name=""/>
    <alias field="iGeo_Len" index="9" name=""/>
    <alias field="iGeo_DA" index="10" name=""/>
    <alias field="iVeg100EX" index="11" name=""/>
    <alias field="iVeg_30EX" index="12" name=""/>
    <alias field="iVeg100HPE" index="13" name=""/>
    <alias field="iVeg_30HPE" index="14" name=""/>
    <alias field="iPC_Road" index="15" name=""/>
    <alias field="iPC_RoadX" index="16" name=""/>
    <alias field="iPC_RoadVB" index="17" name=""/>
    <alias field="iPC_Rail" index="18" name=""/>
    <alias field="iPC_RailVB" index="19" name=""/>
    <alias field="iPC_LU" index="20" name=""/>
    <alias field="iPC_VLowLU" index="21" name=""/>
    <alias field="iPC_LowLU" index="22" name=""/>
    <alias field="iPC_ModLU" index="23" name=""/>
    <alias field="iPC_HighLU" index="24" name=""/>
    <alias field="iHyd_QLow" index="25" name=""/>
    <alias field="iHyd_Q2" index="26" name=""/>
    <alias field="iHyd_SPLow" index="27" name=""/>
    <alias field="iHyd_SP2" index="28" name=""/>
    <alias field="AgencyID" index="29" name=""/>
    <alias field="oVC_HPE" index="30" name=""/>
    <alias field="oVC_EX" index="31" name=""/>
    <alias field="oCC_HPE" index="32" name=""/>
    <alias field="mCC_HPE_CT" index="33" name=""/>
    <alias field="oCC_EX" index="34" name=""/>
    <alias field="mCC_EX_CT" index="35" name=""/>
    <alias field="LimitationID" index="36" name=""/>
    <alias field="RiskID" index="37" name=""/>
    <alias field="OpportunityID" index="38" name=""/>
    <alias field="iPC_Canal" index="39" name=""/>
    <alias field="iPC_DivPts" index="40" name=""/>
    <alias field="iPC_Privat" index="41" name=""/>
    <alias field="oPC_Dist" index="42" name=""/>
    <alias field="IsMainCh" index="43" name=""/>
    <alias field="IsMultiCh" index="44" name=""/>
    <alias field="mCC_HisDep" index="45" name=""/>
    <alias field="Watershed" index="46" name=""/>
    <alias field="ReachType" index="47" name=""/>
    <alias field="Agency" index="48" name=""/>
    <alias field="Limitation" index="49" name=""/>
    <alias field="Risk" index="50" name=""/>
    <alias field="Opportunity" index="51" name=""/>
  </aliases>
  <defaults>
    <default field="ReachID" expression="" applyOnUpdate="0"/>
    <default field="WatershedID" expression="" applyOnUpdate="0"/>
    <default field="ReachCode" expression="" applyOnUpdate="0"/>
    <default field="IsPeren" expression="" applyOnUpdate="0"/>
    <default field="StreamName" expression="" applyOnUpdate="0"/>
    <default field="Orig_DA" expression="" applyOnUpdate="0"/>
    <default field="iGeo_Slope" expression="" applyOnUpdate="0"/>
    <default field="iGeo_ElMax" expression="" applyOnUpdate="0"/>
    <default field="iGeo_ElMin" expression="" applyOnUpdate="0"/>
    <default field="iGeo_Len" expression="" applyOnUpdate="0"/>
    <default field="iGeo_DA" expression="" applyOnUpdate="0"/>
    <default field="iVeg100EX" expression="" applyOnUpdate="0"/>
    <default field="iVeg_30EX" expression="" applyOnUpdate="0"/>
    <default field="iVeg100HPE" expression="" applyOnUpdate="0"/>
    <default field="iVeg_30HPE" expression="" applyOnUpdate="0"/>
    <default field="iPC_Road" expression="" applyOnUpdate="0"/>
    <default field="iPC_RoadX" expression="" applyOnUpdate="0"/>
    <default field="iPC_RoadVB" expression="" applyOnUpdate="0"/>
    <default field="iPC_Rail" expression="" applyOnUpdate="0"/>
    <default field="iPC_RailVB" expression="" applyOnUpdate="0"/>
    <default field="iPC_LU" expression="" applyOnUpdate="0"/>
    <default field="iPC_VLowLU" expression="" applyOnUpdate="0"/>
    <default field="iPC_LowLU" expression="" applyOnUpdate="0"/>
    <default field="iPC_ModLU" expression="" applyOnUpdate="0"/>
    <default field="iPC_HighLU" expression="" applyOnUpdate="0"/>
    <default field="iHyd_QLow" expression="" applyOnUpdate="0"/>
    <default field="iHyd_Q2" expression="" applyOnUpdate="0"/>
    <default field="iHyd_SPLow" expression="" applyOnUpdate="0"/>
    <default field="iHyd_SP2" expression="" applyOnUpdate="0"/>
    <default field="AgencyID" expression="" applyOnUpdate="0"/>
    <default field="oVC_HPE" expression="" applyOnUpdate="0"/>
    <default field="oVC_EX" expression="" applyOnUpdate="0"/>
    <default field="oCC_HPE" expression="" applyOnUpdate="0"/>
    <default field="mCC_HPE_CT" expression="" applyOnUpdate="0"/>
    <default field="oCC_EX" expression="" applyOnUpdate="0"/>
    <default field="mCC_EX_CT" expression="" applyOnUpdate="0"/>
    <default field="LimitationID" expression="" applyOnUpdate="0"/>
    <default field="RiskID" expression="" applyOnUpdate="0"/>
    <default field="OpportunityID" expression="" applyOnUpdate="0"/>
    <default field="iPC_Canal" expression="" applyOnUpdate="0"/>
    <default field="iPC_DivPts" expression="" applyOnUpdate="0"/>
    <default field="iPC_Privat" expression="" applyOnUpdate="0"/>
    <default field="oPC_Dist" expression="" applyOnUpdate="0"/>
    <default field="IsMainCh" expression="" applyOnUpdate="0"/>
    <default field="IsMultiCh" expression="" applyOnUpdate="0"/>
    <default field="mCC_HisDep" expression="" applyOnUpdate="0"/>
    <default field="Watershed" expression="" applyOnUpdate="0"/>
    <default field="ReachType" expression="" applyOnUpdate="0"/>
    <default field="Agency" expression="" applyOnUpdate="0"/>
    <default field="Limitation" expression="" applyOnUpdate="0"/>
    <default field="Risk" expression="" applyOnUpdate="0"/>
    <default field="Opportunity" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint field="ReachID" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="WatershedID" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="ReachCode" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="IsPeren" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="StreamName" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="Orig_DA" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iGeo_Slope" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iGeo_ElMax" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iGeo_ElMin" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iGeo_Len" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iGeo_DA" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iVeg100EX" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iVeg_30EX" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iVeg100HPE" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iVeg_30HPE" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iPC_Road" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iPC_RoadX" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iPC_RoadVB" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iPC_Rail" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iPC_RailVB" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iPC_LU" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iPC_VLowLU" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iPC_LowLU" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iPC_ModLU" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iPC_HighLU" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iHyd_QLow" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iHyd_Q2" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iHyd_SPLow" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iHyd_SP2" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="AgencyID" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="oVC_HPE" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="oVC_EX" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="oCC_HPE" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="mCC_HPE_CT" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="oCC_EX" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="mCC_EX_CT" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="LimitationID" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="RiskID" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="OpportunityID" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iPC_Canal" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iPC_DivPts" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="iPC_Privat" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="oPC_Dist" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="IsMainCh" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="IsMultiCh" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="mCC_HisDep" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="Watershed" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="ReachType" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="Agency" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="Limitation" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="Risk" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="Opportunity" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" field="ReachID" desc=""/>
    <constraint exp="" field="WatershedID" desc=""/>
    <constraint exp="" field="ReachCode" desc=""/>
    <constraint exp="" field="IsPeren" desc=""/>
    <constraint exp="" field="StreamName" desc=""/>
    <constraint exp="" field="Orig_DA" desc=""/>
    <constraint exp="" field="iGeo_Slope" desc=""/>
    <constraint exp="" field="iGeo_ElMax" desc=""/>
    <constraint exp="" field="iGeo_ElMin" desc=""/>
    <constraint exp="" field="iGeo_Len" desc=""/>
    <constraint exp="" field="iGeo_DA" desc=""/>
    <constraint exp="" field="iVeg100EX" desc=""/>
    <constraint exp="" field="iVeg_30EX" desc=""/>
    <constraint exp="" field="iVeg100HPE" desc=""/>
    <constraint exp="" field="iVeg_30HPE" desc=""/>
    <constraint exp="" field="iPC_Road" desc=""/>
    <constraint exp="" field="iPC_RoadX" desc=""/>
    <constraint exp="" field="iPC_RoadVB" desc=""/>
    <constraint exp="" field="iPC_Rail" desc=""/>
    <constraint exp="" field="iPC_RailVB" desc=""/>
    <constraint exp="" field="iPC_LU" desc=""/>
    <constraint exp="" field="iPC_VLowLU" desc=""/>
    <constraint exp="" field="iPC_LowLU" desc=""/>
    <constraint exp="" field="iPC_ModLU" desc=""/>
    <constraint exp="" field="iPC_HighLU" desc=""/>
    <constraint exp="" field="iHyd_QLow" desc=""/>
    <constraint exp="" field="iHyd_Q2" desc=""/>
    <constraint exp="" field="iHyd_SPLow" desc=""/>
    <constraint exp="" field="iHyd_SP2" desc=""/>
    <constraint exp="" field="AgencyID" desc=""/>
    <constraint exp="" field="oVC_HPE" desc=""/>
    <constraint exp="" field="oVC_EX" desc=""/>
    <constraint exp="" field="oCC_HPE" desc=""/>
    <constraint exp="" field="mCC_HPE_CT" desc=""/>
    <constraint exp="" field="oCC_EX" desc=""/>
    <constraint exp="" field="mCC_EX_CT" desc=""/>
    <constraint exp="" field="LimitationID" desc=""/>
    <constraint exp="" field="RiskID" desc=""/>
    <constraint exp="" field="OpportunityID" desc=""/>
    <constraint exp="" field="iPC_Canal" desc=""/>
    <constraint exp="" field="iPC_DivPts" desc=""/>
    <constraint exp="" field="iPC_Privat" desc=""/>
    <constraint exp="" field="oPC_Dist" desc=""/>
    <constraint exp="" field="IsMainCh" desc=""/>
    <constraint exp="" field="IsMultiCh" desc=""/>
    <constraint exp="" field="mCC_HisDep" desc=""/>
    <constraint exp="" field="Watershed" desc=""/>
    <constraint exp="" field="ReachType" desc=""/>
    <constraint exp="" field="Agency" desc=""/>
    <constraint exp="" field="Limitation" desc=""/>
    <constraint exp="" field="Risk" desc=""/>
    <constraint exp="" field="Opportunity" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortExpression="" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column width="-1" type="field" hidden="0" name="ReachID"/>
      <column width="-1" type="field" hidden="0" name="WatershedID"/>
      <column width="-1" type="field" hidden="0" name="ReachCode"/>
      <column width="-1" type="field" hidden="0" name="IsPeren"/>
      <column width="-1" type="field" hidden="0" name="StreamName"/>
      <column width="-1" type="field" hidden="0" name="Orig_DA"/>
      <column width="-1" type="field" hidden="0" name="iGeo_Slope"/>
      <column width="-1" type="field" hidden="0" name="iGeo_ElMax"/>
      <column width="-1" type="field" hidden="0" name="iGeo_ElMin"/>
      <column width="-1" type="field" hidden="0" name="iGeo_Len"/>
      <column width="-1" type="field" hidden="0" name="iGeo_DA"/>
      <column width="-1" type="field" hidden="0" name="iVeg100EX"/>
      <column width="-1" type="field" hidden="0" name="iVeg_30EX"/>
      <column width="-1" type="field" hidden="0" name="iVeg100HPE"/>
      <column width="-1" type="field" hidden="0" name="iVeg_30HPE"/>
      <column width="-1" type="field" hidden="0" name="iPC_Road"/>
      <column width="-1" type="field" hidden="0" name="iPC_RoadX"/>
      <column width="-1" type="field" hidden="0" name="iPC_RoadVB"/>
      <column width="-1" type="field" hidden="0" name="iPC_Rail"/>
      <column width="-1" type="field" hidden="0" name="iPC_RailVB"/>
      <column width="-1" type="field" hidden="0" name="iPC_LU"/>
      <column width="-1" type="field" hidden="0" name="iPC_VLowLU"/>
      <column width="-1" type="field" hidden="0" name="iPC_LowLU"/>
      <column width="-1" type="field" hidden="0" name="iPC_ModLU"/>
      <column width="-1" type="field" hidden="0" name="iPC_HighLU"/>
      <column width="-1" type="field" hidden="0" name="iHyd_QLow"/>
      <column width="-1" type="field" hidden="0" name="iHyd_Q2"/>
      <column width="-1" type="field" hidden="0" name="iHyd_SPLow"/>
      <column width="-1" type="field" hidden="0" name="iHyd_SP2"/>
      <column width="-1" type="field" hidden="0" name="AgencyID"/>
      <column width="-1" type="field" hidden="0" name="oVC_HPE"/>
      <column width="-1" type="field" hidden="0" name="oVC_EX"/>
      <column width="-1" type="field" hidden="0" name="oCC_HPE"/>
      <column width="-1" type="field" hidden="0" name="mCC_HPE_CT"/>
      <column width="-1" type="field" hidden="0" name="oCC_EX"/>
      <column width="-1" type="field" hidden="0" name="mCC_EX_CT"/>
      <column width="-1" type="field" hidden="0" name="LimitationID"/>
      <column width="-1" type="field" hidden="0" name="RiskID"/>
      <column width="-1" type="field" hidden="0" name="OpportunityID"/>
      <column width="-1" type="field" hidden="0" name="iPC_Canal"/>
      <column width="-1" type="field" hidden="0" name="iPC_DivPts"/>
      <column width="-1" type="field" hidden="0" name="iPC_Privat"/>
      <column width="-1" type="field" hidden="0" name="oPC_Dist"/>
      <column width="-1" type="field" hidden="0" name="IsMainCh"/>
      <column width="-1" type="field" hidden="0" name="IsMultiCh"/>
      <column width="-1" type="field" hidden="0" name="mCC_HisDep"/>
      <column width="-1" type="field" hidden="0" name="Watershed"/>
      <column width="-1" type="field" hidden="0" name="ReachType"/>
      <column width="-1" type="field" hidden="0" name="Agency"/>
      <column width="-1" type="field" hidden="0" name="Limitation"/>
      <column width="-1" type="field" hidden="0" name="Risk"/>
      <column width="-1" type="field" hidden="0" name="Opportunity"/>
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
    <field name="Agency" reuseLastValue="0"/>
    <field name="AgencyID" reuseLastValue="0"/>
    <field name="IsMainCh" reuseLastValue="0"/>
    <field name="IsMultiCh" reuseLastValue="0"/>
    <field name="IsPeren" reuseLastValue="0"/>
    <field name="Limitation" reuseLastValue="0"/>
    <field name="LimitationID" reuseLastValue="0"/>
    <field name="Opportunity" reuseLastValue="0"/>
    <field name="OpportunityID" reuseLastValue="0"/>
    <field name="Orig_DA" reuseLastValue="0"/>
    <field name="ReachCode" reuseLastValue="0"/>
    <field name="ReachID" reuseLastValue="0"/>
    <field name="ReachType" reuseLastValue="0"/>
    <field name="Risk" reuseLastValue="0"/>
    <field name="RiskID" reuseLastValue="0"/>
    <field name="StreamName" reuseLastValue="0"/>
    <field name="Watershed" reuseLastValue="0"/>
    <field name="WatershedID" reuseLastValue="0"/>
    <field name="iGeo_DA" reuseLastValue="0"/>
    <field name="iGeo_ElMax" reuseLastValue="0"/>
    <field name="iGeo_ElMin" reuseLastValue="0"/>
    <field name="iGeo_Len" reuseLastValue="0"/>
    <field name="iGeo_Slope" reuseLastValue="0"/>
    <field name="iHyd_Q2" reuseLastValue="0"/>
    <field name="iHyd_QLow" reuseLastValue="0"/>
    <field name="iHyd_SP2" reuseLastValue="0"/>
    <field name="iHyd_SPLow" reuseLastValue="0"/>
    <field name="iPC_Canal" reuseLastValue="0"/>
    <field name="iPC_DivPts" reuseLastValue="0"/>
    <field name="iPC_HighLU" reuseLastValue="0"/>
    <field name="iPC_LU" reuseLastValue="0"/>
    <field name="iPC_LowLU" reuseLastValue="0"/>
    <field name="iPC_ModLU" reuseLastValue="0"/>
    <field name="iPC_Privat" reuseLastValue="0"/>
    <field name="iPC_Rail" reuseLastValue="0"/>
    <field name="iPC_RailVB" reuseLastValue="0"/>
    <field name="iPC_Road" reuseLastValue="0"/>
    <field name="iPC_RoadVB" reuseLastValue="0"/>
    <field name="iPC_RoadX" reuseLastValue="0"/>
    <field name="iPC_VLowLU" reuseLastValue="0"/>
    <field name="iVeg100EX" reuseLastValue="0"/>
    <field name="iVeg100HPE" reuseLastValue="0"/>
    <field name="iVeg_30EX" reuseLastValue="0"/>
    <field name="iVeg_30HPE" reuseLastValue="0"/>
    <field name="mCC_EX_CT" reuseLastValue="0"/>
    <field name="mCC_HPE_CT" reuseLastValue="0"/>
    <field name="mCC_HisDep" reuseLastValue="0"/>
    <field name="oCC_EX" reuseLastValue="0"/>
    <field name="oCC_HPE" reuseLastValue="0"/>
    <field name="oPC_Dist" reuseLastValue="0"/>
    <field name="oVC_EX" reuseLastValue="0"/>
    <field name="oVC_HPE" reuseLastValue="0"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"StreamName"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
