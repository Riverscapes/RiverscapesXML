<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" readOnly="0" simplifyMaxScale="1" simplifyLocal="1" simplifyDrawingTol="1" simplifyAlgorithm="0" simplifyDrawingHints="0" version="3.22.11-Białowieża" labelsEnabled="0" symbologyReferenceScale="-1" styleCategories="AllStyleCategories" maxScale="0" minScale="100000000">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal enabled="0" startField="" endField="" startExpression="" mode="0" durationField="" durationUnit="min" fixedDuration="0" endExpression="" limitMode="0" accumulate="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <renderer-v2 forceraster="0" symbollevels="0" type="RuleRenderer" referencescale="-1" enableorderby="0">
    <rules key="{bfe459db-997f-4ccc-8f48-8c5cfdf9e07d}">
      <rule label="&lt; 10" filter="(vbet_igo_integrated_width) &lt;= 10.000000" symbol="0" key="{eb884ca5-3b03-45b3-944f-37057f1baa75}"/>
      <rule label="10 to 25 m" filter="(vbet_igo_integrated_width) > 10.000000 AND (vbet_igo_integrated_width) &lt;= 25.000000" symbol="1" key="{500deeaf-a80e-4915-bc90-5000ce4de710}"/>
      <rule label="25 to 100 m" filter="(vbet_igo_integrated_width) > 25.000000 AND (vbet_igo_integrated_width) &lt;= 100.000000" symbol="2" key="{b855a1db-9f2f-41bf-98e6-a05293182954}"/>
      <rule label="100 to 250 m" filter="(vbet_igo_integrated_width) > 100.000000 AND (vbet_igo_integrated_width) &lt;= 250.000000" symbol="3" key="{370fe9c2-2128-4201-a7c4-e7f5c4114bdd}"/>
      <rule label="250 to 500 m" filter="(vbet_igo_integrated_width) > 250.000000 AND (vbet_igo_integrated_width) &lt;= 500.000000" symbol="4" key="{bbf7095f-7b49-4e47-aef4-766f4e709426}"/>
      <rule label="500 m to 1 km" filter="(vbet_igo_integrated_width) > 500.000000 AND (vbet_igo_integrated_width) &lt;= 10000.000000" symbol="5" key="{e1bbc36c-3396-440b-874e-767eb132833a}"/>
      <rule label="1 to 10 km" filter="(vbet_igo_integrated_width) > 1000.000000 AND (vbet_igo_integrated_width) &lt;= 10000.000000" symbol="6" key="{9a9953f0-5c4d-42c3-9227-2649fd1dff1e}"/>
      <rule label="> 10 km" filter="(vbet_igo_integrated_width) > 10000.000000" symbol="7" key="{30d1c668-31ba-4df8-a7c4-60bf7eec79f2}"/>
    </rules>
    <symbols>
      <symbol force_rhr="0" alpha="1" clip_to_extent="1" name="0" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleMarker" locked="0" enabled="1" pass="0">
          <Option type="Map">
            <Option value="0" name="angle" type="QString"/>
            <Option value="square" name="cap_style" type="QString"/>
            <Option value="71,44,124,255" name="color" type="QString"/>
            <Option value="1" name="horizontal_anchor_point" type="QString"/>
            <Option value="bevel" name="joinstyle" type="QString"/>
            <Option value="circle" name="name" type="QString"/>
            <Option value="0,0" name="offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="Point" name="offset_unit" type="QString"/>
            <Option value="35,35,35,0" name="outline_color" type="QString"/>
            <Option value="solid" name="outline_style" type="QString"/>
            <Option value="0" name="outline_width" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
            <Option value="Point" name="outline_width_unit" type="QString"/>
            <Option value="diameter" name="scale_method" type="QString"/>
            <Option value="1" name="size" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
            <Option value="MM" name="size_unit" type="QString"/>
            <Option value="1" name="vertical_anchor_point" type="QString"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="71,44,124,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="Point"/>
          <prop k="outline_color" v="35,35,35,0"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="Point"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="1"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="size" type="Map">
                  <Option value="false" name="active" type="bool"/>
                  <Option value="var('map_scale')" name="expression" type="QString"/>
                  <Option name="transformer" type="Map">
                    <Option name="d" type="Map">
                      <Option name="curve" type="Map">
                        <Option value="0,0.12195121951219512,0.38211382113821141,0.76016260162601623,1" name="x" type="QString"/>
                        <Option value="0,0.19780219780219779,0.59340659340659341,0.79120879120879117,1" name="y" type="QString"/>
                      </Option>
                      <Option value="0.57" name="exponent" type="double"/>
                      <Option value="1" name="maxSize" type="double"/>
                      <Option value="100000" name="maxValue" type="double"/>
                      <Option value="10" name="minSize" type="double"/>
                      <Option value="1" name="minValue" type="double"/>
                      <Option value="0" name="nullSize" type="double"/>
                      <Option value="2" name="scaleType" type="int"/>
                    </Option>
                    <Option value="1" name="t" type="int"/>
                  </Option>
                  <Option value="3" name="type" type="int"/>
                </Option>
              </Option>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" alpha="1" clip_to_extent="1" name="1" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleMarker" locked="0" enabled="1" pass="0">
          <Option type="Map">
            <Option value="0" name="angle" type="QString"/>
            <Option value="square" name="cap_style" type="QString"/>
            <Option value="59,82,139,255" name="color" type="QString"/>
            <Option value="1" name="horizontal_anchor_point" type="QString"/>
            <Option value="bevel" name="joinstyle" type="QString"/>
            <Option value="circle" name="name" type="QString"/>
            <Option value="0,0" name="offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="Point" name="offset_unit" type="QString"/>
            <Option value="35,35,35,0" name="outline_color" type="QString"/>
            <Option value="solid" name="outline_style" type="QString"/>
            <Option value="0" name="outline_width" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
            <Option value="Point" name="outline_width_unit" type="QString"/>
            <Option value="diameter" name="scale_method" type="QString"/>
            <Option value="1.2" name="size" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
            <Option value="MM" name="size_unit" type="QString"/>
            <Option value="1" name="vertical_anchor_point" type="QString"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="59,82,139,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="Point"/>
          <prop k="outline_color" v="35,35,35,0"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="Point"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="1.2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="size" type="Map">
                  <Option value="false" name="active" type="bool"/>
                  <Option value="var('map_scale')" name="expression" type="QString"/>
                  <Option name="transformer" type="Map">
                    <Option name="d" type="Map">
                      <Option name="curve" type="Map">
                        <Option value="0,0.12195121951219512,0.38211382113821141,0.76016260162601623,1" name="x" type="QString"/>
                        <Option value="0,0.19780219780219779,0.59340659340659341,0.79120879120879117,1" name="y" type="QString"/>
                      </Option>
                      <Option value="0.57" name="exponent" type="double"/>
                      <Option value="1" name="maxSize" type="double"/>
                      <Option value="100000" name="maxValue" type="double"/>
                      <Option value="10" name="minSize" type="double"/>
                      <Option value="1" name="minValue" type="double"/>
                      <Option value="0" name="nullSize" type="double"/>
                      <Option value="2" name="scaleType" type="int"/>
                    </Option>
                    <Option value="1" name="t" type="int"/>
                  </Option>
                  <Option value="3" name="type" type="int"/>
                </Option>
              </Option>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" alpha="1" clip_to_extent="1" name="2" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleMarker" locked="0" enabled="1" pass="0">
          <Option type="Map">
            <Option value="0" name="angle" type="QString"/>
            <Option value="square" name="cap_style" type="QString"/>
            <Option value="44,114,142,255" name="color" type="QString"/>
            <Option value="1" name="horizontal_anchor_point" type="QString"/>
            <Option value="bevel" name="joinstyle" type="QString"/>
            <Option value="circle" name="name" type="QString"/>
            <Option value="0,0" name="offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="Point" name="offset_unit" type="QString"/>
            <Option value="35,35,35,0" name="outline_color" type="QString"/>
            <Option value="solid" name="outline_style" type="QString"/>
            <Option value="0" name="outline_width" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
            <Option value="Point" name="outline_width_unit" type="QString"/>
            <Option value="diameter" name="scale_method" type="QString"/>
            <Option value="1.4" name="size" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
            <Option value="MM" name="size_unit" type="QString"/>
            <Option value="1" name="vertical_anchor_point" type="QString"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="44,114,142,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="Point"/>
          <prop k="outline_color" v="35,35,35,0"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="Point"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="1.4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="size" type="Map">
                  <Option value="false" name="active" type="bool"/>
                  <Option value="var('map_scale')" name="expression" type="QString"/>
                  <Option name="transformer" type="Map">
                    <Option name="d" type="Map">
                      <Option name="curve" type="Map">
                        <Option value="0,0.12195121951219512,0.38211382113821141,0.76016260162601623,1" name="x" type="QString"/>
                        <Option value="0,0.19780219780219779,0.59340659340659341,0.79120879120879117,1" name="y" type="QString"/>
                      </Option>
                      <Option value="0.57" name="exponent" type="double"/>
                      <Option value="1" name="maxSize" type="double"/>
                      <Option value="100000" name="maxValue" type="double"/>
                      <Option value="10" name="minSize" type="double"/>
                      <Option value="1" name="minValue" type="double"/>
                      <Option value="0" name="nullSize" type="double"/>
                      <Option value="2" name="scaleType" type="int"/>
                    </Option>
                    <Option value="1" name="t" type="int"/>
                  </Option>
                  <Option value="3" name="type" type="int"/>
                </Option>
              </Option>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" alpha="1" clip_to_extent="1" name="3" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleMarker" locked="0" enabled="1" pass="0">
          <Option type="Map">
            <Option value="0" name="angle" type="QString"/>
            <Option value="square" name="cap_style" type="QString"/>
            <Option value="33,144,141,255" name="color" type="QString"/>
            <Option value="1" name="horizontal_anchor_point" type="QString"/>
            <Option value="bevel" name="joinstyle" type="QString"/>
            <Option value="circle" name="name" type="QString"/>
            <Option value="0,0" name="offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="Point" name="offset_unit" type="QString"/>
            <Option value="35,35,35,0" name="outline_color" type="QString"/>
            <Option value="solid" name="outline_style" type="QString"/>
            <Option value="0" name="outline_width" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
            <Option value="Point" name="outline_width_unit" type="QString"/>
            <Option value="diameter" name="scale_method" type="QString"/>
            <Option value="1.6" name="size" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
            <Option value="MM" name="size_unit" type="QString"/>
            <Option value="1" name="vertical_anchor_point" type="QString"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="33,144,141,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="Point"/>
          <prop k="outline_color" v="35,35,35,0"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="Point"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="1.6"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="size" type="Map">
                  <Option value="false" name="active" type="bool"/>
                  <Option value="var('map_scale')" name="expression" type="QString"/>
                  <Option name="transformer" type="Map">
                    <Option name="d" type="Map">
                      <Option name="curve" type="Map">
                        <Option value="0,0.12195121951219512,0.38211382113821141,0.76016260162601623,1" name="x" type="QString"/>
                        <Option value="0,0.19780219780219779,0.59340659340659341,0.79120879120879117,1" name="y" type="QString"/>
                      </Option>
                      <Option value="0.57" name="exponent" type="double"/>
                      <Option value="1" name="maxSize" type="double"/>
                      <Option value="100000" name="maxValue" type="double"/>
                      <Option value="10" name="minSize" type="double"/>
                      <Option value="1" name="minValue" type="double"/>
                      <Option value="0" name="nullSize" type="double"/>
                      <Option value="2" name="scaleType" type="int"/>
                    </Option>
                    <Option value="1" name="t" type="int"/>
                  </Option>
                  <Option value="3" name="type" type="int"/>
                </Option>
              </Option>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" alpha="1" clip_to_extent="1" name="4" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleMarker" locked="0" enabled="1" pass="0">
          <Option type="Map">
            <Option value="0" name="angle" type="QString"/>
            <Option value="square" name="cap_style" type="QString"/>
            <Option value="40,174,128,255" name="color" type="QString"/>
            <Option value="1" name="horizontal_anchor_point" type="QString"/>
            <Option value="bevel" name="joinstyle" type="QString"/>
            <Option value="circle" name="name" type="QString"/>
            <Option value="0,0" name="offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="Point" name="offset_unit" type="QString"/>
            <Option value="35,35,35,0" name="outline_color" type="QString"/>
            <Option value="solid" name="outline_style" type="QString"/>
            <Option value="0" name="outline_width" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
            <Option value="Point" name="outline_width_unit" type="QString"/>
            <Option value="diameter" name="scale_method" type="QString"/>
            <Option value="1.8" name="size" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
            <Option value="MM" name="size_unit" type="QString"/>
            <Option value="1" name="vertical_anchor_point" type="QString"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="40,174,128,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="Point"/>
          <prop k="outline_color" v="35,35,35,0"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="Point"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="1.8"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="size" type="Map">
                  <Option value="false" name="active" type="bool"/>
                  <Option value="var('map_scale')" name="expression" type="QString"/>
                  <Option name="transformer" type="Map">
                    <Option name="d" type="Map">
                      <Option name="curve" type="Map">
                        <Option value="0,0.12195121951219512,0.38211382113821141,0.76016260162601623,1" name="x" type="QString"/>
                        <Option value="0,0.19780219780219779,0.59340659340659341,0.79120879120879117,1" name="y" type="QString"/>
                      </Option>
                      <Option value="0.57" name="exponent" type="double"/>
                      <Option value="1" name="maxSize" type="double"/>
                      <Option value="100000" name="maxValue" type="double"/>
                      <Option value="10" name="minSize" type="double"/>
                      <Option value="1" name="minValue" type="double"/>
                      <Option value="0" name="nullSize" type="double"/>
                      <Option value="2" name="scaleType" type="int"/>
                    </Option>
                    <Option value="1" name="t" type="int"/>
                  </Option>
                  <Option value="3" name="type" type="int"/>
                </Option>
              </Option>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" alpha="1" clip_to_extent="1" name="5" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleMarker" locked="0" enabled="1" pass="0">
          <Option type="Map">
            <Option value="0" name="angle" type="QString"/>
            <Option value="square" name="cap_style" type="QString"/>
            <Option value="93,201,99,255" name="color" type="QString"/>
            <Option value="1" name="horizontal_anchor_point" type="QString"/>
            <Option value="bevel" name="joinstyle" type="QString"/>
            <Option value="circle" name="name" type="QString"/>
            <Option value="0,0" name="offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="Point" name="offset_unit" type="QString"/>
            <Option value="35,35,35,0" name="outline_color" type="QString"/>
            <Option value="solid" name="outline_style" type="QString"/>
            <Option value="0" name="outline_width" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
            <Option value="Point" name="outline_width_unit" type="QString"/>
            <Option value="diameter" name="scale_method" type="QString"/>
            <Option value="2" name="size" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
            <Option value="MM" name="size_unit" type="QString"/>
            <Option value="1" name="vertical_anchor_point" type="QString"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="93,201,99,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="Point"/>
          <prop k="outline_color" v="35,35,35,0"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="Point"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="size" type="Map">
                  <Option value="false" name="active" type="bool"/>
                  <Option value="var('map_scale')" name="expression" type="QString"/>
                  <Option name="transformer" type="Map">
                    <Option name="d" type="Map">
                      <Option name="curve" type="Map">
                        <Option value="0,0.12195121951219512,0.38211382113821141,0.76016260162601623,1" name="x" type="QString"/>
                        <Option value="0,0.19780219780219779,0.59340659340659341,0.79120879120879117,1" name="y" type="QString"/>
                      </Option>
                      <Option value="0.57" name="exponent" type="double"/>
                      <Option value="1" name="maxSize" type="double"/>
                      <Option value="100000" name="maxValue" type="double"/>
                      <Option value="10" name="minSize" type="double"/>
                      <Option value="1" name="minValue" type="double"/>
                      <Option value="0" name="nullSize" type="double"/>
                      <Option value="2" name="scaleType" type="int"/>
                    </Option>
                    <Option value="1" name="t" type="int"/>
                  </Option>
                  <Option value="3" name="type" type="int"/>
                </Option>
              </Option>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" alpha="1" clip_to_extent="1" name="6" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleMarker" locked="0" enabled="1" pass="0">
          <Option type="Map">
            <Option value="0" name="angle" type="QString"/>
            <Option value="square" name="cap_style" type="QString"/>
            <Option value="171,220,50,255" name="color" type="QString"/>
            <Option value="1" name="horizontal_anchor_point" type="QString"/>
            <Option value="bevel" name="joinstyle" type="QString"/>
            <Option value="circle" name="name" type="QString"/>
            <Option value="0,0" name="offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="Point" name="offset_unit" type="QString"/>
            <Option value="35,35,35,0" name="outline_color" type="QString"/>
            <Option value="solid" name="outline_style" type="QString"/>
            <Option value="0" name="outline_width" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
            <Option value="Point" name="outline_width_unit" type="QString"/>
            <Option value="diameter" name="scale_method" type="QString"/>
            <Option value="2.2" name="size" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
            <Option value="MM" name="size_unit" type="QString"/>
            <Option value="1" name="vertical_anchor_point" type="QString"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="171,220,50,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="Point"/>
          <prop k="outline_color" v="35,35,35,0"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="Point"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="2.2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="size" type="Map">
                  <Option value="false" name="active" type="bool"/>
                  <Option value="var('map_scale')" name="expression" type="QString"/>
                  <Option name="transformer" type="Map">
                    <Option name="d" type="Map">
                      <Option name="curve" type="Map">
                        <Option value="0,0.12195121951219512,0.38211382113821141,0.76016260162601623,1" name="x" type="QString"/>
                        <Option value="0,0.19780219780219779,0.59340659340659341,0.79120879120879117,1" name="y" type="QString"/>
                      </Option>
                      <Option value="0.57" name="exponent" type="double"/>
                      <Option value="1" name="maxSize" type="double"/>
                      <Option value="100000" name="maxValue" type="double"/>
                      <Option value="10" name="minSize" type="double"/>
                      <Option value="1" name="minValue" type="double"/>
                      <Option value="0" name="nullSize" type="double"/>
                      <Option value="2" name="scaleType" type="int"/>
                    </Option>
                    <Option value="1" name="t" type="int"/>
                  </Option>
                  <Option value="3" name="type" type="int"/>
                </Option>
              </Option>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" alpha="1" clip_to_extent="1" name="7" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" name="name" type="QString"/>
            <Option name="properties"/>
            <Option value="collection" name="type" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleMarker" locked="0" enabled="1" pass="0">
          <Option type="Map">
            <Option value="0" name="angle" type="QString"/>
            <Option value="square" name="cap_style" type="QString"/>
            <Option value="253,231,37,255" name="color" type="QString"/>
            <Option value="1" name="horizontal_anchor_point" type="QString"/>
            <Option value="bevel" name="joinstyle" type="QString"/>
            <Option value="circle" name="name" type="QString"/>
            <Option value="0,0" name="offset" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="offset_map_unit_scale" type="QString"/>
            <Option value="Point" name="offset_unit" type="QString"/>
            <Option value="35,35,35,0" name="outline_color" type="QString"/>
            <Option value="solid" name="outline_style" type="QString"/>
            <Option value="0" name="outline_width" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale" type="QString"/>
            <Option value="Point" name="outline_width_unit" type="QString"/>
            <Option value="diameter" name="scale_method" type="QString"/>
            <Option value="2.4" name="size" type="QString"/>
            <Option value="3x:0,0,0,0,0,0" name="size_map_unit_scale" type="QString"/>
            <Option value="MM" name="size_unit" type="QString"/>
            <Option value="1" name="vertical_anchor_point" type="QString"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="253,231,37,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="Point"/>
          <prop k="outline_color" v="35,35,35,0"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="Point"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="2.4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="size" type="Map">
                  <Option value="false" name="active" type="bool"/>
                  <Option value="var('map_scale')" name="expression" type="QString"/>
                  <Option name="transformer" type="Map">
                    <Option name="d" type="Map">
                      <Option name="curve" type="Map">
                        <Option value="0,0.12195121951219512,0.38211382113821141,0.76016260162601623,1" name="x" type="QString"/>
                        <Option value="0,0.19780219780219779,0.59340659340659341,0.79120879120879117,1" name="y" type="QString"/>
                      </Option>
                      <Option value="0.57" name="exponent" type="double"/>
                      <Option value="1" name="maxSize" type="double"/>
                      <Option value="100000" name="maxValue" type="double"/>
                      <Option value="10" name="minSize" type="double"/>
                      <Option value="1" name="minValue" type="double"/>
                      <Option value="0" name="nullSize" type="double"/>
                      <Option value="2" name="scaleType" type="int"/>
                    </Option>
                    <Option value="1" name="t" type="int"/>
                  </Option>
                  <Option value="3" name="type" type="int"/>
                </Option>
              </Option>
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
        <Option value="&quot;fid&quot;" type="QString"/>
      </Option>
      <Option value="0" name="embeddedWidgets/count" type="QString"/>
      <Option name="variableNames"/>
      <Option name="variableValues"/>
    </Option>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>0.6</layerOpacity>
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Histogram">
    <DiagramCategory maxScaleDenominator="1e+08" barWidth="5" spacingUnitScale="3x:0,0,0,0,0,0" labelPlacementMethod="XHeight" rotationOffset="270" spacing="5" width="15" backgroundAlpha="255" penColor="#000000" direction="0" enabled="0" height="15" sizeType="MM" penAlpha="255" sizeScale="3x:0,0,0,0,0,0" scaleDependency="Area" minScaleDenominator="0" opacity="1" diagramOrientation="Up" minimumSize="0" showAxis="1" backgroundColor="#ffffff" lineSizeType="MM" spacingUnit="MM" penWidth="0" lineSizeScale="3x:0,0,0,0,0,0" scaleBasedVisibility="0">
      <fontProperties description="MS Shell Dlg 2,8,-1,5,50,0,0,0,0,0" style=""/>
      <attribute label="" colorOpacity="1" color="#000000" field=""/>
      <axisSymbol>
        <symbol force_rhr="0" alpha="1" clip_to_extent="1" name="" type="line">
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
          <layer class="SimpleLine" locked="0" enabled="1" pass="0">
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
  <DiagramLayerSettings priority="0" obstacle="0" linePlacementFlags="18" placement="0" showAll="1" zIndex="0" dist="0">
    <properties>
      <Option type="Map">
        <Option value="" name="name" type="QString"/>
        <Option name="properties"/>
        <Option value="collection" name="type" type="QString"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
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
    <field configurationFlags="None" name="nhd_dgo_streamtype">
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
    <field configurationFlags="None" name="rme_igo_rel_flow_length">
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
    <field configurationFlags="None" name="epa_dgo_ecoregion3">
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
    <field configurationFlags="None" name="epa_dgo_ecoregion4">
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
    <field configurationFlags="None" name="rme_igo_trib_per_km">
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
  </fieldConfiguration>
  <aliases>
    <alias index="0" name="" field="fid"/>
    <alias index="1" name="" field="level_path"/>
    <alias index="2" name="" field="seg_distance"/>
    <alias index="3" name="" field="stream_size"/>
    <alias index="4" name="" field="rme_igo_prim_channel_gradient"/>
    <alias index="5" name="" field="rme_igo_valleybottom_gradient"/>
    <alias index="6" name="" field="nhd_dgo_streamorder"/>
    <alias index="7" name="" field="nhd_dgo_headwater"/>
    <alias index="8" name="" field="nhd_dgo_streamtype"/>
    <alias index="9" name="" field="vbet_dgo_lowlying_area"/>
    <alias index="10" name="" field="vbet_dgo_elevated_area"/>
    <alias index="11" name="" field="vbet_dgo_channel_area"/>
    <alias index="12" name="" field="vbet_dgo_floodplain_area"/>
    <alias index="13" name="" field="vbet_igo_integrated_width"/>
    <alias index="14" name="" field="vbet_igo_active_channel_ratio"/>
    <alias index="15" name="" field="vbet_igo_low_lying_ratio"/>
    <alias index="16" name="" field="vbet_igo_elevated_ratio"/>
    <alias index="17" name="" field="vbet_igo_floodplain_ratio"/>
    <alias index="18" name="" field="vbet_igo_acres_vb_per_mile"/>
    <alias index="19" name="" field="vbet_igo_hect_vb_per_km"/>
    <alias index="20" name="" field="rme_igo_rel_flow_length"/>
    <alias index="21" name="" field="vbet_dgo_streamsize"/>
    <alias index="22" name="" field="epa_dgo_ecoregion3"/>
    <alias index="23" name="" field="rme_dgo_confluences"/>
    <alias index="24" name="" field="rme_dgo_diffluences"/>
    <alias index="25" name="" field="rme_igo_planform_sinuosity"/>
    <alias index="26" name="" field="rme_dgo_drainage_area"/>
    <alias index="27" name="" field="epa_dgo_ecoregion4"/>
    <alias index="28" name="" field="conf_igo_confinement_ratio"/>
    <alias index="29" name="" field="conf_igo_constriction_ratio"/>
    <alias index="30" name="" field="conf_dgo_confining_margins"/>
    <alias index="31" name="" field="rme_igo_trib_per_km"/>
    <alias index="32" name="" field="anthro_igo_road_dens"/>
    <alias index="33" name="" field="anthro_igo_rail_dens"/>
    <alias index="34" name="" field="anthro_igo_land_use_intens"/>
    <alias index="35" name="" field="rcat_igo_fldpln_access"/>
    <alias index="36" name="" field="rme_dgo_ownership"/>
    <alias index="37" name="" field="rme_dgo_state"/>
    <alias index="38" name="" field="rme_dgo_county"/>
  </aliases>
  <defaults>
    <default applyOnUpdate="0" expression="" field="fid"/>
    <default applyOnUpdate="0" expression="" field="level_path"/>
    <default applyOnUpdate="0" expression="" field="seg_distance"/>
    <default applyOnUpdate="0" expression="" field="stream_size"/>
    <default applyOnUpdate="0" expression="" field="rme_igo_prim_channel_gradient"/>
    <default applyOnUpdate="0" expression="" field="rme_igo_valleybottom_gradient"/>
    <default applyOnUpdate="0" expression="" field="nhd_dgo_streamorder"/>
    <default applyOnUpdate="0" expression="" field="nhd_dgo_headwater"/>
    <default applyOnUpdate="0" expression="" field="nhd_dgo_streamtype"/>
    <default applyOnUpdate="0" expression="" field="vbet_dgo_lowlying_area"/>
    <default applyOnUpdate="0" expression="" field="vbet_dgo_elevated_area"/>
    <default applyOnUpdate="0" expression="" field="vbet_dgo_channel_area"/>
    <default applyOnUpdate="0" expression="" field="vbet_dgo_floodplain_area"/>
    <default applyOnUpdate="0" expression="" field="vbet_igo_integrated_width"/>
    <default applyOnUpdate="0" expression="" field="vbet_igo_active_channel_ratio"/>
    <default applyOnUpdate="0" expression="" field="vbet_igo_low_lying_ratio"/>
    <default applyOnUpdate="0" expression="" field="vbet_igo_elevated_ratio"/>
    <default applyOnUpdate="0" expression="" field="vbet_igo_floodplain_ratio"/>
    <default applyOnUpdate="0" expression="" field="vbet_igo_acres_vb_per_mile"/>
    <default applyOnUpdate="0" expression="" field="vbet_igo_hect_vb_per_km"/>
    <default applyOnUpdate="0" expression="" field="rme_igo_rel_flow_length"/>
    <default applyOnUpdate="0" expression="" field="vbet_dgo_streamsize"/>
    <default applyOnUpdate="0" expression="" field="epa_dgo_ecoregion3"/>
    <default applyOnUpdate="0" expression="" field="rme_dgo_confluences"/>
    <default applyOnUpdate="0" expression="" field="rme_dgo_diffluences"/>
    <default applyOnUpdate="0" expression="" field="rme_igo_planform_sinuosity"/>
    <default applyOnUpdate="0" expression="" field="rme_dgo_drainage_area"/>
    <default applyOnUpdate="0" expression="" field="epa_dgo_ecoregion4"/>
    <default applyOnUpdate="0" expression="" field="conf_igo_confinement_ratio"/>
    <default applyOnUpdate="0" expression="" field="conf_igo_constriction_ratio"/>
    <default applyOnUpdate="0" expression="" field="conf_dgo_confining_margins"/>
    <default applyOnUpdate="0" expression="" field="rme_igo_trib_per_km"/>
    <default applyOnUpdate="0" expression="" field="anthro_igo_road_dens"/>
    <default applyOnUpdate="0" expression="" field="anthro_igo_rail_dens"/>
    <default applyOnUpdate="0" expression="" field="anthro_igo_land_use_intens"/>
    <default applyOnUpdate="0" expression="" field="rcat_igo_fldpln_access"/>
    <default applyOnUpdate="0" expression="" field="rme_dgo_ownership"/>
    <default applyOnUpdate="0" expression="" field="rme_dgo_state"/>
    <default applyOnUpdate="0" expression="" field="rme_dgo_county"/>
  </defaults>
  <constraints>
    <constraint exp_strength="0" unique_strength="1" notnull_strength="1" constraints="3" field="fid"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="level_path"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="seg_distance"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="stream_size"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="rme_igo_prim_channel_gradient"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="rme_igo_valleybottom_gradient"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="nhd_dgo_streamorder"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="nhd_dgo_headwater"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="nhd_dgo_streamtype"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="vbet_dgo_lowlying_area"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="vbet_dgo_elevated_area"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="vbet_dgo_channel_area"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="vbet_dgo_floodplain_area"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="vbet_igo_integrated_width"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="vbet_igo_active_channel_ratio"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="vbet_igo_low_lying_ratio"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="vbet_igo_elevated_ratio"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="vbet_igo_floodplain_ratio"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="vbet_igo_acres_vb_per_mile"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="vbet_igo_hect_vb_per_km"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="rme_igo_rel_flow_length"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="vbet_dgo_streamsize"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="epa_dgo_ecoregion3"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="rme_dgo_confluences"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="rme_dgo_diffluences"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="rme_igo_planform_sinuosity"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="rme_dgo_drainage_area"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="epa_dgo_ecoregion4"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="conf_igo_confinement_ratio"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="conf_igo_constriction_ratio"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="conf_dgo_confining_margins"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="rme_igo_trib_per_km"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="anthro_igo_road_dens"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="anthro_igo_rail_dens"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="anthro_igo_land_use_intens"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="rcat_igo_fldpln_access"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="rme_dgo_ownership"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="rme_dgo_state"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0" field="rme_dgo_county"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" field="fid" desc=""/>
    <constraint exp="" field="level_path" desc=""/>
    <constraint exp="" field="seg_distance" desc=""/>
    <constraint exp="" field="stream_size" desc=""/>
    <constraint exp="" field="rme_igo_prim_channel_gradient" desc=""/>
    <constraint exp="" field="rme_igo_valleybottom_gradient" desc=""/>
    <constraint exp="" field="nhd_dgo_streamorder" desc=""/>
    <constraint exp="" field="nhd_dgo_headwater" desc=""/>
    <constraint exp="" field="nhd_dgo_streamtype" desc=""/>
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
    <constraint exp="" field="rme_igo_rel_flow_length" desc=""/>
    <constraint exp="" field="vbet_dgo_streamsize" desc=""/>
    <constraint exp="" field="epa_dgo_ecoregion3" desc=""/>
    <constraint exp="" field="rme_dgo_confluences" desc=""/>
    <constraint exp="" field="rme_dgo_diffluences" desc=""/>
    <constraint exp="" field="rme_igo_planform_sinuosity" desc=""/>
    <constraint exp="" field="rme_dgo_drainage_area" desc=""/>
    <constraint exp="" field="epa_dgo_ecoregion4" desc=""/>
    <constraint exp="" field="conf_igo_confinement_ratio" desc=""/>
    <constraint exp="" field="conf_igo_constriction_ratio" desc=""/>
    <constraint exp="" field="conf_dgo_confining_margins" desc=""/>
    <constraint exp="" field="rme_igo_trib_per_km" desc=""/>
    <constraint exp="" field="anthro_igo_road_dens" desc=""/>
    <constraint exp="" field="anthro_igo_rail_dens" desc=""/>
    <constraint exp="" field="anthro_igo_land_use_intens" desc=""/>
    <constraint exp="" field="rcat_igo_fldpln_access" desc=""/>
    <constraint exp="" field="rme_dgo_ownership" desc=""/>
    <constraint exp="" field="rme_dgo_state" desc=""/>
    <constraint exp="" field="rme_dgo_county" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="0" sortExpression="">
    <columns>
      <column width="-1" hidden="0" name="fid" type="field"/>
      <column width="-1" hidden="0" name="seg_distance" type="field"/>
      <column width="-1" hidden="0" name="stream_size" type="field"/>
      <column width="-1" hidden="0" name="level_path" type="field"/>
      <column width="-1" hidden="0" name="rme_igo_prim_channel_gradient" type="field"/>
      <column width="-1" hidden="0" name="rme_igo_valleybottom_gradient" type="field"/>
      <column width="-1" hidden="0" name="nhd_dgo_streamorder" type="field"/>
      <column width="-1" hidden="0" name="nhd_dgo_headwater" type="field"/>
      <column width="-1" hidden="0" name="nhd_dgo_streamtype" type="field"/>
      <column width="-1" hidden="0" name="vbet_dgo_lowlying_area" type="field"/>
      <column width="-1" hidden="0" name="vbet_dgo_elevated_area" type="field"/>
      <column width="-1" hidden="0" name="vbet_dgo_channel_area" type="field"/>
      <column width="-1" hidden="0" name="vbet_dgo_floodplain_area" type="field"/>
      <column width="-1" hidden="0" name="vbet_igo_integrated_width" type="field"/>
      <column width="-1" hidden="0" name="vbet_igo_active_channel_ratio" type="field"/>
      <column width="-1" hidden="0" name="vbet_igo_low_lying_ratio" type="field"/>
      <column width="-1" hidden="0" name="vbet_igo_elevated_ratio" type="field"/>
      <column width="-1" hidden="0" name="vbet_igo_floodplain_ratio" type="field"/>
      <column width="-1" hidden="0" name="vbet_igo_acres_vb_per_mile" type="field"/>
      <column width="-1" hidden="0" name="vbet_igo_hect_vb_per_km" type="field"/>
      <column width="-1" hidden="0" name="rme_igo_rel_flow_length" type="field"/>
      <column width="-1" hidden="0" name="vbet_dgo_streamsize" type="field"/>
      <column width="-1" hidden="0" name="epa_dgo_ecoregion3" type="field"/>
      <column width="-1" hidden="0" name="rme_dgo_confluences" type="field"/>
      <column width="-1" hidden="0" name="rme_dgo_diffluences" type="field"/>
      <column width="-1" hidden="0" name="rme_igo_planform_sinuosity" type="field"/>
      <column width="-1" hidden="0" name="rme_dgo_drainage_area" type="field"/>
      <column width="-1" hidden="0" name="epa_dgo_ecoregion4" type="field"/>
      <column width="-1" hidden="0" name="conf_igo_confinement_ratio" type="field"/>
      <column width="-1" hidden="0" name="conf_igo_constriction_ratio" type="field"/>
      <column width="-1" hidden="0" name="conf_dgo_confining_margins" type="field"/>
      <column width="-1" hidden="0" name="rme_igo_trib_per_km" type="field"/>
      <column width="-1" hidden="0" name="anthro_igo_road_dens" type="field"/>
      <column width="-1" hidden="0" name="anthro_igo_rail_dens" type="field"/>
      <column width="-1" hidden="0" name="anthro_igo_land_use_intens" type="field"/>
      <column width="-1" hidden="0" name="rcat_igo_fldpln_access" type="field"/>
      <column width="-1" hidden="0" name="rme_dgo_ownership" type="field"/>
      <column width="-1" hidden="0" name="rme_dgo_state" type="field"/>
      <column width="-1" hidden="0" name="rme_dgo_county" type="field"/>
      <column width="-1" hidden="1" type="actions"/>
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
    <field editable="1" name="LevelPathI"/>
    <field editable="1" name="active_acreage_per_mile"/>
    <field editable="1" name="active_channel_area"/>
    <field editable="1" name="active_channel_area_cl_len"/>
    <field editable="1" name="active_channel_area_prop"/>
    <field editable="1" name="active_channel_itgr_width"/>
    <field editable="1" name="active_channel_proportion"/>
    <field editable="1" name="active_floodplain_area"/>
    <field editable="1" name="active_floodplain_area_cl_len"/>
    <field editable="1" name="active_floodplain_area_prop"/>
    <field editable="1" name="active_floodplain_itgr_width"/>
    <field editable="1" name="active_floodplain_proportion"/>
    <field editable="1" name="active_hectares_per_km"/>
    <field editable="1" name="anthro_igo_land_use_intens"/>
    <field editable="1" name="anthro_igo_rail_dens"/>
    <field editable="1" name="anthro_igo_road_dens"/>
    <field editable="1" name="centerline_length"/>
    <field editable="1" name="conf_dgo_confining_margins"/>
    <field editable="1" name="conf_igo_confinement_ratio"/>
    <field editable="1" name="conf_igo_constriction_ratio"/>
    <field editable="1" name="epa_dgo_ecoregion3"/>
    <field editable="1" name="epa_dgo_ecoregion4"/>
    <field editable="1" name="fid"/>
    <field editable="1" name="floodplain_area"/>
    <field editable="1" name="floodplain_area_cl_len"/>
    <field editable="1" name="floodplain_area_prop"/>
    <field editable="1" name="floodplain_itgr_width"/>
    <field editable="1" name="floodplain_proportion"/>
    <field editable="1" name="inactive_acreage_per_mile"/>
    <field editable="1" name="inactive_floodplain_area"/>
    <field editable="1" name="inactive_floodplain_area_cl_len"/>
    <field editable="1" name="inactive_floodplain_area_prop"/>
    <field editable="1" name="inactive_floodplain_itgr_width"/>
    <field editable="1" name="inactive_floodplain_proportion"/>
    <field editable="1" name="inactive_hectares_per_km"/>
    <field editable="1" name="integrated_width"/>
    <field editable="1" name="level_path"/>
    <field editable="1" name="nhd_dgo_headwater"/>
    <field editable="1" name="nhd_dgo_streamorder"/>
    <field editable="1" name="nhd_dgo_streamtype"/>
    <field editable="1" name="rcat_igo_fldpln_access"/>
    <field editable="1" name="rme_dgo_confluences"/>
    <field editable="1" name="rme_dgo_county"/>
    <field editable="1" name="rme_dgo_diffluences"/>
    <field editable="1" name="rme_dgo_drainage_area"/>
    <field editable="1" name="rme_dgo_ownership"/>
    <field editable="1" name="rme_dgo_state"/>
    <field editable="1" name="rme_igo_planform_sinuosity"/>
    <field editable="1" name="rme_igo_prim_channel_gradient"/>
    <field editable="1" name="rme_igo_rel_flow_length"/>
    <field editable="1" name="rme_igo_trib_per_km"/>
    <field editable="1" name="rme_igo_valleybottom_gradient"/>
    <field editable="1" name="seg_distance"/>
    <field editable="1" name="stream_size"/>
    <field editable="1" name="vb_acreage_per_mile"/>
    <field editable="1" name="vb_hectares_per_km"/>
    <field editable="1" name="vbet_dgo_channel_area"/>
    <field editable="1" name="vbet_dgo_elevated_area"/>
    <field editable="1" name="vbet_dgo_floodplain_area"/>
    <field editable="1" name="vbet_dgo_lowlying_area"/>
    <field editable="1" name="vbet_dgo_streamsize"/>
    <field editable="1" name="vbet_igo_acres_vb_per_mile"/>
    <field editable="1" name="vbet_igo_active_channel_ratio"/>
    <field editable="1" name="vbet_igo_elevated_ratio"/>
    <field editable="1" name="vbet_igo_floodplain_ratio"/>
    <field editable="1" name="vbet_igo_hect_vb_per_km"/>
    <field editable="1" name="vbet_igo_integrated_width"/>
    <field editable="1" name="vbet_igo_low_lying_ratio"/>
    <field editable="1" name="window_area"/>
    <field editable="1" name="window_size"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="LevelPathI"/>
    <field labelOnTop="0" name="active_acreage_per_mile"/>
    <field labelOnTop="0" name="active_channel_area"/>
    <field labelOnTop="0" name="active_channel_area_cl_len"/>
    <field labelOnTop="0" name="active_channel_area_prop"/>
    <field labelOnTop="0" name="active_channel_itgr_width"/>
    <field labelOnTop="0" name="active_channel_proportion"/>
    <field labelOnTop="0" name="active_floodplain_area"/>
    <field labelOnTop="0" name="active_floodplain_area_cl_len"/>
    <field labelOnTop="0" name="active_floodplain_area_prop"/>
    <field labelOnTop="0" name="active_floodplain_itgr_width"/>
    <field labelOnTop="0" name="active_floodplain_proportion"/>
    <field labelOnTop="0" name="active_hectares_per_km"/>
    <field labelOnTop="0" name="anthro_igo_land_use_intens"/>
    <field labelOnTop="0" name="anthro_igo_rail_dens"/>
    <field labelOnTop="0" name="anthro_igo_road_dens"/>
    <field labelOnTop="0" name="centerline_length"/>
    <field labelOnTop="0" name="conf_dgo_confining_margins"/>
    <field labelOnTop="0" name="conf_igo_confinement_ratio"/>
    <field labelOnTop="0" name="conf_igo_constriction_ratio"/>
    <field labelOnTop="0" name="epa_dgo_ecoregion3"/>
    <field labelOnTop="0" name="epa_dgo_ecoregion4"/>
    <field labelOnTop="0" name="fid"/>
    <field labelOnTop="0" name="floodplain_area"/>
    <field labelOnTop="0" name="floodplain_area_cl_len"/>
    <field labelOnTop="0" name="floodplain_area_prop"/>
    <field labelOnTop="0" name="floodplain_itgr_width"/>
    <field labelOnTop="0" name="floodplain_proportion"/>
    <field labelOnTop="0" name="inactive_acreage_per_mile"/>
    <field labelOnTop="0" name="inactive_floodplain_area"/>
    <field labelOnTop="0" name="inactive_floodplain_area_cl_len"/>
    <field labelOnTop="0" name="inactive_floodplain_area_prop"/>
    <field labelOnTop="0" name="inactive_floodplain_itgr_width"/>
    <field labelOnTop="0" name="inactive_floodplain_proportion"/>
    <field labelOnTop="0" name="inactive_hectares_per_km"/>
    <field labelOnTop="0" name="integrated_width"/>
    <field labelOnTop="0" name="level_path"/>
    <field labelOnTop="0" name="nhd_dgo_headwater"/>
    <field labelOnTop="0" name="nhd_dgo_streamorder"/>
    <field labelOnTop="0" name="nhd_dgo_streamtype"/>
    <field labelOnTop="0" name="rcat_igo_fldpln_access"/>
    <field labelOnTop="0" name="rme_dgo_confluences"/>
    <field labelOnTop="0" name="rme_dgo_county"/>
    <field labelOnTop="0" name="rme_dgo_diffluences"/>
    <field labelOnTop="0" name="rme_dgo_drainage_area"/>
    <field labelOnTop="0" name="rme_dgo_ownership"/>
    <field labelOnTop="0" name="rme_dgo_state"/>
    <field labelOnTop="0" name="rme_igo_planform_sinuosity"/>
    <field labelOnTop="0" name="rme_igo_prim_channel_gradient"/>
    <field labelOnTop="0" name="rme_igo_rel_flow_length"/>
    <field labelOnTop="0" name="rme_igo_trib_per_km"/>
    <field labelOnTop="0" name="rme_igo_valleybottom_gradient"/>
    <field labelOnTop="0" name="seg_distance"/>
    <field labelOnTop="0" name="stream_size"/>
    <field labelOnTop="0" name="vb_acreage_per_mile"/>
    <field labelOnTop="0" name="vb_hectares_per_km"/>
    <field labelOnTop="0" name="vbet_dgo_channel_area"/>
    <field labelOnTop="0" name="vbet_dgo_elevated_area"/>
    <field labelOnTop="0" name="vbet_dgo_floodplain_area"/>
    <field labelOnTop="0" name="vbet_dgo_lowlying_area"/>
    <field labelOnTop="0" name="vbet_dgo_streamsize"/>
    <field labelOnTop="0" name="vbet_igo_acres_vb_per_mile"/>
    <field labelOnTop="0" name="vbet_igo_active_channel_ratio"/>
    <field labelOnTop="0" name="vbet_igo_elevated_ratio"/>
    <field labelOnTop="0" name="vbet_igo_floodplain_ratio"/>
    <field labelOnTop="0" name="vbet_igo_hect_vb_per_km"/>
    <field labelOnTop="0" name="vbet_igo_integrated_width"/>
    <field labelOnTop="0" name="vbet_igo_low_lying_ratio"/>
    <field labelOnTop="0" name="window_area"/>
    <field labelOnTop="0" name="window_size"/>
  </labelOnTop>
  <reuseLastValue>
    <field reuseLastValue="0" name="LevelPathI"/>
    <field reuseLastValue="0" name="active_acreage_per_mile"/>
    <field reuseLastValue="0" name="active_channel_area"/>
    <field reuseLastValue="0" name="active_channel_itgr_width"/>
    <field reuseLastValue="0" name="active_channel_proportion"/>
    <field reuseLastValue="0" name="active_floodplain_area"/>
    <field reuseLastValue="0" name="active_floodplain_itgr_width"/>
    <field reuseLastValue="0" name="active_floodplain_proportion"/>
    <field reuseLastValue="0" name="active_hectares_per_km"/>
    <field reuseLastValue="0" name="anthro_igo_land_use_intens"/>
    <field reuseLastValue="0" name="anthro_igo_rail_dens"/>
    <field reuseLastValue="0" name="anthro_igo_road_dens"/>
    <field reuseLastValue="0" name="centerline_length"/>
    <field reuseLastValue="0" name="conf_dgo_confining_margins"/>
    <field reuseLastValue="0" name="conf_igo_confinement_ratio"/>
    <field reuseLastValue="0" name="conf_igo_constriction_ratio"/>
    <field reuseLastValue="0" name="epa_dgo_ecoregion3"/>
    <field reuseLastValue="0" name="epa_dgo_ecoregion4"/>
    <field reuseLastValue="0" name="fid"/>
    <field reuseLastValue="0" name="floodplain_area"/>
    <field reuseLastValue="0" name="floodplain_itgr_width"/>
    <field reuseLastValue="0" name="floodplain_proportion"/>
    <field reuseLastValue="0" name="inactive_acreage_per_mile"/>
    <field reuseLastValue="0" name="inactive_floodplain_area"/>
    <field reuseLastValue="0" name="inactive_floodplain_itgr_width"/>
    <field reuseLastValue="0" name="inactive_floodplain_proportion"/>
    <field reuseLastValue="0" name="inactive_hectares_per_km"/>
    <field reuseLastValue="0" name="integrated_width"/>
    <field reuseLastValue="0" name="level_path"/>
    <field reuseLastValue="0" name="nhd_dgo_headwater"/>
    <field reuseLastValue="0" name="nhd_dgo_streamorder"/>
    <field reuseLastValue="0" name="nhd_dgo_streamtype"/>
    <field reuseLastValue="0" name="rcat_igo_fldpln_access"/>
    <field reuseLastValue="0" name="rme_dgo_confluences"/>
    <field reuseLastValue="0" name="rme_dgo_county"/>
    <field reuseLastValue="0" name="rme_dgo_diffluences"/>
    <field reuseLastValue="0" name="rme_dgo_drainage_area"/>
    <field reuseLastValue="0" name="rme_dgo_ownership"/>
    <field reuseLastValue="0" name="rme_dgo_state"/>
    <field reuseLastValue="0" name="rme_igo_planform_sinuosity"/>
    <field reuseLastValue="0" name="rme_igo_prim_channel_gradient"/>
    <field reuseLastValue="0" name="rme_igo_rel_flow_length"/>
    <field reuseLastValue="0" name="rme_igo_trib_per_km"/>
    <field reuseLastValue="0" name="rme_igo_valleybottom_gradient"/>
    <field reuseLastValue="0" name="seg_distance"/>
    <field reuseLastValue="0" name="stream_size"/>
    <field reuseLastValue="0" name="vb_acreage_per_mile"/>
    <field reuseLastValue="0" name="vb_hectares_per_km"/>
    <field reuseLastValue="0" name="vbet_dgo_channel_area"/>
    <field reuseLastValue="0" name="vbet_dgo_elevated_area"/>
    <field reuseLastValue="0" name="vbet_dgo_floodplain_area"/>
    <field reuseLastValue="0" name="vbet_dgo_lowlying_area"/>
    <field reuseLastValue="0" name="vbet_dgo_streamsize"/>
    <field reuseLastValue="0" name="vbet_igo_acres_vb_per_mile"/>
    <field reuseLastValue="0" name="vbet_igo_active_channel_ratio"/>
    <field reuseLastValue="0" name="vbet_igo_elevated_ratio"/>
    <field reuseLastValue="0" name="vbet_igo_floodplain_ratio"/>
    <field reuseLastValue="0" name="vbet_igo_hect_vb_per_km"/>
    <field reuseLastValue="0" name="vbet_igo_integrated_width"/>
    <field reuseLastValue="0" name="vbet_igo_low_lying_ratio"/>
    <field reuseLastValue="0" name="window_area"/>
    <field reuseLastValue="0" name="window_size"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"fid"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
