<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.40.5-Bratislava" styleCategories="Symbology">
  <renderer-v2 type="RuleRenderer" symbollevels="0" forceraster="0" referencescale="-1" enableorderby="0">
    <rules key="{96719773-fe41-4558-9e9e-7ab5324a8915}">
      <rule label="BDA" key="{cca9b65a-15a2-42ac-8b4b-abc780450914}" symbol="0" filter="&quot;Structure Type&quot; = 'BDA' or &quot;Structure Type&quot; = 'Primary BDA' or &quot;Structure Type&quot; = 'Secondary BDA' or  &quot;Structure Type&quot; = 'BDA Postless' or &quot;Structure Type&quot; = 'Tight PALS (BDA without sod)'  or &quot;Structure Type&quot; = 'Postline Wicker Weave'"/>
      <rule label="PALS" key="{12d2e893-432f-4022-8e6c-e2bf38820cda}" symbol="1" filter="&quot;Structure Type&quot; = 'PALS' or &quot;Structure Type&quot; = 'PALS - Bank Attached' or &quot;Structure Type&quot; = 'PALS - Right Bank Attached' or &quot;Structure Type&quot; = 'PALS - Left Bank Attached' or &quot;Structure Type&quot; = 'PALS - Bank Blaster' or &quot;Structure Type&quot; = 'PALS - Constriction Jet' or &quot;Structure Type&quot; = 'PALS - Mid Channel' or &quot;Structure Type&quot; = 'PALS - Rhino' or &quot;Structure Type&quot; = 'PALS - Channel Spanning' or &quot;Structure Type&quot; = 'Rhino'  or &quot;Structure Type&quot; = 'Leaky Dam' or &quot;Structure Type&quot; = 'Post and Brush Plug'  or &quot;Structure Type&quot; = 'Wicker Weirs' "/>
      <rule label="ALS" key="{993ba800-3983-4ef9-9bbf-f9f8ac3a5392}" symbol="2" filter="&quot;Structure Type&quot; = 'ALS' or  &quot;Structure Type&quot; = 'ALS - Bank Attached' or  &quot;Structure Type&quot; = 'ALS - Bank Blaster' or  &quot;Structure Type&quot; = 'ALS - Mid Channel' or  &quot;Structure Type&quot; = 'ALS - Rhino' or  &quot;Structure Type&quot; = 'ALS - Channel Spanning' or  &quot;Structure Type&quot; = 'Wood Jam' or  &quot;Structure Type&quot; = 'Full Tree' or  &quot;Structure Type&quot; = 'Strategic Felling' or  &quot;Structure Type&quot; = 'Grip Hoist Tree' or  &quot;Structure Type&quot; = 'Fell Tree' or  &quot;Structure Type&quot; = 'Tree Dam' or  &quot;Structure Type&quot; = 'Tree Plug'"/>
      <rule label="Other" key="{3ab4d842-fcd6-466c-a7c5-8b1ed99497f9}" symbol="3" filter="&quot;Structure Type&quot; = 'One Rock Dam' or &quot;Structure Type&quot; = 'Zuni Bowl' or &quot;Structure Type&quot; = 'Spreaders' or &quot;Structure Type&quot; = 'Floodplain BDA' or &quot;Structure Type&quot; = 'Sedge Plugs' or &quot;Structure Type&quot; = 'Headcut Treatment' or  &quot;Structure Type&quot; = 'Bag Plugs' or  &quot;Structure Type&quot; = 'Floodplain LWD' or  &quot;Structure Type&quot; = 'Vanes'"/>
      <rule label="NULL" key="{19a20747-8666-41df-af78-01add866d22e}" symbol="4" filter="ELSE"/>
    </rules>
    <symbols>
      <symbol force_rhr="0" type="marker" clip_to_extent="1" alpha="1" frame_rate="10" name="0" is_animated="0">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" locked="0" class="SimpleMarker" pass="0" id="{0eeffe98-6d88-4530-8d36-86fe1bff0bdb}">
          <Option type="Map">
            <Option type="QString" name="angle" value="0"/>
            <Option type="QString" name="cap_style" value="square"/>
            <Option type="QString" name="color" value="0,0,0,255,rgb:0,0,0,1"/>
            <Option type="QString" name="horizontal_anchor_point" value="1"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="name" value="circle"/>
            <Option type="QString" name="offset" value="0,0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="outline_color" value="255,255,255,255,rgb:1,1,1,1"/>
            <Option type="QString" name="outline_style" value="solid"/>
            <Option type="QString" name="outline_width" value="0.4"/>
            <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="outline_width_unit" value="MM"/>
            <Option type="QString" name="scale_method" value="diameter"/>
            <Option type="QString" name="size" value="2.8"/>
            <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="size_unit" value="MM"/>
            <Option type="QString" name="vertical_anchor_point" value="1"/>
          </Option>
          <effect type="effectStack" enabled="0">
            <effect type="dropShadow">
              <Option type="Map">
                <Option type="QString" name="blend_mode" value="13"/>
                <Option type="QString" name="blur_level" value="2.645"/>
                <Option type="QString" name="blur_unit" value="MM"/>
                <Option type="QString" name="blur_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="color" value="0,0,0,255,rgb:0,0,0,1"/>
                <Option type="QString" name="draw_mode" value="2"/>
                <Option type="QString" name="enabled" value="0"/>
                <Option type="QString" name="offset_angle" value="135"/>
                <Option type="QString" name="offset_distance" value="2"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="offset_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="opacity" value="1"/>
              </Option>
            </effect>
            <effect type="outerGlow">
              <Option type="Map">
                <Option type="QString" name="blend_mode" value="0"/>
                <Option type="QString" name="blur_level" value="2.645"/>
                <Option type="QString" name="blur_unit" value="MM"/>
                <Option type="QString" name="blur_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="color1" value="69,116,40,255,rgb:0.27058823529411763,0.45490196078431372,0.15686274509803921,1"/>
                <Option type="QString" name="color2" value="188,220,60,255,rgb:0.73725490196078436,0.86274509803921573,0.23529411764705882,1"/>
                <Option type="QString" name="color_type" value="0"/>
                <Option type="QString" name="direction" value="ccw"/>
                <Option type="QString" name="discrete" value="0"/>
                <Option type="QString" name="draw_mode" value="2"/>
                <Option type="QString" name="enabled" value="1"/>
                <Option type="QString" name="opacity" value="0.5"/>
                <Option type="QString" name="rampType" value="gradient"/>
                <Option type="QString" name="single_color" value="255,255,255,255,rgb:1,1,1,1"/>
                <Option type="QString" name="spec" value="rgb"/>
                <Option type="QString" name="spread" value="2"/>
                <Option type="QString" name="spread_unit" value="MM"/>
                <Option type="QString" name="spread_unit_scale" value="3x:0,0,0,0,0,0"/>
              </Option>
            </effect>
            <effect type="drawSource">
              <Option type="Map">
                <Option type="QString" name="blend_mode" value="0"/>
                <Option type="QString" name="draw_mode" value="2"/>
                <Option type="QString" name="enabled" value="1"/>
                <Option type="QString" name="opacity" value="1"/>
              </Option>
            </effect>
            <effect type="innerShadow">
              <Option type="Map">
                <Option type="QString" name="blend_mode" value="13"/>
                <Option type="QString" name="blur_level" value="2.645"/>
                <Option type="QString" name="blur_unit" value="MM"/>
                <Option type="QString" name="blur_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="color" value="0,0,0,255,rgb:0,0,0,1"/>
                <Option type="QString" name="draw_mode" value="2"/>
                <Option type="QString" name="enabled" value="0"/>
                <Option type="QString" name="offset_angle" value="135"/>
                <Option type="QString" name="offset_distance" value="2"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="offset_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="opacity" value="1"/>
              </Option>
            </effect>
            <effect type="innerGlow">
              <Option type="Map">
                <Option type="QString" name="blend_mode" value="0"/>
                <Option type="QString" name="blur_level" value="2.645"/>
                <Option type="QString" name="blur_unit" value="MM"/>
                <Option type="QString" name="blur_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="color1" value="69,116,40,255,rgb:0.27058823529411763,0.45490196078431372,0.15686274509803921,1"/>
                <Option type="QString" name="color2" value="188,220,60,255,rgb:0.73725490196078436,0.86274509803921573,0.23529411764705882,1"/>
                <Option type="QString" name="color_type" value="0"/>
                <Option type="QString" name="direction" value="ccw"/>
                <Option type="QString" name="discrete" value="0"/>
                <Option type="QString" name="draw_mode" value="2"/>
                <Option type="QString" name="enabled" value="0"/>
                <Option type="QString" name="opacity" value="0.5"/>
                <Option type="QString" name="rampType" value="gradient"/>
                <Option type="QString" name="single_color" value="255,255,255,255,rgb:1,1,1,1"/>
                <Option type="QString" name="spec" value="rgb"/>
                <Option type="QString" name="spread" value="2"/>
                <Option type="QString" name="spread_unit" value="MM"/>
                <Option type="QString" name="spread_unit_scale" value="3x:0,0,0,0,0,0"/>
              </Option>
            </effect>
          </effect>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" type="marker" clip_to_extent="1" alpha="1" frame_rate="10" name="1" is_animated="0">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" locked="0" class="SimpleMarker" pass="0" id="{0eeffe98-6d88-4530-8d36-86fe1bff0bdb}">
          <Option type="Map">
            <Option type="QString" name="angle" value="0"/>
            <Option type="QString" name="cap_style" value="square"/>
            <Option type="QString" name="color" value="140,78,35,255,hsv:0.06863888888888889,0.74988937209124895,0.55010299839780274,1"/>
            <Option type="QString" name="horizontal_anchor_point" value="1"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="name" value="square"/>
            <Option type="QString" name="offset" value="0,0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="outline_color" value="255,255,255,255,rgb:1,1,1,1"/>
            <Option type="QString" name="outline_style" value="solid"/>
            <Option type="QString" name="outline_width" value="0.4"/>
            <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="outline_width_unit" value="MM"/>
            <Option type="QString" name="scale_method" value="diameter"/>
            <Option type="QString" name="size" value="2.8"/>
            <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="size_unit" value="MM"/>
            <Option type="QString" name="vertical_anchor_point" value="1"/>
          </Option>
          <effect type="effectStack" enabled="0">
            <effect type="dropShadow">
              <Option type="Map">
                <Option type="QString" name="blend_mode" value="13"/>
                <Option type="QString" name="blur_level" value="2.645"/>
                <Option type="QString" name="blur_unit" value="MM"/>
                <Option type="QString" name="blur_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="color" value="0,0,0,255,rgb:0,0,0,1"/>
                <Option type="QString" name="draw_mode" value="2"/>
                <Option type="QString" name="enabled" value="0"/>
                <Option type="QString" name="offset_angle" value="135"/>
                <Option type="QString" name="offset_distance" value="2"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="offset_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="opacity" value="1"/>
              </Option>
            </effect>
            <effect type="outerGlow">
              <Option type="Map">
                <Option type="QString" name="blend_mode" value="0"/>
                <Option type="QString" name="blur_level" value="2.645"/>
                <Option type="QString" name="blur_unit" value="MM"/>
                <Option type="QString" name="blur_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="color1" value="69,116,40,255,rgb:0.27058823529411763,0.45490196078431372,0.15686274509803921,1"/>
                <Option type="QString" name="color2" value="188,220,60,255,rgb:0.73725490196078436,0.86274509803921573,0.23529411764705882,1"/>
                <Option type="QString" name="color_type" value="0"/>
                <Option type="QString" name="direction" value="ccw"/>
                <Option type="QString" name="discrete" value="0"/>
                <Option type="QString" name="draw_mode" value="2"/>
                <Option type="QString" name="enabled" value="1"/>
                <Option type="QString" name="opacity" value="0.5"/>
                <Option type="QString" name="rampType" value="gradient"/>
                <Option type="QString" name="single_color" value="255,255,255,255,rgb:1,1,1,1"/>
                <Option type="QString" name="spec" value="rgb"/>
                <Option type="QString" name="spread" value="2"/>
                <Option type="QString" name="spread_unit" value="MM"/>
                <Option type="QString" name="spread_unit_scale" value="3x:0,0,0,0,0,0"/>
              </Option>
            </effect>
            <effect type="drawSource">
              <Option type="Map">
                <Option type="QString" name="blend_mode" value="0"/>
                <Option type="QString" name="draw_mode" value="2"/>
                <Option type="QString" name="enabled" value="1"/>
                <Option type="QString" name="opacity" value="1"/>
              </Option>
            </effect>
            <effect type="innerShadow">
              <Option type="Map">
                <Option type="QString" name="blend_mode" value="13"/>
                <Option type="QString" name="blur_level" value="2.645"/>
                <Option type="QString" name="blur_unit" value="MM"/>
                <Option type="QString" name="blur_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="color" value="0,0,0,255,rgb:0,0,0,1"/>
                <Option type="QString" name="draw_mode" value="2"/>
                <Option type="QString" name="enabled" value="0"/>
                <Option type="QString" name="offset_angle" value="135"/>
                <Option type="QString" name="offset_distance" value="2"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="offset_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="opacity" value="1"/>
              </Option>
            </effect>
            <effect type="innerGlow">
              <Option type="Map">
                <Option type="QString" name="blend_mode" value="0"/>
                <Option type="QString" name="blur_level" value="2.645"/>
                <Option type="QString" name="blur_unit" value="MM"/>
                <Option type="QString" name="blur_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="color1" value="69,116,40,255,rgb:0.27058823529411763,0.45490196078431372,0.15686274509803921,1"/>
                <Option type="QString" name="color2" value="188,220,60,255,rgb:0.73725490196078436,0.86274509803921573,0.23529411764705882,1"/>
                <Option type="QString" name="color_type" value="0"/>
                <Option type="QString" name="direction" value="ccw"/>
                <Option type="QString" name="discrete" value="0"/>
                <Option type="QString" name="draw_mode" value="2"/>
                <Option type="QString" name="enabled" value="0"/>
                <Option type="QString" name="opacity" value="0.5"/>
                <Option type="QString" name="rampType" value="gradient"/>
                <Option type="QString" name="single_color" value="255,255,255,255,rgb:1,1,1,1"/>
                <Option type="QString" name="spec" value="rgb"/>
                <Option type="QString" name="spread" value="2"/>
                <Option type="QString" name="spread_unit" value="MM"/>
                <Option type="QString" name="spread_unit_scale" value="3x:0,0,0,0,0,0"/>
              </Option>
            </effect>
          </effect>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" type="marker" clip_to_extent="1" alpha="1" frame_rate="10" name="2" is_animated="0">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" locked="0" class="SimpleMarker" pass="0" id="{0436de3d-2b6a-4139-9981-e2642e1e88d8}">
          <Option type="Map">
            <Option type="QString" name="angle" value="0"/>
            <Option type="QString" name="cap_style" value="square"/>
            <Option type="QString" name="color" value="252,144,43,255,rgb:0.9882352941176471,0.56470588235294117,0.16862745098039217,1"/>
            <Option type="QString" name="horizontal_anchor_point" value="1"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="name" value="triangle"/>
            <Option type="QString" name="offset" value="0,0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="outline_color" value="255,255,255,255,rgb:1,1,1,1"/>
            <Option type="QString" name="outline_style" value="solid"/>
            <Option type="QString" name="outline_width" value="0.4"/>
            <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="outline_width_unit" value="MM"/>
            <Option type="QString" name="scale_method" value="diameter"/>
            <Option type="QString" name="size" value="3"/>
            <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="size_unit" value="MM"/>
            <Option type="QString" name="vertical_anchor_point" value="1"/>
          </Option>
          <effect type="effectStack" enabled="0">
            <effect type="dropShadow">
              <Option type="Map">
                <Option type="QString" name="blend_mode" value="13"/>
                <Option type="QString" name="blur_level" value="2.645"/>
                <Option type="QString" name="blur_unit" value="MM"/>
                <Option type="QString" name="blur_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="color" value="0,0,0,255,rgb:0,0,0,1"/>
                <Option type="QString" name="draw_mode" value="2"/>
                <Option type="QString" name="enabled" value="0"/>
                <Option type="QString" name="offset_angle" value="135"/>
                <Option type="QString" name="offset_distance" value="2"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="offset_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="opacity" value="1"/>
              </Option>
            </effect>
            <effect type="outerGlow">
              <Option type="Map">
                <Option type="QString" name="blend_mode" value="0"/>
                <Option type="QString" name="blur_level" value="2.645"/>
                <Option type="QString" name="blur_unit" value="MM"/>
                <Option type="QString" name="blur_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="color1" value="69,116,40,255,rgb:0.27058823529411763,0.45490196078431372,0.15686274509803921,1"/>
                <Option type="QString" name="color2" value="188,220,60,255,rgb:0.73725490196078436,0.86274509803921573,0.23529411764705882,1"/>
                <Option type="QString" name="color_type" value="0"/>
                <Option type="QString" name="direction" value="ccw"/>
                <Option type="QString" name="discrete" value="0"/>
                <Option type="QString" name="draw_mode" value="2"/>
                <Option type="QString" name="enabled" value="1"/>
                <Option type="QString" name="opacity" value="0.5"/>
                <Option type="QString" name="rampType" value="gradient"/>
                <Option type="QString" name="single_color" value="255,255,255,255,rgb:1,1,1,1"/>
                <Option type="QString" name="spec" value="rgb"/>
                <Option type="QString" name="spread" value="2"/>
                <Option type="QString" name="spread_unit" value="MM"/>
                <Option type="QString" name="spread_unit_scale" value="3x:0,0,0,0,0,0"/>
              </Option>
            </effect>
            <effect type="drawSource">
              <Option type="Map">
                <Option type="QString" name="blend_mode" value="0"/>
                <Option type="QString" name="draw_mode" value="2"/>
                <Option type="QString" name="enabled" value="1"/>
                <Option type="QString" name="opacity" value="1"/>
              </Option>
            </effect>
            <effect type="innerShadow">
              <Option type="Map">
                <Option type="QString" name="blend_mode" value="13"/>
                <Option type="QString" name="blur_level" value="2.645"/>
                <Option type="QString" name="blur_unit" value="MM"/>
                <Option type="QString" name="blur_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="color" value="0,0,0,255,rgb:0,0,0,1"/>
                <Option type="QString" name="draw_mode" value="2"/>
                <Option type="QString" name="enabled" value="0"/>
                <Option type="QString" name="offset_angle" value="135"/>
                <Option type="QString" name="offset_distance" value="2"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="offset_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="opacity" value="1"/>
              </Option>
            </effect>
            <effect type="innerGlow">
              <Option type="Map">
                <Option type="QString" name="blend_mode" value="0"/>
                <Option type="QString" name="blur_level" value="2.645"/>
                <Option type="QString" name="blur_unit" value="MM"/>
                <Option type="QString" name="blur_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="color1" value="69,116,40,255,rgb:0.27058823529411763,0.45490196078431372,0.15686274509803921,1"/>
                <Option type="QString" name="color2" value="188,220,60,255,rgb:0.73725490196078436,0.86274509803921573,0.23529411764705882,1"/>
                <Option type="QString" name="color_type" value="0"/>
                <Option type="QString" name="direction" value="ccw"/>
                <Option type="QString" name="discrete" value="0"/>
                <Option type="QString" name="draw_mode" value="2"/>
                <Option type="QString" name="enabled" value="0"/>
                <Option type="QString" name="opacity" value="0.5"/>
                <Option type="QString" name="rampType" value="gradient"/>
                <Option type="QString" name="single_color" value="255,255,255,255,rgb:1,1,1,1"/>
                <Option type="QString" name="spec" value="rgb"/>
                <Option type="QString" name="spread" value="2"/>
                <Option type="QString" name="spread_unit" value="MM"/>
                <Option type="QString" name="spread_unit_scale" value="3x:0,0,0,0,0,0"/>
              </Option>
            </effect>
          </effect>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" type="marker" clip_to_extent="1" alpha="1" frame_rate="10" name="3" is_animated="0">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" locked="0" class="SimpleMarker" pass="0" id="{7ffa385b-5772-44d2-b01e-ad2a85dcbb1e}">
          <Option type="Map">
            <Option type="QString" name="angle" value="0"/>
            <Option type="QString" name="cap_style" value="square"/>
            <Option type="QString" name="color" value="116,161,74,255,rgb:0.45490196078431372,0.63137254901960782,0.29019607843137257,1"/>
            <Option type="QString" name="horizontal_anchor_point" value="1"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="name" value="diamond"/>
            <Option type="QString" name="offset" value="0,0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="outline_color" value="255,255,255,255,rgb:1,1,1,1"/>
            <Option type="QString" name="outline_style" value="solid"/>
            <Option type="QString" name="outline_width" value="0.4"/>
            <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="outline_width_unit" value="MM"/>
            <Option type="QString" name="scale_method" value="diameter"/>
            <Option type="QString" name="size" value="3"/>
            <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="size_unit" value="MM"/>
            <Option type="QString" name="vertical_anchor_point" value="1"/>
          </Option>
          <effect type="effectStack" enabled="0">
            <effect type="dropShadow">
              <Option type="Map">
                <Option type="QString" name="blend_mode" value="13"/>
                <Option type="QString" name="blur_level" value="2.645"/>
                <Option type="QString" name="blur_unit" value="MM"/>
                <Option type="QString" name="blur_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="color" value="0,0,0,255,rgb:0,0,0,1"/>
                <Option type="QString" name="draw_mode" value="2"/>
                <Option type="QString" name="enabled" value="0"/>
                <Option type="QString" name="offset_angle" value="135"/>
                <Option type="QString" name="offset_distance" value="2"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="offset_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="opacity" value="1"/>
              </Option>
            </effect>
            <effect type="outerGlow">
              <Option type="Map">
                <Option type="QString" name="blend_mode" value="0"/>
                <Option type="QString" name="blur_level" value="2.645"/>
                <Option type="QString" name="blur_unit" value="MM"/>
                <Option type="QString" name="blur_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="color1" value="69,116,40,255,rgb:0.27058823529411763,0.45490196078431372,0.15686274509803921,1"/>
                <Option type="QString" name="color2" value="188,220,60,255,rgb:0.73725490196078436,0.86274509803921573,0.23529411764705882,1"/>
                <Option type="QString" name="color_type" value="0"/>
                <Option type="QString" name="direction" value="ccw"/>
                <Option type="QString" name="discrete" value="0"/>
                <Option type="QString" name="draw_mode" value="2"/>
                <Option type="QString" name="enabled" value="1"/>
                <Option type="QString" name="opacity" value="0.5"/>
                <Option type="QString" name="rampType" value="gradient"/>
                <Option type="QString" name="single_color" value="255,255,255,255,rgb:1,1,1,1"/>
                <Option type="QString" name="spec" value="rgb"/>
                <Option type="QString" name="spread" value="2"/>
                <Option type="QString" name="spread_unit" value="MM"/>
                <Option type="QString" name="spread_unit_scale" value="3x:0,0,0,0,0,0"/>
              </Option>
            </effect>
            <effect type="drawSource">
              <Option type="Map">
                <Option type="QString" name="blend_mode" value="0"/>
                <Option type="QString" name="draw_mode" value="2"/>
                <Option type="QString" name="enabled" value="1"/>
                <Option type="QString" name="opacity" value="1"/>
              </Option>
            </effect>
            <effect type="innerShadow">
              <Option type="Map">
                <Option type="QString" name="blend_mode" value="13"/>
                <Option type="QString" name="blur_level" value="2.645"/>
                <Option type="QString" name="blur_unit" value="MM"/>
                <Option type="QString" name="blur_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="color" value="0,0,0,255,rgb:0,0,0,1"/>
                <Option type="QString" name="draw_mode" value="2"/>
                <Option type="QString" name="enabled" value="0"/>
                <Option type="QString" name="offset_angle" value="135"/>
                <Option type="QString" name="offset_distance" value="2"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="offset_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="opacity" value="1"/>
              </Option>
            </effect>
            <effect type="innerGlow">
              <Option type="Map">
                <Option type="QString" name="blend_mode" value="0"/>
                <Option type="QString" name="blur_level" value="2.645"/>
                <Option type="QString" name="blur_unit" value="MM"/>
                <Option type="QString" name="blur_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="color1" value="69,116,40,255,rgb:0.27058823529411763,0.45490196078431372,0.15686274509803921,1"/>
                <Option type="QString" name="color2" value="188,220,60,255,rgb:0.73725490196078436,0.86274509803921573,0.23529411764705882,1"/>
                <Option type="QString" name="color_type" value="0"/>
                <Option type="QString" name="direction" value="ccw"/>
                <Option type="QString" name="discrete" value="0"/>
                <Option type="QString" name="draw_mode" value="2"/>
                <Option type="QString" name="enabled" value="0"/>
                <Option type="QString" name="opacity" value="0.5"/>
                <Option type="QString" name="rampType" value="gradient"/>
                <Option type="QString" name="single_color" value="255,255,255,255,rgb:1,1,1,1"/>
                <Option type="QString" name="spec" value="rgb"/>
                <Option type="QString" name="spread" value="2"/>
                <Option type="QString" name="spread_unit" value="MM"/>
                <Option type="QString" name="spread_unit_scale" value="3x:0,0,0,0,0,0"/>
              </Option>
            </effect>
          </effect>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" type="marker" clip_to_extent="1" alpha="1" frame_rate="10" name="4" is_animated="0">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" locked="0" class="SimpleMarker" pass="0" id="{9d7980a9-9b5a-4d24-939c-bfdec188c428}">
          <Option type="Map">
            <Option type="QString" name="angle" value="0"/>
            <Option type="QString" name="cap_style" value="square"/>
            <Option type="QString" name="color" value="192,177,0,255,rgb:0.75294117647058822,0.69411764705882351,0,1"/>
            <Option type="QString" name="horizontal_anchor_point" value="1"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="name" value="circle"/>
            <Option type="QString" name="offset" value="0,0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="outline_color" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1"/>
            <Option type="QString" name="outline_style" value="solid"/>
            <Option type="QString" name="outline_width" value="0"/>
            <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="outline_width_unit" value="MM"/>
            <Option type="QString" name="scale_method" value="diameter"/>
            <Option type="QString" name="size" value="2.2"/>
            <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="size_unit" value="MM"/>
            <Option type="QString" name="vertical_anchor_point" value="1"/>
          </Option>
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
    <data-defined-properties>
      <Option type="Map">
        <Option type="QString" name="name" value=""/>
        <Option name="properties"/>
        <Option type="QString" name="type" value="collection"/>
      </Option>
    </data-defined-properties>
    <effect type="effectStack" enabled="1">
      <effect type="dropShadow">
        <Option type="Map">
          <Option type="QString" name="blend_mode" value="13"/>
          <Option type="QString" name="blur_level" value="2.645"/>
          <Option type="QString" name="blur_unit" value="MM"/>
          <Option type="QString" name="blur_unit_scale" value="3x:0,0,0,0,0,0"/>
          <Option type="QString" name="color" value="0,0,0,255,rgb:0,0,0,1"/>
          <Option type="QString" name="draw_mode" value="2"/>
          <Option type="QString" name="enabled" value="0"/>
          <Option type="QString" name="offset_angle" value="135"/>
          <Option type="QString" name="offset_distance" value="2"/>
          <Option type="QString" name="offset_unit" value="MM"/>
          <Option type="QString" name="offset_unit_scale" value="3x:0,0,0,0,0,0"/>
          <Option type="QString" name="opacity" value="1"/>
        </Option>
      </effect>
      <effect type="outerGlow">
        <Option type="Map">
          <Option type="QString" name="blend_mode" value="0"/>
          <Option type="QString" name="blur_level" value="1.845"/>
          <Option type="QString" name="blur_unit" value="MM"/>
          <Option type="QString" name="blur_unit_scale" value="3x:0,0,0,0,0,0"/>
          <Option type="QString" name="color1" value="69,116,40,255,rgb:0.27058823529411763,0.45490196078431372,0.15686274509803921,1"/>
          <Option type="QString" name="color2" value="188,220,60,255,rgb:0.73725490196078436,0.86274509803921573,0.23529411764705882,1"/>
          <Option type="QString" name="color_type" value="0"/>
          <Option type="QString" name="direction" value="ccw"/>
          <Option type="QString" name="discrete" value="0"/>
          <Option type="QString" name="draw_mode" value="2"/>
          <Option type="QString" name="enabled" value="1"/>
          <Option type="QString" name="opacity" value="0.6"/>
          <Option type="QString" name="rampType" value="gradient"/>
          <Option type="QString" name="single_color" value="255,255,255,255,rgb:1,1,1,1"/>
          <Option type="QString" name="spec" value="rgb"/>
          <Option type="QString" name="spread" value="1.4"/>
          <Option type="QString" name="spread_unit" value="MM"/>
          <Option type="QString" name="spread_unit_scale" value="3x:0,0,0,0,0,0"/>
        </Option>
      </effect>
      <effect type="drawSource">
        <Option type="Map">
          <Option type="QString" name="blend_mode" value="0"/>
          <Option type="QString" name="draw_mode" value="2"/>
          <Option type="QString" name="enabled" value="1"/>
          <Option type="QString" name="opacity" value="1"/>
        </Option>
      </effect>
      <effect type="innerShadow">
        <Option type="Map">
          <Option type="QString" name="blend_mode" value="13"/>
          <Option type="QString" name="blur_level" value="2.645"/>
          <Option type="QString" name="blur_unit" value="MM"/>
          <Option type="QString" name="blur_unit_scale" value="3x:0,0,0,0,0,0"/>
          <Option type="QString" name="color" value="0,0,0,255,rgb:0,0,0,1"/>
          <Option type="QString" name="draw_mode" value="2"/>
          <Option type="QString" name="enabled" value="0"/>
          <Option type="QString" name="offset_angle" value="135"/>
          <Option type="QString" name="offset_distance" value="2"/>
          <Option type="QString" name="offset_unit" value="MM"/>
          <Option type="QString" name="offset_unit_scale" value="3x:0,0,0,0,0,0"/>
          <Option type="QString" name="opacity" value="1"/>
        </Option>
      </effect>
      <effect type="innerGlow">
        <Option type="Map">
          <Option type="QString" name="blend_mode" value="0"/>
          <Option type="QString" name="blur_level" value="2.645"/>
          <Option type="QString" name="blur_unit" value="MM"/>
          <Option type="QString" name="blur_unit_scale" value="3x:0,0,0,0,0,0"/>
          <Option type="QString" name="color1" value="69,116,40,255,rgb:0.27058823529411763,0.45490196078431372,0.15686274509803921,1"/>
          <Option type="QString" name="color2" value="188,220,60,255,rgb:0.73725490196078436,0.86274509803921573,0.23529411764705882,1"/>
          <Option type="QString" name="color_type" value="0"/>
          <Option type="QString" name="direction" value="ccw"/>
          <Option type="QString" name="discrete" value="0"/>
          <Option type="QString" name="draw_mode" value="2"/>
          <Option type="QString" name="enabled" value="0"/>
          <Option type="QString" name="opacity" value="0.5"/>
          <Option type="QString" name="rampType" value="gradient"/>
          <Option type="QString" name="single_color" value="255,255,255,255,rgb:1,1,1,1"/>
          <Option type="QString" name="spec" value="rgb"/>
          <Option type="QString" name="spread" value="2"/>
          <Option type="QString" name="spread_unit" value="MM"/>
          <Option type="QString" name="spread_unit_scale" value="3x:0,0,0,0,0,0"/>
        </Option>
      </effect>
    </effect>
  </renderer-v2>
  <selection mode="Default">
    <selectionColor invalid="1"/>
    <selectionSymbol>
      <symbol force_rhr="0" type="marker" clip_to_extent="1" alpha="1" frame_rate="10" name="" is_animated="0">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" locked="0" class="SimpleMarker" pass="0" id="{8421069b-8bd2-41c4-bda1-e09c8daacb97}">
          <Option type="Map">
            <Option type="QString" name="angle" value="0"/>
            <Option type="QString" name="cap_style" value="square"/>
            <Option type="QString" name="color" value="255,0,0,255,rgb:1,0,0,1"/>
            <Option type="QString" name="horizontal_anchor_point" value="1"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="name" value="circle"/>
            <Option type="QString" name="offset" value="0,0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="outline_color" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1"/>
            <Option type="QString" name="outline_style" value="solid"/>
            <Option type="QString" name="outline_width" value="0"/>
            <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="outline_width_unit" value="MM"/>
            <Option type="QString" name="scale_method" value="diameter"/>
            <Option type="QString" name="size" value="2"/>
            <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="size_unit" value="MM"/>
            <Option type="QString" name="vertical_anchor_point" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </selectionSymbol>
  </selection>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerGeometryType>0</layerGeometryType>
</qgis>
