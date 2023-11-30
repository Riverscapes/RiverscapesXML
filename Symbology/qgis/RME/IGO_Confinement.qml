<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" simplifyDrawingHints="0" simplifyAlgorithm="0" symbologyReferenceScale="-1" styleCategories="AllStyleCategories" simplifyLocal="1" minScale="100000000" version="3.22.11-Białowieża" simplifyMaxScale="1" hasScaleBasedVisibilityFlag="0" readOnly="0" simplifyDrawingTol="1" labelsEnabled="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal endField="" durationField="" accumulate="0" limitMode="0" startField="" fixedDuration="0" startExpression="" enabled="0" endExpression="" durationUnit="min" mode="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <renderer-v2 forceraster="0" type="RuleRenderer" enableorderby="0" symbollevels="0" referencescale="-1">
    <rules key="{c4eb5f92-d094-42e3-a085-4101c9996f61}">
      <rule filter="&quot;conf_igo_confinement_ratio&quot; &lt;= 0.1" key="{31fb51f4-39eb-4343-bb8f-38609f8c78a7}" symbol="0" label="Unconfined (0 - 0.1)"/>
      <rule filter="&quot;conf_igo_confinement_ratio&quot; > 0.1 and &quot;conf_igo_confinement_ratio&quot; &lt;= 0.5" key="{0ecefb65-b53c-47fc-beaf-8fbfa90e1e9a}" symbol="1" label="Partly Confined - Planform Controlled (0.1 - 0.5)"/>
      <rule filter="&quot;conf_igo_confinement_ratio&quot; > 0.5 and &quot;conf_igo_confinement_ratio&quot; &lt;= 0.85" key="{2ca935b0-d620-4ace-8838-31b05bdc93fa}" symbol="2" label="Partly Confined - Bedrock Controlled (0.5 - 0.85)"/>
      <rule filter="&quot;conf_igo_confinement_ratio&quot; > 0.85" key="{97bc8e09-5b1a-4549-9c02-e9f3f199e5fd}" symbol="3" label="Confined (0.85 - 1)"/>
      <rule filter="ELSE" key="{ceaf52ac-ab9a-4267-868c-b6f5aaf4ef32}" symbol="4"/>
    </rules>
    <symbols>
      <symbol alpha="1" type="marker" clip_to_extent="1" name="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleMarker" pass="0" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="26,150,65,255" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="circle" name="name"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="35,35,35,0" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="0" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="diameter" name="scale_method"/>
            <Option type="QString" value="1.8" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="26,150,65,255"/>
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
          <prop k="size" v="1.8"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" type="marker" clip_to_extent="1" name="1" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleMarker" pass="0" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="166,217,106,255" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="circle" name="name"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="35,35,35,0" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="0" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="diameter" name="scale_method"/>
            <Option type="QString" value="1.6" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="166,217,106,255"/>
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
          <prop k="size" v="1.6"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" type="marker" clip_to_extent="1" name="2" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleMarker" pass="0" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="253,174,97,255" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="circle" name="name"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="35,35,35,0" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="0" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="diameter" name="scale_method"/>
            <Option type="QString" value="1.4" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="253,174,97,255"/>
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
          <prop k="size" v="1.4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" type="marker" clip_to_extent="1" name="3" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleMarker" pass="0" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="215,25,28,255" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="circle" name="name"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="35,35,35,0" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="0" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="diameter" name="scale_method"/>
            <Option type="QString" value="1.2" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="215,25,28,255"/>
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
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" type="marker" clip_to_extent="1" name="4" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleMarker" pass="0" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="130,130,130,255" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="circle" name="name"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="35,35,35,0" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="0" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="diameter" name="scale_method"/>
            <Option type="QString" value="1" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="130,130,130,255"/>
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
          <prop k="size" v="1"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
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
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Histogram">
    <DiagramCategory scaleDependency="Area" spacingUnit="MM" sizeType="MM" direction="0" spacing="5" showAxis="1" penAlpha="255" lineSizeScale="3x:0,0,0,0,0,0" rotationOffset="270" lineSizeType="MM" labelPlacementMethod="XHeight" penWidth="0" scaleBasedVisibility="0" minScaleDenominator="0" minimumSize="0" opacity="1" backgroundAlpha="255" enabled="0" penColor="#000000" height="15" maxScaleDenominator="1e+08" sizeScale="3x:0,0,0,0,0,0" width="15" spacingUnitScale="3x:0,0,0,0,0,0" diagramOrientation="Up" backgroundColor="#ffffff" barWidth="5">
      <fontProperties description="MS Shell Dlg 2,8.1,-1,5,50,0,0,0,0,0" style=""/>
      <axisSymbol>
        <symbol alpha="1" type="line" clip_to_extent="1" name="" force_rhr="0">
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <layer class="SimpleLine" pass="0" enabled="1" locked="0">
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
  <DiagramLayerSettings obstacle="0" priority="0" dist="0" linePlacementFlags="18" showAll="1" placement="0" zIndex="0">
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
    <default expression="" applyOnUpdate="0" field="fid"/>
    <default expression="" applyOnUpdate="0" field="level_path"/>
    <default expression="" applyOnUpdate="0" field="seg_distance"/>
    <default expression="" applyOnUpdate="0" field="stream_size"/>
    <default expression="" applyOnUpdate="0" field="rme_igo_prim_channel_gradient"/>
    <default expression="" applyOnUpdate="0" field="rme_igo_valleybottom_gradient"/>
    <default expression="" applyOnUpdate="0" field="nhd_dgo_streamorder"/>
    <default expression="" applyOnUpdate="0" field="nhd_dgo_headwater"/>
    <default expression="" applyOnUpdate="0" field="nhd_dgo_streamtype"/>
    <default expression="" applyOnUpdate="0" field="vbet_dgo_lowlying_area"/>
    <default expression="" applyOnUpdate="0" field="vbet_dgo_elevated_area"/>
    <default expression="" applyOnUpdate="0" field="vbet_dgo_channel_area"/>
    <default expression="" applyOnUpdate="0" field="vbet_dgo_floodplain_area"/>
    <default expression="" applyOnUpdate="0" field="vbet_igo_integrated_width"/>
    <default expression="" applyOnUpdate="0" field="vbet_igo_active_channel_ratio"/>
    <default expression="" applyOnUpdate="0" field="vbet_igo_low_lying_ratio"/>
    <default expression="" applyOnUpdate="0" field="vbet_igo_elevated_ratio"/>
    <default expression="" applyOnUpdate="0" field="vbet_igo_floodplain_ratio"/>
    <default expression="" applyOnUpdate="0" field="vbet_igo_acres_vb_per_mile"/>
    <default expression="" applyOnUpdate="0" field="vbet_igo_hect_vb_per_km"/>
    <default expression="" applyOnUpdate="0" field="rme_igo_rel_flow_length"/>
    <default expression="" applyOnUpdate="0" field="vbet_dgo_streamsize"/>
    <default expression="" applyOnUpdate="0" field="epa_dgo_ecoregion3"/>
    <default expression="" applyOnUpdate="0" field="rme_dgo_confluences"/>
    <default expression="" applyOnUpdate="0" field="rme_dgo_diffluences"/>
    <default expression="" applyOnUpdate="0" field="rme_igo_planform_sinuosity"/>
    <default expression="" applyOnUpdate="0" field="rme_dgo_drainage_area"/>
    <default expression="" applyOnUpdate="0" field="epa_dgo_ecoregion4"/>
    <default expression="" applyOnUpdate="0" field="conf_igo_confinement_ratio"/>
    <default expression="" applyOnUpdate="0" field="conf_igo_constriction_ratio"/>
    <default expression="" applyOnUpdate="0" field="conf_dgo_confining_margins"/>
    <default expression="" applyOnUpdate="0" field="rme_igo_trib_per_km"/>
    <default expression="" applyOnUpdate="0" field="anthro_igo_road_dens"/>
    <default expression="" applyOnUpdate="0" field="anthro_igo_rail_dens"/>
    <default expression="" applyOnUpdate="0" field="anthro_igo_land_use_intens"/>
    <default expression="" applyOnUpdate="0" field="rcat_igo_fldpln_access"/>
    <default expression="" applyOnUpdate="0" field="rme_dgo_ownership"/>
    <default expression="" applyOnUpdate="0" field="rme_dgo_state"/>
    <default expression="" applyOnUpdate="0" field="rme_dgo_county"/>
  </defaults>
  <constraints>
    <constraint exp_strength="0" unique_strength="1" constraints="3" notnull_strength="1" field="fid"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="level_path"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="seg_distance"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="stream_size"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="rme_igo_prim_channel_gradient"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="rme_igo_valleybottom_gradient"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="nhd_dgo_streamorder"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="nhd_dgo_headwater"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="nhd_dgo_streamtype"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="vbet_dgo_lowlying_area"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="vbet_dgo_elevated_area"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="vbet_dgo_channel_area"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="vbet_dgo_floodplain_area"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="vbet_igo_integrated_width"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="vbet_igo_active_channel_ratio"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="vbet_igo_low_lying_ratio"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="vbet_igo_elevated_ratio"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="vbet_igo_floodplain_ratio"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="vbet_igo_acres_vb_per_mile"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="vbet_igo_hect_vb_per_km"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="rme_igo_rel_flow_length"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="vbet_dgo_streamsize"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="epa_dgo_ecoregion3"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="rme_dgo_confluences"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="rme_dgo_diffluences"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="rme_igo_planform_sinuosity"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="rme_dgo_drainage_area"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="epa_dgo_ecoregion4"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="conf_igo_confinement_ratio"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="conf_igo_constriction_ratio"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="conf_dgo_confining_margins"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="rme_igo_trib_per_km"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="anthro_igo_road_dens"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="anthro_igo_rail_dens"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="anthro_igo_land_use_intens"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="rcat_igo_fldpln_access"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="rme_dgo_ownership"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="rme_dgo_state"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="rme_dgo_county"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" field="fid" exp=""/>
    <constraint desc="" field="level_path" exp=""/>
    <constraint desc="" field="seg_distance" exp=""/>
    <constraint desc="" field="stream_size" exp=""/>
    <constraint desc="" field="rme_igo_prim_channel_gradient" exp=""/>
    <constraint desc="" field="rme_igo_valleybottom_gradient" exp=""/>
    <constraint desc="" field="nhd_dgo_streamorder" exp=""/>
    <constraint desc="" field="nhd_dgo_headwater" exp=""/>
    <constraint desc="" field="nhd_dgo_streamtype" exp=""/>
    <constraint desc="" field="vbet_dgo_lowlying_area" exp=""/>
    <constraint desc="" field="vbet_dgo_elevated_area" exp=""/>
    <constraint desc="" field="vbet_dgo_channel_area" exp=""/>
    <constraint desc="" field="vbet_dgo_floodplain_area" exp=""/>
    <constraint desc="" field="vbet_igo_integrated_width" exp=""/>
    <constraint desc="" field="vbet_igo_active_channel_ratio" exp=""/>
    <constraint desc="" field="vbet_igo_low_lying_ratio" exp=""/>
    <constraint desc="" field="vbet_igo_elevated_ratio" exp=""/>
    <constraint desc="" field="vbet_igo_floodplain_ratio" exp=""/>
    <constraint desc="" field="vbet_igo_acres_vb_per_mile" exp=""/>
    <constraint desc="" field="vbet_igo_hect_vb_per_km" exp=""/>
    <constraint desc="" field="rme_igo_rel_flow_length" exp=""/>
    <constraint desc="" field="vbet_dgo_streamsize" exp=""/>
    <constraint desc="" field="epa_dgo_ecoregion3" exp=""/>
    <constraint desc="" field="rme_dgo_confluences" exp=""/>
    <constraint desc="" field="rme_dgo_diffluences" exp=""/>
    <constraint desc="" field="rme_igo_planform_sinuosity" exp=""/>
    <constraint desc="" field="rme_dgo_drainage_area" exp=""/>
    <constraint desc="" field="epa_dgo_ecoregion4" exp=""/>
    <constraint desc="" field="conf_igo_confinement_ratio" exp=""/>
    <constraint desc="" field="conf_igo_constriction_ratio" exp=""/>
    <constraint desc="" field="conf_dgo_confining_margins" exp=""/>
    <constraint desc="" field="rme_igo_trib_per_km" exp=""/>
    <constraint desc="" field="anthro_igo_road_dens" exp=""/>
    <constraint desc="" field="anthro_igo_rail_dens" exp=""/>
    <constraint desc="" field="anthro_igo_land_use_intens" exp=""/>
    <constraint desc="" field="rcat_igo_fldpln_access" exp=""/>
    <constraint desc="" field="rme_dgo_ownership" exp=""/>
    <constraint desc="" field="rme_dgo_state" exp=""/>
    <constraint desc="" field="rme_dgo_county" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortExpression="" sortOrder="0" actionWidgetStyle="dropDown">
    <columns>
      <column width="-1" type="field" name="fid" hidden="0"/>
      <column width="-1" type="field" name="level_path" hidden="0"/>
      <column width="-1" type="field" name="seg_distance" hidden="0"/>
      <column width="-1" type="field" name="stream_size" hidden="0"/>
      <column width="-1" type="field" name="rme_igo_prim_channel_gradient" hidden="0"/>
      <column width="-1" type="field" name="rme_igo_valleybottom_gradient" hidden="0"/>
      <column width="-1" type="field" name="nhd_dgo_streamorder" hidden="0"/>
      <column width="-1" type="field" name="nhd_dgo_headwater" hidden="0"/>
      <column width="-1" type="field" name="nhd_dgo_streamtype" hidden="0"/>
      <column width="-1" type="field" name="vbet_dgo_lowlying_area" hidden="0"/>
      <column width="-1" type="field" name="vbet_dgo_elevated_area" hidden="0"/>
      <column width="-1" type="field" name="vbet_dgo_channel_area" hidden="0"/>
      <column width="-1" type="field" name="vbet_dgo_floodplain_area" hidden="0"/>
      <column width="-1" type="field" name="vbet_igo_integrated_width" hidden="0"/>
      <column width="-1" type="field" name="vbet_igo_active_channel_ratio" hidden="0"/>
      <column width="-1" type="field" name="vbet_igo_low_lying_ratio" hidden="0"/>
      <column width="-1" type="field" name="vbet_igo_elevated_ratio" hidden="0"/>
      <column width="-1" type="field" name="vbet_igo_floodplain_ratio" hidden="0"/>
      <column width="-1" type="field" name="vbet_igo_acres_vb_per_mile" hidden="0"/>
      <column width="-1" type="field" name="vbet_igo_hect_vb_per_km" hidden="0"/>
      <column width="-1" type="field" name="rme_igo_rel_flow_length" hidden="0"/>
      <column width="-1" type="field" name="vbet_dgo_streamsize" hidden="0"/>
      <column width="-1" type="field" name="epa_dgo_ecoregion3" hidden="0"/>
      <column width="-1" type="field" name="rme_dgo_confluences" hidden="0"/>
      <column width="-1" type="field" name="rme_dgo_diffluences" hidden="0"/>
      <column width="-1" type="field" name="rme_igo_planform_sinuosity" hidden="0"/>
      <column width="-1" type="field" name="rme_dgo_drainage_area" hidden="0"/>
      <column width="-1" type="field" name="epa_dgo_ecoregion4" hidden="0"/>
      <column width="-1" type="field" name="conf_igo_confinement_ratio" hidden="0"/>
      <column width="-1" type="field" name="conf_igo_constriction_ratio" hidden="0"/>
      <column width="-1" type="field" name="conf_dgo_confining_margins" hidden="0"/>
      <column width="-1" type="field" name="rme_igo_trib_per_km" hidden="0"/>
      <column width="-1" type="field" name="anthro_igo_road_dens" hidden="0"/>
      <column width="-1" type="field" name="anthro_igo_rail_dens" hidden="0"/>
      <column width="-1" type="field" name="anthro_igo_land_use_intens" hidden="0"/>
      <column width="-1" type="field" name="rcat_igo_fldpln_access" hidden="0"/>
      <column width="-1" type="field" name="rme_dgo_ownership" hidden="0"/>
      <column width="-1" type="field" name="rme_dgo_state" hidden="0"/>
      <column width="-1" type="field" name="rme_dgo_county" hidden="0"/>
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
    <field editable="1" name="anthro_igo_land_use_intens"/>
    <field editable="1" name="anthro_igo_rail_dens"/>
    <field editable="1" name="anthro_igo_road_dens"/>
    <field editable="1" name="conf_dgo_confining_margins"/>
    <field editable="1" name="conf_igo_confinement_ratio"/>
    <field editable="1" name="conf_igo_constriction_ratio"/>
    <field editable="1" name="epa_dgo_ecoregion3"/>
    <field editable="1" name="epa_dgo_ecoregion4"/>
    <field editable="1" name="fid"/>
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
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="anthro_igo_land_use_intens"/>
    <field labelOnTop="0" name="anthro_igo_rail_dens"/>
    <field labelOnTop="0" name="anthro_igo_road_dens"/>
    <field labelOnTop="0" name="conf_dgo_confining_margins"/>
    <field labelOnTop="0" name="conf_igo_confinement_ratio"/>
    <field labelOnTop="0" name="conf_igo_constriction_ratio"/>
    <field labelOnTop="0" name="epa_dgo_ecoregion3"/>
    <field labelOnTop="0" name="epa_dgo_ecoregion4"/>
    <field labelOnTop="0" name="fid"/>
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
  </labelOnTop>
  <reuseLastValue>
    <field reuseLastValue="0" name="anthro_igo_land_use_intens"/>
    <field reuseLastValue="0" name="anthro_igo_rail_dens"/>
    <field reuseLastValue="0" name="anthro_igo_road_dens"/>
    <field reuseLastValue="0" name="conf_dgo_confining_margins"/>
    <field reuseLastValue="0" name="conf_igo_confinement_ratio"/>
    <field reuseLastValue="0" name="conf_igo_constriction_ratio"/>
    <field reuseLastValue="0" name="epa_dgo_ecoregion3"/>
    <field reuseLastValue="0" name="epa_dgo_ecoregion4"/>
    <field reuseLastValue="0" name="fid"/>
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
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"anthro_igo_road_dens"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
