<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis labelsEnabled="0" hasScaleBasedVisibilityFlag="0" readOnly="0" version="3.22.11-Białowieża" simplifyAlgorithm="0" simplifyDrawingTol="1" maxScale="0" simplifyLocal="1" styleCategories="AllStyleCategories" symbologyReferenceScale="-1" simplifyDrawingHints="0" minScale="100000000" simplifyMaxScale="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal endExpression="" accumulate="0" enabled="0" startField="" durationField="" durationUnit="min" limitMode="0" startExpression="" fixedDuration="0" endField="" mode="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <renderer-v2 enableorderby="0" symbollevels="0" referencescale="-1" type="RuleRenderer" forceraster="0">
    <rules key="{74b18146-02e2-4bd4-ad4c-996748046586}">
      <rule symbol="0" label="&lt; 2%" filter="&quot;vbet_igo_elevated_ratio&quot; &lt; 0.02" key="{4e2991cc-a65b-4213-9cbe-900c7018ca7a}"/>
      <rule symbol="1" label="2% to 5%" filter="&quot;vbet_igo_elevated_ratio&quot; >= 0.02 and &quot;vbet_igo_elevated_ratio&quot; &lt; 0.05" key="{b25eaed3-e38a-49d6-b8b5-c151647e9852}"/>
      <rule symbol="2" label="5% - 10%" filter="&quot;vbet_igo_elevated_ratio&quot;>= 0.05 and &quot;vbet_igo_elevated_ratio&quot; &lt; 0.1" key="{d1d038ba-632f-42de-b195-7d14d7db2b75}"/>
      <rule symbol="3" label="10% to 15%" filter="&quot;vbet_igo_elevated_ratio&quot; >= 0.1 and &quot;vbet_igo_elevated_ratio&quot; &lt; 0.15" key="{d7d5b108-b27e-43ea-8b09-70ac500cf74f}"/>
      <rule symbol="4" label="15% to 25%" filter="&quot;vbet_igo_elevated_ratio&quot; >= 0.15 and &quot;vbet_igo_elevated_ratio&quot; &lt; 0.25" key="{5dcf0a4e-c077-4839-b96f-8f5a04376f10}"/>
      <rule symbol="5" label="25% to 50% " filter="&quot;vbet_igo_elevated_ratio&quot; >= 0.25 and &quot;vbet_igo_elevated_ratio&quot; &lt; 0.5" key="{87131111-33cf-4724-b94c-a6e70b5d456a}"/>
      <rule symbol="6" label="50% to 75% " filter="&quot;vbet_igo_elevated_ratio&quot; >= 0.5 and &quot;vbet_igo_elevated_ratio&quot; &lt; 0.75" key="{c6db9e10-6619-439e-bf60-bb1e885b2b4c}"/>
      <rule symbol="7" label="> 75%" filter="&quot;vbet_igo_elevated_ratio&quot; >= 0.75" key="{3c29e498-5ded-4e5b-a89d-0ae78e081e85}"/>
    </rules>
    <symbols>
      <symbol clip_to_extent="1" alpha="1" force_rhr="0" name="0" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleMarker" enabled="1" locked="0">
          <Option type="Map">
            <Option value="0" name="angle" type="QString"/>
            <Option value="square" name="cap_style" type="QString"/>
            <Option value="247,252,245,255" name="color" type="QString"/>
            <Option value="1" name="horizontal_anchor_point" type="QString"/>
            <Option value="bevel" name="joinstyle" type="QString"/>
            <Option value="circle" name="name" type="QString"/>
            <Option value="0,0" name="offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="35,35,35,0" name="outline_color" type="QString"/>
            <Option value="solid" name="outline_style" type="QString"/>
            <Option value="0" name="outline_width" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
            <Option value="MM" name="outline_width_unit" type="QString"/>
            <Option value="diameter" name="scale_method" type="QString"/>
            <Option value="1.2" name="size" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
            <Option value="MM" name="size_unit" type="QString"/>
            <Option value="1" name="vertical_anchor_point" type="QString"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="247,252,245,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,0"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="1.2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" force_rhr="0" name="1" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleMarker" enabled="1" locked="0">
          <Option type="Map">
            <Option value="0" name="angle" type="QString"/>
            <Option value="square" name="cap_style" type="QString"/>
            <Option value="242,244,183,255" name="color" type="QString"/>
            <Option value="1" name="horizontal_anchor_point" type="QString"/>
            <Option value="bevel" name="joinstyle" type="QString"/>
            <Option value="circle" name="name" type="QString"/>
            <Option value="0,0" name="offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="35,35,35,0" name="outline_color" type="QString"/>
            <Option value="solid" name="outline_style" type="QString"/>
            <Option value="0" name="outline_width" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
            <Option value="MM" name="outline_width_unit" type="QString"/>
            <Option value="diameter" name="scale_method" type="QString"/>
            <Option value="1.2" name="size" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
            <Option value="MM" name="size_unit" type="QString"/>
            <Option value="1" name="vertical_anchor_point" type="QString"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="242,244,183,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,0"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="1.2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" force_rhr="0" name="2" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleMarker" enabled="1" locked="0">
          <Option type="Map">
            <Option value="0" name="angle" type="QString"/>
            <Option value="square" name="cap_style" type="QString"/>
            <Option value="237,236,121,255" name="color" type="QString"/>
            <Option value="1" name="horizontal_anchor_point" type="QString"/>
            <Option value="bevel" name="joinstyle" type="QString"/>
            <Option value="circle" name="name" type="QString"/>
            <Option value="0,0" name="offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="35,35,35,0" name="outline_color" type="QString"/>
            <Option value="solid" name="outline_style" type="QString"/>
            <Option value="0" name="outline_width" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
            <Option value="MM" name="outline_width_unit" type="QString"/>
            <Option value="diameter" name="scale_method" type="QString"/>
            <Option value="1.2" name="size" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
            <Option value="MM" name="size_unit" type="QString"/>
            <Option value="1" name="vertical_anchor_point" type="QString"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="237,236,121,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,0"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="1.2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" force_rhr="0" name="3" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleMarker" enabled="1" locked="0">
          <Option type="Map">
            <Option value="0" name="angle" type="QString"/>
            <Option value="square" name="cap_style" type="QString"/>
            <Option value="231,228,59,255" name="color" type="QString"/>
            <Option value="1" name="horizontal_anchor_point" type="QString"/>
            <Option value="bevel" name="joinstyle" type="QString"/>
            <Option value="circle" name="name" type="QString"/>
            <Option value="0,0" name="offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="35,35,35,0" name="outline_color" type="QString"/>
            <Option value="solid" name="outline_style" type="QString"/>
            <Option value="0" name="outline_width" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
            <Option value="MM" name="outline_width_unit" type="QString"/>
            <Option value="diameter" name="scale_method" type="QString"/>
            <Option value="1.2" name="size" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
            <Option value="MM" name="size_unit" type="QString"/>
            <Option value="1" name="vertical_anchor_point" type="QString"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="231,228,59,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,0"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="1.2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" force_rhr="0" name="4" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleMarker" enabled="1" locked="0">
          <Option type="Map">
            <Option value="0" name="angle" type="QString"/>
            <Option value="square" name="cap_style" type="QString"/>
            <Option value="212,208,31,255" name="color" type="QString"/>
            <Option value="1" name="horizontal_anchor_point" type="QString"/>
            <Option value="bevel" name="joinstyle" type="QString"/>
            <Option value="circle" name="name" type="QString"/>
            <Option value="0,0" name="offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="35,35,35,0" name="outline_color" type="QString"/>
            <Option value="solid" name="outline_style" type="QString"/>
            <Option value="0" name="outline_width" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
            <Option value="MM" name="outline_width_unit" type="QString"/>
            <Option value="diameter" name="scale_method" type="QString"/>
            <Option value="1.2" name="size" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
            <Option value="MM" name="size_unit" type="QString"/>
            <Option value="1" name="vertical_anchor_point" type="QString"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="212,208,31,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,0"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="1.2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" force_rhr="0" name="5" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleMarker" enabled="1" locked="0">
          <Option type="Map">
            <Option value="0" name="angle" type="QString"/>
            <Option value="square" name="cap_style" type="QString"/>
            <Option value="179,176,39,255" name="color" type="QString"/>
            <Option value="1" name="horizontal_anchor_point" type="QString"/>
            <Option value="bevel" name="joinstyle" type="QString"/>
            <Option value="circle" name="name" type="QString"/>
            <Option value="0,0" name="offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="35,35,35,0" name="outline_color" type="QString"/>
            <Option value="solid" name="outline_style" type="QString"/>
            <Option value="0" name="outline_width" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
            <Option value="MM" name="outline_width_unit" type="QString"/>
            <Option value="diameter" name="scale_method" type="QString"/>
            <Option value="1.2" name="size" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
            <Option value="MM" name="size_unit" type="QString"/>
            <Option value="1" name="vertical_anchor_point" type="QString"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="179,176,39,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,0"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="1.2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" force_rhr="0" name="6" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleMarker" enabled="1" locked="0">
          <Option type="Map">
            <Option value="0" name="angle" type="QString"/>
            <Option value="square" name="cap_style" type="QString"/>
            <Option value="146,143,46,255" name="color" type="QString"/>
            <Option value="1" name="horizontal_anchor_point" type="QString"/>
            <Option value="bevel" name="joinstyle" type="QString"/>
            <Option value="circle" name="name" type="QString"/>
            <Option value="0,0" name="offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="35,35,35,0" name="outline_color" type="QString"/>
            <Option value="solid" name="outline_style" type="QString"/>
            <Option value="0" name="outline_width" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
            <Option value="MM" name="outline_width_unit" type="QString"/>
            <Option value="diameter" name="scale_method" type="QString"/>
            <Option value="1.2" name="size" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
            <Option value="MM" name="size_unit" type="QString"/>
            <Option value="1" name="vertical_anchor_point" type="QString"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="146,143,46,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,0"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="1.2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" force_rhr="0" name="7" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleMarker" enabled="1" locked="0">
          <Option type="Map">
            <Option value="0" name="angle" type="QString"/>
            <Option value="square" name="cap_style" type="QString"/>
            <Option value="113,111,53,255" name="color" type="QString"/>
            <Option value="1" name="horizontal_anchor_point" type="QString"/>
            <Option value="bevel" name="joinstyle" type="QString"/>
            <Option value="circle" name="name" type="QString"/>
            <Option value="0,0" name="offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="MM" name="offset_unit" type="QString"/>
            <Option value="35,35,35,0" name="outline_color" type="QString"/>
            <Option value="solid" name="outline_style" type="QString"/>
            <Option value="0" name="outline_width" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
            <Option value="MM" name="outline_width_unit" type="QString"/>
            <Option value="diameter" name="scale_method" type="QString"/>
            <Option value="1.2" name="size" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
            <Option value="MM" name="size_unit" type="QString"/>
            <Option value="1" name="vertical_anchor_point" type="QString"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="113,111,53,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,0"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="1.2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <customproperties>
    <Option type="Map">
      <Option name="dualview/previewExpressions" type="List">
        <Option value="&quot;anthro_igo_road_dens&quot;" type="QString"/>
      </Option>
      <Option value="0" name="embeddedWidgets/count" type="int"/>
      <Option name="variableNames"/>
      <Option name="variableValues"/>
    </Option>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory penAlpha="255" backgroundAlpha="255" direction="0" lineSizeType="MM" minimumSize="0" penColor="#000000" labelPlacementMethod="XHeight" width="15" backgroundColor="#ffffff" maxScaleDenominator="1e+08" scaleDependency="Area" rotationOffset="270" opacity="1" scaleBasedVisibility="0" spacing="5" sizeScale="3x:0,0,0,0,0,0" enabled="0" height="15" lineSizeScale="3x:0,0,0,0,0,0" barWidth="5" showAxis="1" spacingUnitScale="3x:0,0,0,0,0,0" sizeType="MM" penWidth="0" diagramOrientation="Up" spacingUnit="MM" minScaleDenominator="0">
      <fontProperties style="" description="MS Shell Dlg 2,8.1,-1,5,50,0,0,0,0,0"/>
      <attribute color="#000000" field="" colorOpacity="1" label=""/>
      <axisSymbol>
        <symbol clip_to_extent="1" alpha="1" force_rhr="0" name="" type="line">
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
          <layer pass="0" class="SimpleLine" enabled="1" locked="0">
            <Option type="Map">
              <Option value="0" name="align_dash_pattern" type="QString"/>
              <Option value="square" name="capstyle" type="QString"/>
              <Option value="5;2" name="customdash" type="QString"/>
              <Option value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale" type="QString"/>
              <Option value="MM" name="customdash_unit" type="QString"/>
              <Option value="0" name="dash_pattern_offset" type="QString"/>
              <Option value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale" type="QString"/>
              <Option value="MM" name="dash_pattern_offset_unit" type="QString"/>
              <Option value="0" name="draw_inside_polygon" type="QString"/>
              <Option value="bevel" name="joinstyle" type="QString"/>
              <Option value="35,35,35,255" name="line_color" type="QString"/>
              <Option value="solid" name="line_style" type="QString"/>
              <Option value="0.26" name="line_width" type="QString"/>
              <Option value="MM" name="line_width_unit" type="QString"/>
              <Option value="0" name="offset" type="QString"/>
              <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
              <Option value="MM" name="offset_unit" type="QString"/>
              <Option value="0" name="ring_filter" type="QString"/>
              <Option value="0" name="trim_distance_end" type="QString"/>
              <Option value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale" type="QString"/>
              <Option value="MM" name="trim_distance_end_unit" type="QString"/>
              <Option value="0" name="trim_distance_start" type="QString"/>
              <Option value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale" type="QString"/>
              <Option value="MM" name="trim_distance_start_unit" type="QString"/>
              <Option value="0" name="tweak_dash_pattern_on_corners" type="QString"/>
              <Option value="0" name="use_custom_dash" type="QString"/>
              <Option value="3x:0,0,0,0,0,0" name="width_map_unit_scale" type="QString"/>
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
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </data_defined_properties>
          </layer>
        </symbol>
      </axisSymbol>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings priority="0" dist="0" placement="0" obstacle="0" zIndex="0" linePlacementFlags="18" showAll="1">
    <properties>
      <Option type="Map">
        <Option value="" name="name" type="QString"/>
        <Option name="properties"/>
        <Option value="collection" name="type" type="QString"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <legend showLabelLegend="0" type="default-vector"/>
  <referencedLayers/>
  <fieldConfiguration>
    <field configurationFlags="None" name="fid">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="level_path">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="seg_distance">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="stream_size">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="FCode">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="window_size">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="rme_dgo_ownership">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="rme_dgo_state">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="rme_dgo_county">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="rme_igo_prim_channel_gradient">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="rme_igo_valleybottom_gradient">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="rme_igo_rel_flow_length">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="rme_dgo_confluences">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="rme_dgo_diffluences">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="rme_igo_trib_per_km">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="rme_igo_planform_sinuosity">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="rme_dgo_drainage_area">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="nhd_dgo_streamorder">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="nhd_dgo_headwater">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="epa_dgo_ecoregion3">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="epa_dgo_ecoregion4">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="vbet_dgo_lowlying_area">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="vbet_dgo_elevated_area">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="vbet_dgo_channel_area">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="vbet_dgo_floodplain_area">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="vbet_igo_integrated_width">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="vbet_igo_active_channel_ratio">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="vbet_igo_low_lying_ratio">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="vbet_igo_elevated_ratio">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="vbet_igo_floodplain_ratio">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="vbet_igo_acres_vb_per_mile">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="vbet_igo_hect_vb_per_km">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="vbet_dgo_streamsize">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="conf_igo_confinement_ratio">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="conf_igo_constriction_ratio">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="conf_dgo_confining_margins">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="anthro_igo_road_dens">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="anthro_igo_rail_dens">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="anthro_igo_land_use_intens">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="rcat_igo_fldpln_access">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="rcat_igo_prop_riparian">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="rcat_igo_riparian_veg_departure">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="rcat_igo_riparian_ag_conversion">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="rcat_igo_riparian_develop">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="fid" name="" index="0"/>
    <alias field="level_path" name="" index="1"/>
    <alias field="seg_distance" name="" index="2"/>
    <alias field="stream_size" name="" index="3"/>
    <alias field="FCode" name="" index="4"/>
    <alias field="window_size" name="" index="5"/>
    <alias field="rme_dgo_ownership" name="" index="6"/>
    <alias field="rme_dgo_state" name="" index="7"/>
    <alias field="rme_dgo_county" name="" index="8"/>
    <alias field="rme_igo_prim_channel_gradient" name="" index="9"/>
    <alias field="rme_igo_valleybottom_gradient" name="" index="10"/>
    <alias field="rme_igo_rel_flow_length" name="" index="11"/>
    <alias field="rme_dgo_confluences" name="" index="12"/>
    <alias field="rme_dgo_diffluences" name="" index="13"/>
    <alias field="rme_igo_trib_per_km" name="" index="14"/>
    <alias field="rme_igo_planform_sinuosity" name="" index="15"/>
    <alias field="rme_dgo_drainage_area" name="" index="16"/>
    <alias field="nhd_dgo_streamorder" name="" index="17"/>
    <alias field="nhd_dgo_headwater" name="" index="18"/>
    <alias field="epa_dgo_ecoregion3" name="" index="19"/>
    <alias field="epa_dgo_ecoregion4" name="" index="20"/>
    <alias field="vbet_dgo_lowlying_area" name="" index="21"/>
    <alias field="vbet_dgo_elevated_area" name="" index="22"/>
    <alias field="vbet_dgo_channel_area" name="" index="23"/>
    <alias field="vbet_dgo_floodplain_area" name="" index="24"/>
    <alias field="vbet_igo_integrated_width" name="" index="25"/>
    <alias field="vbet_igo_active_channel_ratio" name="" index="26"/>
    <alias field="vbet_igo_low_lying_ratio" name="" index="27"/>
    <alias field="vbet_igo_elevated_ratio" name="" index="28"/>
    <alias field="vbet_igo_floodplain_ratio" name="" index="29"/>
    <alias field="vbet_igo_acres_vb_per_mile" name="" index="30"/>
    <alias field="vbet_igo_hect_vb_per_km" name="" index="31"/>
    <alias field="vbet_dgo_streamsize" name="" index="32"/>
    <alias field="conf_igo_confinement_ratio" name="" index="33"/>
    <alias field="conf_igo_constriction_ratio" name="" index="34"/>
    <alias field="conf_dgo_confining_margins" name="" index="35"/>
    <alias field="anthro_igo_road_dens" name="" index="36"/>
    <alias field="anthro_igo_rail_dens" name="" index="37"/>
    <alias field="anthro_igo_land_use_intens" name="" index="38"/>
    <alias field="rcat_igo_fldpln_access" name="" index="39"/>
    <alias field="rcat_igo_prop_riparian" name="" index="40"/>
    <alias field="rcat_igo_riparian_veg_departure" name="" index="41"/>
    <alias field="rcat_igo_riparian_ag_conversion" name="" index="42"/>
    <alias field="rcat_igo_riparian_develop" name="" index="43"/>
  </aliases>
  <defaults>
    <default expression="" field="fid" applyOnUpdate="0"/>
    <default expression="" field="level_path" applyOnUpdate="0"/>
    <default expression="" field="seg_distance" applyOnUpdate="0"/>
    <default expression="" field="stream_size" applyOnUpdate="0"/>
    <default expression="" field="FCode" applyOnUpdate="0"/>
    <default expression="" field="window_size" applyOnUpdate="0"/>
    <default expression="" field="rme_dgo_ownership" applyOnUpdate="0"/>
    <default expression="" field="rme_dgo_state" applyOnUpdate="0"/>
    <default expression="" field="rme_dgo_county" applyOnUpdate="0"/>
    <default expression="" field="rme_igo_prim_channel_gradient" applyOnUpdate="0"/>
    <default expression="" field="rme_igo_valleybottom_gradient" applyOnUpdate="0"/>
    <default expression="" field="rme_igo_rel_flow_length" applyOnUpdate="0"/>
    <default expression="" field="rme_dgo_confluences" applyOnUpdate="0"/>
    <default expression="" field="rme_dgo_diffluences" applyOnUpdate="0"/>
    <default expression="" field="rme_igo_trib_per_km" applyOnUpdate="0"/>
    <default expression="" field="rme_igo_planform_sinuosity" applyOnUpdate="0"/>
    <default expression="" field="rme_dgo_drainage_area" applyOnUpdate="0"/>
    <default expression="" field="nhd_dgo_streamorder" applyOnUpdate="0"/>
    <default expression="" field="nhd_dgo_headwater" applyOnUpdate="0"/>
    <default expression="" field="epa_dgo_ecoregion3" applyOnUpdate="0"/>
    <default expression="" field="epa_dgo_ecoregion4" applyOnUpdate="0"/>
    <default expression="" field="vbet_dgo_lowlying_area" applyOnUpdate="0"/>
    <default expression="" field="vbet_dgo_elevated_area" applyOnUpdate="0"/>
    <default expression="" field="vbet_dgo_channel_area" applyOnUpdate="0"/>
    <default expression="" field="vbet_dgo_floodplain_area" applyOnUpdate="0"/>
    <default expression="" field="vbet_igo_integrated_width" applyOnUpdate="0"/>
    <default expression="" field="vbet_igo_active_channel_ratio" applyOnUpdate="0"/>
    <default expression="" field="vbet_igo_low_lying_ratio" applyOnUpdate="0"/>
    <default expression="" field="vbet_igo_elevated_ratio" applyOnUpdate="0"/>
    <default expression="" field="vbet_igo_floodplain_ratio" applyOnUpdate="0"/>
    <default expression="" field="vbet_igo_acres_vb_per_mile" applyOnUpdate="0"/>
    <default expression="" field="vbet_igo_hect_vb_per_km" applyOnUpdate="0"/>
    <default expression="" field="vbet_dgo_streamsize" applyOnUpdate="0"/>
    <default expression="" field="conf_igo_confinement_ratio" applyOnUpdate="0"/>
    <default expression="" field="conf_igo_constriction_ratio" applyOnUpdate="0"/>
    <default expression="" field="conf_dgo_confining_margins" applyOnUpdate="0"/>
    <default expression="" field="anthro_igo_road_dens" applyOnUpdate="0"/>
    <default expression="" field="anthro_igo_rail_dens" applyOnUpdate="0"/>
    <default expression="" field="anthro_igo_land_use_intens" applyOnUpdate="0"/>
    <default expression="" field="rcat_igo_fldpln_access" applyOnUpdate="0"/>
    <default expression="" field="rcat_igo_prop_riparian" applyOnUpdate="0"/>
    <default expression="" field="rcat_igo_riparian_veg_departure" applyOnUpdate="0"/>
    <default expression="" field="rcat_igo_riparian_ag_conversion" applyOnUpdate="0"/>
    <default expression="" field="rcat_igo_riparian_develop" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint unique_strength="1" constraints="3" notnull_strength="1" exp_strength="0" field="fid"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="level_path"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="seg_distance"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="stream_size"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="FCode"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="window_size"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="rme_dgo_ownership"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="rme_dgo_state"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="rme_dgo_county"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="rme_igo_prim_channel_gradient"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="rme_igo_valleybottom_gradient"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="rme_igo_rel_flow_length"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="rme_dgo_confluences"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="rme_dgo_diffluences"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="rme_igo_trib_per_km"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="rme_igo_planform_sinuosity"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="rme_dgo_drainage_area"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="nhd_dgo_streamorder"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="nhd_dgo_headwater"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="epa_dgo_ecoregion3"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="epa_dgo_ecoregion4"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="vbet_dgo_lowlying_area"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="vbet_dgo_elevated_area"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="vbet_dgo_channel_area"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="vbet_dgo_floodplain_area"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="vbet_igo_integrated_width"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="vbet_igo_active_channel_ratio"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="vbet_igo_low_lying_ratio"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="vbet_igo_elevated_ratio"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="vbet_igo_floodplain_ratio"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="vbet_igo_acres_vb_per_mile"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="vbet_igo_hect_vb_per_km"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="vbet_dgo_streamsize"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="conf_igo_confinement_ratio"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="conf_igo_constriction_ratio"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="conf_dgo_confining_margins"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="anthro_igo_road_dens"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="anthro_igo_rail_dens"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="anthro_igo_land_use_intens"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="rcat_igo_fldpln_access"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="rcat_igo_prop_riparian"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="rcat_igo_riparian_veg_departure"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="rcat_igo_riparian_ag_conversion"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="rcat_igo_riparian_develop"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" field="fid" desc=""/>
    <constraint exp="" field="level_path" desc=""/>
    <constraint exp="" field="seg_distance" desc=""/>
    <constraint exp="" field="stream_size" desc=""/>
    <constraint exp="" field="FCode" desc=""/>
    <constraint exp="" field="window_size" desc=""/>
    <constraint exp="" field="rme_dgo_ownership" desc=""/>
    <constraint exp="" field="rme_dgo_state" desc=""/>
    <constraint exp="" field="rme_dgo_county" desc=""/>
    <constraint exp="" field="rme_igo_prim_channel_gradient" desc=""/>
    <constraint exp="" field="rme_igo_valleybottom_gradient" desc=""/>
    <constraint exp="" field="rme_igo_rel_flow_length" desc=""/>
    <constraint exp="" field="rme_dgo_confluences" desc=""/>
    <constraint exp="" field="rme_dgo_diffluences" desc=""/>
    <constraint exp="" field="rme_igo_trib_per_km" desc=""/>
    <constraint exp="" field="rme_igo_planform_sinuosity" desc=""/>
    <constraint exp="" field="rme_dgo_drainage_area" desc=""/>
    <constraint exp="" field="nhd_dgo_streamorder" desc=""/>
    <constraint exp="" field="nhd_dgo_headwater" desc=""/>
    <constraint exp="" field="epa_dgo_ecoregion3" desc=""/>
    <constraint exp="" field="epa_dgo_ecoregion4" desc=""/>
    <constraint exp="" field="vbet_dgo_lowlying_area" desc=""/>
    <constraint exp="" field="vbet_dgo_elevated_area" desc=""/>
    <constraint exp="" field="vbet_dgo_channel_area" desc=""/>
    <constraint exp="" field="vbet_dgo_floodplain_area" desc=""/>
    <constraint exp="" field="vbet_igo_integrated_width" desc=""/>
    <constraint exp="" field="vbet_igo_active_channel_ratio" desc=""/>
    <constraint exp="" field="vbet_igo_low_lying_ratio" desc=""/>
    <constraint exp="" field="vbet_igo_elevated_ratio" desc=""/>
    <constraint exp="" field="vbet_igo_floodplain_ratio" desc=""/>
    <constraint exp="" field="vbet_igo_acres_vb_per_mile" desc=""/>
    <constraint exp="" field="vbet_igo_hect_vb_per_km" desc=""/>
    <constraint exp="" field="vbet_dgo_streamsize" desc=""/>
    <constraint exp="" field="conf_igo_confinement_ratio" desc=""/>
    <constraint exp="" field="conf_igo_constriction_ratio" desc=""/>
    <constraint exp="" field="conf_dgo_confining_margins" desc=""/>
    <constraint exp="" field="anthro_igo_road_dens" desc=""/>
    <constraint exp="" field="anthro_igo_rail_dens" desc=""/>
    <constraint exp="" field="anthro_igo_land_use_intens" desc=""/>
    <constraint exp="" field="rcat_igo_fldpln_access" desc=""/>
    <constraint exp="" field="rcat_igo_prop_riparian" desc=""/>
    <constraint exp="" field="rcat_igo_riparian_veg_departure" desc=""/>
    <constraint exp="" field="rcat_igo_riparian_ag_conversion" desc=""/>
    <constraint exp="" field="rcat_igo_riparian_develop" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortExpression="" sortOrder="0">
    <columns>
      <column hidden="0" width="-1" name="fid" type="field"/>
      <column hidden="0" width="-1" name="level_path" type="field"/>
      <column hidden="0" width="-1" name="seg_distance" type="field"/>
      <column hidden="0" width="-1" name="stream_size" type="field"/>
      <column hidden="0" width="-1" name="FCode" type="field"/>
      <column hidden="0" width="-1" name="window_size" type="field"/>
      <column hidden="0" width="-1" name="rme_dgo_ownership" type="field"/>
      <column hidden="0" width="-1" name="rme_dgo_state" type="field"/>
      <column hidden="0" width="-1" name="rme_dgo_county" type="field"/>
      <column hidden="0" width="-1" name="rme_igo_prim_channel_gradient" type="field"/>
      <column hidden="0" width="-1" name="rme_igo_valleybottom_gradient" type="field"/>
      <column hidden="0" width="-1" name="rme_igo_rel_flow_length" type="field"/>
      <column hidden="0" width="-1" name="rme_dgo_confluences" type="field"/>
      <column hidden="0" width="-1" name="rme_dgo_diffluences" type="field"/>
      <column hidden="0" width="-1" name="rme_igo_trib_per_km" type="field"/>
      <column hidden="0" width="-1" name="rme_igo_planform_sinuosity" type="field"/>
      <column hidden="0" width="-1" name="rme_dgo_drainage_area" type="field"/>
      <column hidden="0" width="-1" name="nhd_dgo_streamorder" type="field"/>
      <column hidden="0" width="-1" name="nhd_dgo_headwater" type="field"/>
      <column hidden="0" width="-1" name="epa_dgo_ecoregion3" type="field"/>
      <column hidden="0" width="-1" name="epa_dgo_ecoregion4" type="field"/>
      <column hidden="0" width="-1" name="vbet_dgo_lowlying_area" type="field"/>
      <column hidden="0" width="-1" name="vbet_dgo_elevated_area" type="field"/>
      <column hidden="0" width="-1" name="vbet_dgo_channel_area" type="field"/>
      <column hidden="0" width="-1" name="vbet_dgo_floodplain_area" type="field"/>
      <column hidden="0" width="-1" name="vbet_igo_integrated_width" type="field"/>
      <column hidden="0" width="-1" name="vbet_igo_active_channel_ratio" type="field"/>
      <column hidden="0" width="407" name="vbet_igo_low_lying_ratio" type="field"/>
      <column hidden="0" width="-1" name="vbet_igo_elevated_ratio" type="field"/>
      <column hidden="0" width="-1" name="vbet_igo_floodplain_ratio" type="field"/>
      <column hidden="0" width="-1" name="vbet_igo_acres_vb_per_mile" type="field"/>
      <column hidden="0" width="-1" name="vbet_igo_hect_vb_per_km" type="field"/>
      <column hidden="0" width="-1" name="vbet_dgo_streamsize" type="field"/>
      <column hidden="0" width="-1" name="conf_igo_confinement_ratio" type="field"/>
      <column hidden="0" width="-1" name="conf_igo_constriction_ratio" type="field"/>
      <column hidden="0" width="-1" name="conf_dgo_confining_margins" type="field"/>
      <column hidden="0" width="-1" name="anthro_igo_road_dens" type="field"/>
      <column hidden="0" width="-1" name="anthro_igo_rail_dens" type="field"/>
      <column hidden="0" width="-1" name="anthro_igo_land_use_intens" type="field"/>
      <column hidden="0" width="-1" name="rcat_igo_fldpln_access" type="field"/>
      <column hidden="0" width="-1" name="rcat_igo_prop_riparian" type="field"/>
      <column hidden="0" width="-1" name="rcat_igo_riparian_veg_departure" type="field"/>
      <column hidden="0" width="-1" name="rcat_igo_riparian_ag_conversion" type="field"/>
      <column hidden="0" width="-1" name="rcat_igo_riparian_develop" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
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
    <field name="FCode" editable="1"/>
    <field name="anthro_igo_land_use_intens" editable="1"/>
    <field name="anthro_igo_rail_dens" editable="1"/>
    <field name="anthro_igo_road_dens" editable="1"/>
    <field name="conf_dgo_confining_margins" editable="1"/>
    <field name="conf_igo_confinement_ratio" editable="1"/>
    <field name="conf_igo_constriction_ratio" editable="1"/>
    <field name="epa_dgo_ecoregion3" editable="1"/>
    <field name="epa_dgo_ecoregion4" editable="1"/>
    <field name="fid" editable="1"/>
    <field name="level_path" editable="1"/>
    <field name="nhd_dgo_headwater" editable="1"/>
    <field name="nhd_dgo_streamorder" editable="1"/>
    <field name="rcat_igo_fldpln_access" editable="1"/>
    <field name="rcat_igo_prop_riparian" editable="1"/>
    <field name="rcat_igo_riparian_ag_conversion" editable="1"/>
    <field name="rcat_igo_riparian_develop" editable="1"/>
    <field name="rcat_igo_riparian_veg_departure" editable="1"/>
    <field name="rme_dgo_confluences" editable="1"/>
    <field name="rme_dgo_county" editable="1"/>
    <field name="rme_dgo_diffluences" editable="1"/>
    <field name="rme_dgo_drainage_area" editable="1"/>
    <field name="rme_dgo_ownership" editable="1"/>
    <field name="rme_dgo_state" editable="1"/>
    <field name="rme_igo_planform_sinuosity" editable="1"/>
    <field name="rme_igo_prim_channel_gradient" editable="1"/>
    <field name="rme_igo_rel_flow_length" editable="1"/>
    <field name="rme_igo_trib_per_km" editable="1"/>
    <field name="rme_igo_valleybottom_gradient" editable="1"/>
    <field name="seg_distance" editable="1"/>
    <field name="stream_size" editable="1"/>
    <field name="vbet_dgo_channel_area" editable="1"/>
    <field name="vbet_dgo_elevated_area" editable="1"/>
    <field name="vbet_dgo_floodplain_area" editable="1"/>
    <field name="vbet_dgo_lowlying_area" editable="1"/>
    <field name="vbet_dgo_streamsize" editable="1"/>
    <field name="vbet_igo_acres_vb_per_mile" editable="1"/>
    <field name="vbet_igo_active_channel_ratio" editable="1"/>
    <field name="vbet_igo_elevated_ratio" editable="1"/>
    <field name="vbet_igo_floodplain_ratio" editable="1"/>
    <field name="vbet_igo_hect_vb_per_km" editable="1"/>
    <field name="vbet_igo_integrated_width" editable="1"/>
    <field name="vbet_igo_low_lying_ratio" editable="1"/>
    <field name="window_size" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="FCode" labelOnTop="0"/>
    <field name="anthro_igo_land_use_intens" labelOnTop="0"/>
    <field name="anthro_igo_rail_dens" labelOnTop="0"/>
    <field name="anthro_igo_road_dens" labelOnTop="0"/>
    <field name="conf_dgo_confining_margins" labelOnTop="0"/>
    <field name="conf_igo_confinement_ratio" labelOnTop="0"/>
    <field name="conf_igo_constriction_ratio" labelOnTop="0"/>
    <field name="epa_dgo_ecoregion3" labelOnTop="0"/>
    <field name="epa_dgo_ecoregion4" labelOnTop="0"/>
    <field name="fid" labelOnTop="0"/>
    <field name="level_path" labelOnTop="0"/>
    <field name="nhd_dgo_headwater" labelOnTop="0"/>
    <field name="nhd_dgo_streamorder" labelOnTop="0"/>
    <field name="rcat_igo_fldpln_access" labelOnTop="0"/>
    <field name="rcat_igo_prop_riparian" labelOnTop="0"/>
    <field name="rcat_igo_riparian_ag_conversion" labelOnTop="0"/>
    <field name="rcat_igo_riparian_develop" labelOnTop="0"/>
    <field name="rcat_igo_riparian_veg_departure" labelOnTop="0"/>
    <field name="rme_dgo_confluences" labelOnTop="0"/>
    <field name="rme_dgo_county" labelOnTop="0"/>
    <field name="rme_dgo_diffluences" labelOnTop="0"/>
    <field name="rme_dgo_drainage_area" labelOnTop="0"/>
    <field name="rme_dgo_ownership" labelOnTop="0"/>
    <field name="rme_dgo_state" labelOnTop="0"/>
    <field name="rme_igo_planform_sinuosity" labelOnTop="0"/>
    <field name="rme_igo_prim_channel_gradient" labelOnTop="0"/>
    <field name="rme_igo_rel_flow_length" labelOnTop="0"/>
    <field name="rme_igo_trib_per_km" labelOnTop="0"/>
    <field name="rme_igo_valleybottom_gradient" labelOnTop="0"/>
    <field name="seg_distance" labelOnTop="0"/>
    <field name="stream_size" labelOnTop="0"/>
    <field name="vbet_dgo_channel_area" labelOnTop="0"/>
    <field name="vbet_dgo_elevated_area" labelOnTop="0"/>
    <field name="vbet_dgo_floodplain_area" labelOnTop="0"/>
    <field name="vbet_dgo_lowlying_area" labelOnTop="0"/>
    <field name="vbet_dgo_streamsize" labelOnTop="0"/>
    <field name="vbet_igo_acres_vb_per_mile" labelOnTop="0"/>
    <field name="vbet_igo_active_channel_ratio" labelOnTop="0"/>
    <field name="vbet_igo_elevated_ratio" labelOnTop="0"/>
    <field name="vbet_igo_floodplain_ratio" labelOnTop="0"/>
    <field name="vbet_igo_hect_vb_per_km" labelOnTop="0"/>
    <field name="vbet_igo_integrated_width" labelOnTop="0"/>
    <field name="vbet_igo_low_lying_ratio" labelOnTop="0"/>
    <field name="window_size" labelOnTop="0"/>
  </labelOnTop>
  <reuseLastValue>
    <field name="FCode" reuseLastValue="0"/>
    <field name="anthro_igo_land_use_intens" reuseLastValue="0"/>
    <field name="anthro_igo_rail_dens" reuseLastValue="0"/>
    <field name="anthro_igo_road_dens" reuseLastValue="0"/>
    <field name="conf_dgo_confining_margins" reuseLastValue="0"/>
    <field name="conf_igo_confinement_ratio" reuseLastValue="0"/>
    <field name="conf_igo_constriction_ratio" reuseLastValue="0"/>
    <field name="epa_dgo_ecoregion3" reuseLastValue="0"/>
    <field name="epa_dgo_ecoregion4" reuseLastValue="0"/>
    <field name="fid" reuseLastValue="0"/>
    <field name="level_path" reuseLastValue="0"/>
    <field name="nhd_dgo_headwater" reuseLastValue="0"/>
    <field name="nhd_dgo_streamorder" reuseLastValue="0"/>
    <field name="rcat_igo_fldpln_access" reuseLastValue="0"/>
    <field name="rcat_igo_prop_riparian" reuseLastValue="0"/>
    <field name="rcat_igo_riparian_ag_conversion" reuseLastValue="0"/>
    <field name="rcat_igo_riparian_develop" reuseLastValue="0"/>
    <field name="rcat_igo_riparian_veg_departure" reuseLastValue="0"/>
    <field name="rme_dgo_confluences" reuseLastValue="0"/>
    <field name="rme_dgo_county" reuseLastValue="0"/>
    <field name="rme_dgo_diffluences" reuseLastValue="0"/>
    <field name="rme_dgo_drainage_area" reuseLastValue="0"/>
    <field name="rme_dgo_ownership" reuseLastValue="0"/>
    <field name="rme_dgo_state" reuseLastValue="0"/>
    <field name="rme_igo_planform_sinuosity" reuseLastValue="0"/>
    <field name="rme_igo_prim_channel_gradient" reuseLastValue="0"/>
    <field name="rme_igo_rel_flow_length" reuseLastValue="0"/>
    <field name="rme_igo_trib_per_km" reuseLastValue="0"/>
    <field name="rme_igo_valleybottom_gradient" reuseLastValue="0"/>
    <field name="seg_distance" reuseLastValue="0"/>
    <field name="stream_size" reuseLastValue="0"/>
    <field name="vbet_dgo_channel_area" reuseLastValue="0"/>
    <field name="vbet_dgo_elevated_area" reuseLastValue="0"/>
    <field name="vbet_dgo_floodplain_area" reuseLastValue="0"/>
    <field name="vbet_dgo_lowlying_area" reuseLastValue="0"/>
    <field name="vbet_dgo_streamsize" reuseLastValue="0"/>
    <field name="vbet_igo_acres_vb_per_mile" reuseLastValue="0"/>
    <field name="vbet_igo_active_channel_ratio" reuseLastValue="0"/>
    <field name="vbet_igo_elevated_ratio" reuseLastValue="0"/>
    <field name="vbet_igo_floodplain_ratio" reuseLastValue="0"/>
    <field name="vbet_igo_hect_vb_per_km" reuseLastValue="0"/>
    <field name="vbet_igo_integrated_width" reuseLastValue="0"/>
    <field name="vbet_igo_low_lying_ratio" reuseLastValue="0"/>
    <field name="window_size" reuseLastValue="0"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"anthro_igo_road_dens"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
