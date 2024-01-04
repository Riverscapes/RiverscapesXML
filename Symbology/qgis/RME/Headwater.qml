<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyDrawingHints="0" symbologyReferenceScale="-1" labelsEnabled="0" simplifyLocal="1" simplifyDrawingTol="1" version="3.22.11-Białowieża" styleCategories="AllStyleCategories" minScale="100000000" simplifyMaxScale="1" maxScale="0" hasScaleBasedVisibilityFlag="0" simplifyAlgorithm="0" readOnly="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal mode="0" startField="" limitMode="0" fixedDuration="0" durationUnit="min" startExpression="" endExpression="" durationField="" endField="" enabled="0" accumulate="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <renderer-v2 type="RuleRenderer" forceraster="0" enableorderby="0" referencescale="-1" symbollevels="0">
    <rules key="{4ea1550e-af07-4458-915f-cc669128af15}">
      <rule label="IS a headwater" filter="&quot;nhd_dgo_headwater&quot; = 1" key="{ea17936f-b0f7-4d85-a546-1fdee355d53c}" symbol="0"/>
      <rule label="Is NOT a headwater" filter="&quot;nhd_dgo_headwater&quot; = 0" key="{b5f38608-76f3-49ce-a049-4aad8cd8061c}" symbol="1"/>
    </rules>
    <symbols>
      <symbol name="0" type="marker" force_rhr="0" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" type="QString" value=""/>
            <Option name="properties"/>
            <Option name="type" type="QString" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleMarker" locked="0" enabled="1" pass="0">
          <Option type="Map">
            <Option name="angle" type="QString" value="0"/>
            <Option name="cap_style" type="QString" value="square"/>
            <Option name="color" type="QString" value="31,120,180,255"/>
            <Option name="horizontal_anchor_point" type="QString" value="1"/>
            <Option name="joinstyle" type="QString" value="bevel"/>
            <Option name="name" type="QString" value="circle"/>
            <Option name="offset" type="QString" value="0,0"/>
            <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="offset_unit" type="QString" value="MM"/>
            <Option name="outline_color" type="QString" value="35,35,35,0"/>
            <Option name="outline_style" type="QString" value="solid"/>
            <Option name="outline_width" type="QString" value="0"/>
            <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="outline_width_unit" type="QString" value="MM"/>
            <Option name="scale_method" type="QString" value="diameter"/>
            <Option name="size" type="QString" value="2"/>
            <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="size_unit" type="QString" value="MM"/>
            <Option name="vertical_anchor_point" type="QString" value="1"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="31,120,180,255"/>
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
          <prop k="size" v="2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="1" type="marker" force_rhr="0" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" type="QString" value=""/>
            <Option name="properties"/>
            <Option name="type" type="QString" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleMarker" locked="0" enabled="1" pass="0">
          <Option type="Map">
            <Option name="angle" type="QString" value="0"/>
            <Option name="cap_style" type="QString" value="square"/>
            <Option name="color" type="QString" value="0,0,0,37"/>
            <Option name="horizontal_anchor_point" type="QString" value="1"/>
            <Option name="joinstyle" type="QString" value="bevel"/>
            <Option name="name" type="QString" value="circle"/>
            <Option name="offset" type="QString" value="0,0"/>
            <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="offset_unit" type="QString" value="MM"/>
            <Option name="outline_color" type="QString" value="35,35,35,0"/>
            <Option name="outline_style" type="QString" value="solid"/>
            <Option name="outline_width" type="QString" value="0"/>
            <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="outline_width_unit" type="QString" value="MM"/>
            <Option name="scale_method" type="QString" value="diameter"/>
            <Option name="size" type="QString" value="2"/>
            <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="size_unit" type="QString" value="MM"/>
            <Option name="vertical_anchor_point" type="QString" value="1"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="0,0,0,37"/>
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
          <prop k="size" v="2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <customproperties>
    <Option type="Map">
      <Option name="dualview/previewExpressions" type="List">
        <Option type="QString" value="&quot;level_path&quot;"/>
      </Option>
      <Option name="embeddedWidgets/count" type="int" value="0"/>
      <Option name="variableNames"/>
      <Option name="variableValues"/>
    </Option>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory spacingUnitScale="3x:0,0,0,0,0,0" backgroundAlpha="255" opacity="1" labelPlacementMethod="XHeight" direction="0" width="15" sizeScale="3x:0,0,0,0,0,0" lineSizeScale="3x:0,0,0,0,0,0" maxScaleDenominator="1e+08" height="15" penAlpha="255" penColor="#000000" scaleDependency="Area" diagramOrientation="Up" minimumSize="0" rotationOffset="270" minScaleDenominator="0" barWidth="5" showAxis="1" lineSizeType="MM" enabled="0" sizeType="MM" spacing="5" spacingUnit="MM" backgroundColor="#ffffff" scaleBasedVisibility="0" penWidth="0">
      <fontProperties description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0" style=""/>
      <attribute label="" field="" color="#000000" colorOpacity="1"/>
      <axisSymbol>
        <symbol name="" type="line" force_rhr="0" alpha="1" clip_to_extent="1">
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
          <layer class="SimpleLine" locked="0" enabled="1" pass="0">
            <Option type="Map">
              <Option name="align_dash_pattern" type="QString" value="0"/>
              <Option name="capstyle" type="QString" value="square"/>
              <Option name="customdash" type="QString" value="5;2"/>
              <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
              <Option name="customdash_unit" type="QString" value="MM"/>
              <Option name="dash_pattern_offset" type="QString" value="0"/>
              <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
              <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
              <Option name="draw_inside_polygon" type="QString" value="0"/>
              <Option name="joinstyle" type="QString" value="bevel"/>
              <Option name="line_color" type="QString" value="35,35,35,255"/>
              <Option name="line_style" type="QString" value="solid"/>
              <Option name="line_width" type="QString" value="0.26"/>
              <Option name="line_width_unit" type="QString" value="MM"/>
              <Option name="offset" type="QString" value="0"/>
              <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
              <Option name="offset_unit" type="QString" value="MM"/>
              <Option name="ring_filter" type="QString" value="0"/>
              <Option name="trim_distance_end" type="QString" value="0"/>
              <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
              <Option name="trim_distance_end_unit" type="QString" value="MM"/>
              <Option name="trim_distance_start" type="QString" value="0"/>
              <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
              <Option name="trim_distance_start_unit" type="QString" value="MM"/>
              <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
              <Option name="use_custom_dash" type="QString" value="0"/>
              <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
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
                <Option name="name" type="QString" value=""/>
                <Option name="properties"/>
                <Option name="type" type="QString" value="collection"/>
              </Option>
            </data_defined_properties>
          </layer>
        </symbol>
      </axisSymbol>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings dist="0" obstacle="0" zIndex="0" priority="0" showAll="1" linePlacementFlags="18" placement="0">
    <properties>
      <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
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
    <field name="fid" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="level_path" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="seg_distance" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="stream_size" configurationFlags="None">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="rme_igo_prim_channel_gradient" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="rme_igo_valleybottom_gradient" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="nhd_dgo_streamorder" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="nhd_dgo_headwater" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="nhd_dgo_streamtype" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="vbet_dgo_lowlying_area" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="vbet_dgo_elevated_area" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="vbet_dgo_channel_area" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="vbet_dgo_floodplain_area" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="vbet_igo_integrated_width" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="vbet_igo_active_channel_ratio" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="vbet_igo_low_lying_ratio" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="vbet_igo_elevated_ratio" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="vbet_igo_floodplain_ratio" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="vbet_igo_acres_vb_per_mile" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="vbet_igo_hect_vb_per_km" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="rme_igo_rel_flow_length" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="vbet_dgo_streamsize" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="epa_dgo_ecoregion3" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="rme_dgo_confluences" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="rme_dgo_diffluences" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="rme_igo_planform_sinuosity" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="rme_dgo_drainage_area" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="epa_dgo_ecoregion4" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="conf_igo_confinement_ratio" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="conf_igo_constriction_ratio" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="conf_dgo_confining_margins" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="rme_igo_trib_per_km" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="anthro_igo_road_dens" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="anthro_igo_rail_dens" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="anthro_igo_land_use_intens" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="rcat_igo_fldpln_access" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="rme_dgo_ownership" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="rme_dgo_state" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="rme_dgo_county" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" field="fid" index="0"/>
    <alias name="" field="level_path" index="1"/>
    <alias name="" field="seg_distance" index="2"/>
    <alias name="" field="stream_size" index="3"/>
    <alias name="" field="rme_igo_prim_channel_gradient" index="4"/>
    <alias name="" field="rme_igo_valleybottom_gradient" index="5"/>
    <alias name="" field="nhd_dgo_streamorder" index="6"/>
    <alias name="" field="nhd_dgo_headwater" index="7"/>
    <alias name="" field="nhd_dgo_streamtype" index="8"/>
    <alias name="" field="vbet_dgo_lowlying_area" index="9"/>
    <alias name="" field="vbet_dgo_elevated_area" index="10"/>
    <alias name="" field="vbet_dgo_channel_area" index="11"/>
    <alias name="" field="vbet_dgo_floodplain_area" index="12"/>
    <alias name="" field="vbet_igo_integrated_width" index="13"/>
    <alias name="" field="vbet_igo_active_channel_ratio" index="14"/>
    <alias name="" field="vbet_igo_low_lying_ratio" index="15"/>
    <alias name="" field="vbet_igo_elevated_ratio" index="16"/>
    <alias name="" field="vbet_igo_floodplain_ratio" index="17"/>
    <alias name="" field="vbet_igo_acres_vb_per_mile" index="18"/>
    <alias name="" field="vbet_igo_hect_vb_per_km" index="19"/>
    <alias name="" field="rme_igo_rel_flow_length" index="20"/>
    <alias name="" field="vbet_dgo_streamsize" index="21"/>
    <alias name="" field="epa_dgo_ecoregion3" index="22"/>
    <alias name="" field="rme_dgo_confluences" index="23"/>
    <alias name="" field="rme_dgo_diffluences" index="24"/>
    <alias name="" field="rme_igo_planform_sinuosity" index="25"/>
    <alias name="" field="rme_dgo_drainage_area" index="26"/>
    <alias name="" field="epa_dgo_ecoregion4" index="27"/>
    <alias name="" field="conf_igo_confinement_ratio" index="28"/>
    <alias name="" field="conf_igo_constriction_ratio" index="29"/>
    <alias name="" field="conf_dgo_confining_margins" index="30"/>
    <alias name="" field="rme_igo_trib_per_km" index="31"/>
    <alias name="" field="anthro_igo_road_dens" index="32"/>
    <alias name="" field="anthro_igo_rail_dens" index="33"/>
    <alias name="" field="anthro_igo_land_use_intens" index="34"/>
    <alias name="" field="rcat_igo_fldpln_access" index="35"/>
    <alias name="" field="rme_dgo_ownership" index="36"/>
    <alias name="" field="rme_dgo_state" index="37"/>
    <alias name="" field="rme_dgo_county" index="38"/>
  </aliases>
  <defaults>
    <default field="fid" expression="" applyOnUpdate="0"/>
    <default field="level_path" expression="" applyOnUpdate="0"/>
    <default field="seg_distance" expression="" applyOnUpdate="0"/>
    <default field="stream_size" expression="" applyOnUpdate="0"/>
    <default field="rme_igo_prim_channel_gradient" expression="" applyOnUpdate="0"/>
    <default field="rme_igo_valleybottom_gradient" expression="" applyOnUpdate="0"/>
    <default field="nhd_dgo_streamorder" expression="" applyOnUpdate="0"/>
    <default field="nhd_dgo_headwater" expression="" applyOnUpdate="0"/>
    <default field="nhd_dgo_streamtype" expression="" applyOnUpdate="0"/>
    <default field="vbet_dgo_lowlying_area" expression="" applyOnUpdate="0"/>
    <default field="vbet_dgo_elevated_area" expression="" applyOnUpdate="0"/>
    <default field="vbet_dgo_channel_area" expression="" applyOnUpdate="0"/>
    <default field="vbet_dgo_floodplain_area" expression="" applyOnUpdate="0"/>
    <default field="vbet_igo_integrated_width" expression="" applyOnUpdate="0"/>
    <default field="vbet_igo_active_channel_ratio" expression="" applyOnUpdate="0"/>
    <default field="vbet_igo_low_lying_ratio" expression="" applyOnUpdate="0"/>
    <default field="vbet_igo_elevated_ratio" expression="" applyOnUpdate="0"/>
    <default field="vbet_igo_floodplain_ratio" expression="" applyOnUpdate="0"/>
    <default field="vbet_igo_acres_vb_per_mile" expression="" applyOnUpdate="0"/>
    <default field="vbet_igo_hect_vb_per_km" expression="" applyOnUpdate="0"/>
    <default field="rme_igo_rel_flow_length" expression="" applyOnUpdate="0"/>
    <default field="vbet_dgo_streamsize" expression="" applyOnUpdate="0"/>
    <default field="epa_dgo_ecoregion3" expression="" applyOnUpdate="0"/>
    <default field="rme_dgo_confluences" expression="" applyOnUpdate="0"/>
    <default field="rme_dgo_diffluences" expression="" applyOnUpdate="0"/>
    <default field="rme_igo_planform_sinuosity" expression="" applyOnUpdate="0"/>
    <default field="rme_dgo_drainage_area" expression="" applyOnUpdate="0"/>
    <default field="epa_dgo_ecoregion4" expression="" applyOnUpdate="0"/>
    <default field="conf_igo_confinement_ratio" expression="" applyOnUpdate="0"/>
    <default field="conf_igo_constriction_ratio" expression="" applyOnUpdate="0"/>
    <default field="conf_dgo_confining_margins" expression="" applyOnUpdate="0"/>
    <default field="rme_igo_trib_per_km" expression="" applyOnUpdate="0"/>
    <default field="anthro_igo_road_dens" expression="" applyOnUpdate="0"/>
    <default field="anthro_igo_rail_dens" expression="" applyOnUpdate="0"/>
    <default field="anthro_igo_land_use_intens" expression="" applyOnUpdate="0"/>
    <default field="rcat_igo_fldpln_access" expression="" applyOnUpdate="0"/>
    <default field="rme_dgo_ownership" expression="" applyOnUpdate="0"/>
    <default field="rme_dgo_state" expression="" applyOnUpdate="0"/>
    <default field="rme_dgo_county" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint constraints="3" field="fid" notnull_strength="1" unique_strength="1" exp_strength="0"/>
    <constraint constraints="0" field="level_path" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="seg_distance" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="stream_size" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="rme_igo_prim_channel_gradient" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="rme_igo_valleybottom_gradient" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="nhd_dgo_streamorder" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="nhd_dgo_headwater" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="nhd_dgo_streamtype" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="vbet_dgo_lowlying_area" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="vbet_dgo_elevated_area" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="vbet_dgo_channel_area" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="vbet_dgo_floodplain_area" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="vbet_igo_integrated_width" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="vbet_igo_active_channel_ratio" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="vbet_igo_low_lying_ratio" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="vbet_igo_elevated_ratio" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="vbet_igo_floodplain_ratio" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="vbet_igo_acres_vb_per_mile" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="vbet_igo_hect_vb_per_km" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="rme_igo_rel_flow_length" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="vbet_dgo_streamsize" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="epa_dgo_ecoregion3" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="rme_dgo_confluences" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="rme_dgo_diffluences" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="rme_igo_planform_sinuosity" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="rme_dgo_drainage_area" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="epa_dgo_ecoregion4" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="conf_igo_confinement_ratio" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="conf_igo_constriction_ratio" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="conf_dgo_confining_margins" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="rme_igo_trib_per_km" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="anthro_igo_road_dens" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="anthro_igo_rail_dens" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="anthro_igo_land_use_intens" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="rcat_igo_fldpln_access" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="rme_dgo_ownership" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="rme_dgo_state" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="rme_dgo_county" notnull_strength="0" unique_strength="0" exp_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" exp="" field="fid"/>
    <constraint desc="" exp="" field="level_path"/>
    <constraint desc="" exp="" field="seg_distance"/>
    <constraint desc="" exp="" field="stream_size"/>
    <constraint desc="" exp="" field="rme_igo_prim_channel_gradient"/>
    <constraint desc="" exp="" field="rme_igo_valleybottom_gradient"/>
    <constraint desc="" exp="" field="nhd_dgo_streamorder"/>
    <constraint desc="" exp="" field="nhd_dgo_headwater"/>
    <constraint desc="" exp="" field="nhd_dgo_streamtype"/>
    <constraint desc="" exp="" field="vbet_dgo_lowlying_area"/>
    <constraint desc="" exp="" field="vbet_dgo_elevated_area"/>
    <constraint desc="" exp="" field="vbet_dgo_channel_area"/>
    <constraint desc="" exp="" field="vbet_dgo_floodplain_area"/>
    <constraint desc="" exp="" field="vbet_igo_integrated_width"/>
    <constraint desc="" exp="" field="vbet_igo_active_channel_ratio"/>
    <constraint desc="" exp="" field="vbet_igo_low_lying_ratio"/>
    <constraint desc="" exp="" field="vbet_igo_elevated_ratio"/>
    <constraint desc="" exp="" field="vbet_igo_floodplain_ratio"/>
    <constraint desc="" exp="" field="vbet_igo_acres_vb_per_mile"/>
    <constraint desc="" exp="" field="vbet_igo_hect_vb_per_km"/>
    <constraint desc="" exp="" field="rme_igo_rel_flow_length"/>
    <constraint desc="" exp="" field="vbet_dgo_streamsize"/>
    <constraint desc="" exp="" field="epa_dgo_ecoregion3"/>
    <constraint desc="" exp="" field="rme_dgo_confluences"/>
    <constraint desc="" exp="" field="rme_dgo_diffluences"/>
    <constraint desc="" exp="" field="rme_igo_planform_sinuosity"/>
    <constraint desc="" exp="" field="rme_dgo_drainage_area"/>
    <constraint desc="" exp="" field="epa_dgo_ecoregion4"/>
    <constraint desc="" exp="" field="conf_igo_confinement_ratio"/>
    <constraint desc="" exp="" field="conf_igo_constriction_ratio"/>
    <constraint desc="" exp="" field="conf_dgo_confining_margins"/>
    <constraint desc="" exp="" field="rme_igo_trib_per_km"/>
    <constraint desc="" exp="" field="anthro_igo_road_dens"/>
    <constraint desc="" exp="" field="anthro_igo_rail_dens"/>
    <constraint desc="" exp="" field="anthro_igo_land_use_intens"/>
    <constraint desc="" exp="" field="rcat_igo_fldpln_access"/>
    <constraint desc="" exp="" field="rme_dgo_ownership"/>
    <constraint desc="" exp="" field="rme_dgo_state"/>
    <constraint desc="" exp="" field="rme_dgo_county"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortExpression="" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column name="fid" type="field" width="-1" hidden="0"/>
      <column name="level_path" type="field" width="-1" hidden="0"/>
      <column name="seg_distance" type="field" width="-1" hidden="0"/>
      <column name="stream_size" type="field" width="-1" hidden="0"/>
      <column name="rme_igo_prim_channel_gradient" type="field" width="-1" hidden="0"/>
      <column name="rme_igo_valleybottom_gradient" type="field" width="-1" hidden="0"/>
      <column name="nhd_dgo_streamorder" type="field" width="-1" hidden="0"/>
      <column name="nhd_dgo_headwater" type="field" width="-1" hidden="0"/>
      <column name="nhd_dgo_streamtype" type="field" width="-1" hidden="0"/>
      <column name="vbet_dgo_lowlying_area" type="field" width="-1" hidden="0"/>
      <column name="vbet_dgo_elevated_area" type="field" width="-1" hidden="0"/>
      <column name="vbet_dgo_channel_area" type="field" width="-1" hidden="0"/>
      <column name="vbet_dgo_floodplain_area" type="field" width="-1" hidden="0"/>
      <column name="vbet_igo_integrated_width" type="field" width="-1" hidden="0"/>
      <column name="vbet_igo_active_channel_ratio" type="field" width="-1" hidden="0"/>
      <column name="vbet_igo_low_lying_ratio" type="field" width="-1" hidden="0"/>
      <column name="vbet_igo_elevated_ratio" type="field" width="-1" hidden="0"/>
      <column name="vbet_igo_floodplain_ratio" type="field" width="-1" hidden="0"/>
      <column name="vbet_igo_acres_vb_per_mile" type="field" width="-1" hidden="0"/>
      <column name="vbet_igo_hect_vb_per_km" type="field" width="-1" hidden="0"/>
      <column name="rme_igo_rel_flow_length" type="field" width="-1" hidden="0"/>
      <column name="vbet_dgo_streamsize" type="field" width="-1" hidden="0"/>
      <column name="epa_dgo_ecoregion3" type="field" width="-1" hidden="0"/>
      <column name="rme_dgo_confluences" type="field" width="-1" hidden="0"/>
      <column name="rme_dgo_diffluences" type="field" width="-1" hidden="0"/>
      <column name="rme_igo_planform_sinuosity" type="field" width="-1" hidden="0"/>
      <column name="rme_dgo_drainage_area" type="field" width="-1" hidden="0"/>
      <column name="epa_dgo_ecoregion4" type="field" width="-1" hidden="0"/>
      <column name="conf_igo_confinement_ratio" type="field" width="-1" hidden="0"/>
      <column name="conf_igo_constriction_ratio" type="field" width="-1" hidden="0"/>
      <column name="conf_dgo_confining_margins" type="field" width="-1" hidden="0"/>
      <column name="rme_igo_trib_per_km" type="field" width="-1" hidden="0"/>
      <column name="anthro_igo_road_dens" type="field" width="-1" hidden="0"/>
      <column name="anthro_igo_rail_dens" type="field" width="-1" hidden="0"/>
      <column name="anthro_igo_land_use_intens" type="field" width="-1" hidden="0"/>
      <column name="rcat_igo_fldpln_access" type="field" width="-1" hidden="0"/>
      <column name="rme_dgo_ownership" type="field" width="-1" hidden="0"/>
      <column name="rme_dgo_state" type="field" width="-1" hidden="0"/>
      <column name="rme_dgo_county" type="field" width="-1" hidden="0"/>
      <column type="actions" width="-1" hidden="1"/>
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
    <field name="active_channel_area" editable="1"/>
    <field name="active_channel_ratio" editable="1"/>
    <field name="active_floodplain_area" editable="1"/>
    <field name="active_floodplain_valley_bottom_ratio" editable="1"/>
    <field name="anthro_igo_land_use_intens" editable="1"/>
    <field name="anthro_igo_rail_dens" editable="1"/>
    <field name="anthro_igo_road_dens" editable="1"/>
    <field name="channel_sinuosity" editable="1"/>
    <field name="conf_dgo_confining_margins" editable="1"/>
    <field name="conf_igo_confinement_ratio" editable="1"/>
    <field name="conf_igo_constriction_ratio" editable="1"/>
    <field name="confluence_count" editable="1"/>
    <field name="diffluence_count" editable="1"/>
    <field name="drainage_area" editable="1"/>
    <field name="ecoregion_iii" editable="1"/>
    <field name="epa_dgo_ecoregion3" editable="1"/>
    <field name="epa_dgo_ecoregion4" editable="1"/>
    <field name="fid" editable="1"/>
    <field name="headwater" editable="1"/>
    <field name="integrated_width" editable="1"/>
    <field name="level_path" editable="1"/>
    <field name="nhd_dgo_headwater" editable="1"/>
    <field name="nhd_dgo_streamorder" editable="1"/>
    <field name="nhd_dgo_streamtype" editable="1"/>
    <field name="rcat_igo_fldpln_access" editable="1"/>
    <field name="relative_flow_length" editable="1"/>
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
    <field name="stream_gradient" editable="1"/>
    <field name="stream_order" editable="1"/>
    <field name="stream_size" editable="1"/>
    <field name="stream_size_metric" editable="1"/>
    <field name="stream_type" editable="1"/>
    <field name="tributary_junction_count" editable="1"/>
    <field name="valley_azimuth" editable="1"/>
    <field name="valley_gradient" editable="1"/>
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
  </editable>
  <labelOnTop>
    <field name="active_channel_area" labelOnTop="0"/>
    <field name="active_channel_ratio" labelOnTop="0"/>
    <field name="active_floodplain_area" labelOnTop="0"/>
    <field name="active_floodplain_valley_bottom_ratio" labelOnTop="0"/>
    <field name="anthro_igo_land_use_intens" labelOnTop="0"/>
    <field name="anthro_igo_rail_dens" labelOnTop="0"/>
    <field name="anthro_igo_road_dens" labelOnTop="0"/>
    <field name="channel_sinuosity" labelOnTop="0"/>
    <field name="conf_dgo_confining_margins" labelOnTop="0"/>
    <field name="conf_igo_confinement_ratio" labelOnTop="0"/>
    <field name="conf_igo_constriction_ratio" labelOnTop="0"/>
    <field name="confluence_count" labelOnTop="0"/>
    <field name="diffluence_count" labelOnTop="0"/>
    <field name="drainage_area" labelOnTop="0"/>
    <field name="ecoregion_iii" labelOnTop="0"/>
    <field name="epa_dgo_ecoregion3" labelOnTop="0"/>
    <field name="epa_dgo_ecoregion4" labelOnTop="0"/>
    <field name="fid" labelOnTop="0"/>
    <field name="headwater" labelOnTop="0"/>
    <field name="integrated_width" labelOnTop="0"/>
    <field name="level_path" labelOnTop="0"/>
    <field name="nhd_dgo_headwater" labelOnTop="0"/>
    <field name="nhd_dgo_streamorder" labelOnTop="0"/>
    <field name="nhd_dgo_streamtype" labelOnTop="0"/>
    <field name="rcat_igo_fldpln_access" labelOnTop="0"/>
    <field name="relative_flow_length" labelOnTop="0"/>
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
    <field name="stream_gradient" labelOnTop="0"/>
    <field name="stream_order" labelOnTop="0"/>
    <field name="stream_size" labelOnTop="0"/>
    <field name="stream_size_metric" labelOnTop="0"/>
    <field name="stream_type" labelOnTop="0"/>
    <field name="tributary_junction_count" labelOnTop="0"/>
    <field name="valley_azimuth" labelOnTop="0"/>
    <field name="valley_gradient" labelOnTop="0"/>
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
  </labelOnTop>
  <reuseLastValue>
    <field name="active_channel_area" reuseLastValue="0"/>
    <field name="active_channel_ratio" reuseLastValue="0"/>
    <field name="active_floodplain_area" reuseLastValue="0"/>
    <field name="active_floodplain_valley_bottom_ratio" reuseLastValue="0"/>
    <field name="anthro_igo_land_use_intens" reuseLastValue="0"/>
    <field name="anthro_igo_rail_dens" reuseLastValue="0"/>
    <field name="anthro_igo_road_dens" reuseLastValue="0"/>
    <field name="channel_sinuosity" reuseLastValue="0"/>
    <field name="conf_dgo_confining_margins" reuseLastValue="0"/>
    <field name="conf_igo_confinement_ratio" reuseLastValue="0"/>
    <field name="conf_igo_constriction_ratio" reuseLastValue="0"/>
    <field name="confluence_count" reuseLastValue="0"/>
    <field name="diffluence_count" reuseLastValue="0"/>
    <field name="drainage_area" reuseLastValue="0"/>
    <field name="ecoregion_iii" reuseLastValue="0"/>
    <field name="epa_dgo_ecoregion3" reuseLastValue="0"/>
    <field name="epa_dgo_ecoregion4" reuseLastValue="0"/>
    <field name="fid" reuseLastValue="0"/>
    <field name="headwater" reuseLastValue="0"/>
    <field name="integrated_width" reuseLastValue="0"/>
    <field name="level_path" reuseLastValue="0"/>
    <field name="nhd_dgo_headwater" reuseLastValue="0"/>
    <field name="nhd_dgo_streamorder" reuseLastValue="0"/>
    <field name="nhd_dgo_streamtype" reuseLastValue="0"/>
    <field name="rcat_igo_fldpln_access" reuseLastValue="0"/>
    <field name="relative_flow_length" reuseLastValue="0"/>
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
    <field name="stream_gradient" reuseLastValue="0"/>
    <field name="stream_order" reuseLastValue="0"/>
    <field name="stream_size" reuseLastValue="0"/>
    <field name="stream_size_metric" reuseLastValue="0"/>
    <field name="stream_type" reuseLastValue="0"/>
    <field name="tributary_junction_count" reuseLastValue="0"/>
    <field name="valley_azimuth" reuseLastValue="0"/>
    <field name="valley_gradient" reuseLastValue="0"/>
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
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"level_path"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
