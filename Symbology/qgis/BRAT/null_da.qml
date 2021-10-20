<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="AllStyleCategories" simplifyAlgorithm="0" hasScaleBasedVisibilityFlag="0" simplifyMaxScale="1" maxScale="0" minScale="100000000" version="3.20.0-Odense" simplifyDrawingTol="1" labelsEnabled="0" readOnly="0" simplifyLocal="1" simplifyDrawingHints="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal endField="" durationUnit="min" mode="0" enabled="0" startExpression="" accumulate="0" startField="" endExpression="" fixedDuration="0" durationField="">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <renderer-v2 forceraster="0" type="RuleRenderer" enableorderby="0" symbollevels="0">
    <rules key="{498b579b-17af-4858-9f06-f5d5aa66a1c8}">
      <rule symbol="0" filter="&quot;Orig_DA&quot; >= 0.000000 AND &quot;Orig_DA&quot; &lt;= 0.000010" key="{f914bc86-6225-41cf-9d0b-7658fd33cb7e}" label="0"/>
      <rule symbol="1" filter="ELSE" key="{920d92bf-8363-4e75-af4a-51250f723f6f}" label="Null"/>
      <rule symbol="2" filter="&quot;Orig_DA&quot; > 0.000010 AND &quot;Orig_DA&quot; &lt;= 1800.000000" key="{b686928b-5207-4e07-9124-c9fecbf4aad4}"/>
    </rules>
    <symbols>
      <symbol type="line" alpha="1" name="0" clip_to_extent="1" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" class="SimpleLine" locked="0" pass="0">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="round"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="round"/>
            <Option type="QString" name="line_color" value="255,4,4,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="1.1"/>
            <Option type="QString" name="line_width_unit" value="Point"/>
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
          <prop k="capstyle" v="round"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="dash_pattern_offset" v="0"/>
          <prop k="dash_pattern_offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="dash_pattern_offset_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="round"/>
          <prop k="line_color" v="255,4,4,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="1.1"/>
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
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="line" alpha="1" name="1" clip_to_extent="1" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" class="SimpleLine" locked="0" pass="0">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="round"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="round"/>
            <Option type="QString" name="line_color" value="230,207,0,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="1.1"/>
            <Option type="QString" name="line_width_unit" value="Point"/>
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
          <prop k="capstyle" v="round"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="dash_pattern_offset" v="0"/>
          <prop k="dash_pattern_offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="dash_pattern_offset_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="round"/>
          <prop k="line_color" v="230,207,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="1.1"/>
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
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="line" alpha="0" name="2" clip_to_extent="1" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" class="SimpleLine" locked="0" pass="0">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="round"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="round"/>
            <Option type="QString" name="line_color" value="255,255,255,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="1.1"/>
            <Option type="QString" name="line_width_unit" value="Point"/>
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
          <prop k="capstyle" v="round"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="dash_pattern_offset" v="0"/>
          <prop k="dash_pattern_offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="dash_pattern_offset_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="round"/>
          <prop k="line_color" v="255,255,255,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="1.1"/>
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
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
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
    <DiagramCategory minimumSize="0" height="15" sizeScale="3x:0,0,0,0,0,0" scaleBasedVisibility="0" penColor="#000000" barWidth="5" spacingUnit="MM" lineSizeType="MM" lineSizeScale="3x:0,0,0,0,0,0" scaleDependency="Area" enabled="0" maxScaleDenominator="1e+08" penAlpha="255" diagramOrientation="Up" rotationOffset="270" backgroundColor="#ffffff" labelPlacementMethod="XHeight" backgroundAlpha="255" width="15" opacity="1" spacing="5" minScaleDenominator="0" direction="0" penWidth="0" spacingUnitScale="3x:0,0,0,0,0,0" showAxis="1" sizeType="MM">
      <fontProperties description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0" style=""/>
      <attribute field="" color="#000000" label=""/>
      <axisSymbol>
        <symbol type="line" alpha="1" name="" clip_to_extent="1" force_rhr="0">
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <layer enabled="1" class="SimpleLine" locked="0" pass="0">
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
  <DiagramLayerSettings obstacle="0" priority="0" dist="0" linePlacementFlags="18" zIndex="0" showAll="1" placement="2">
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
    <alias index="0" name="" field="ReachID"/>
    <alias index="1" name="" field="WatershedID"/>
    <alias index="2" name="" field="ReachCode"/>
    <alias index="3" name="" field="IsPeren"/>
    <alias index="4" name="" field="StreamName"/>
    <alias index="5" name="" field="Orig_DA"/>
    <alias index="6" name="" field="iGeo_Slope"/>
    <alias index="7" name="" field="iGeo_ElMax"/>
    <alias index="8" name="" field="iGeo_ElMin"/>
    <alias index="9" name="" field="iGeo_Len"/>
    <alias index="10" name="" field="iGeo_DA"/>
    <alias index="11" name="" field="iVeg100EX"/>
    <alias index="12" name="" field="iVeg_30EX"/>
    <alias index="13" name="" field="iVeg100HPE"/>
    <alias index="14" name="" field="iVeg_30HPE"/>
    <alias index="15" name="" field="iPC_Road"/>
    <alias index="16" name="" field="iPC_RoadX"/>
    <alias index="17" name="" field="iPC_RoadVB"/>
    <alias index="18" name="" field="iPC_Rail"/>
    <alias index="19" name="" field="iPC_RailVB"/>
    <alias index="20" name="" field="iPC_LU"/>
    <alias index="21" name="" field="iPC_VLowLU"/>
    <alias index="22" name="" field="iPC_LowLU"/>
    <alias index="23" name="" field="iPC_ModLU"/>
    <alias index="24" name="" field="iPC_HighLU"/>
    <alias index="25" name="" field="iHyd_QLow"/>
    <alias index="26" name="" field="iHyd_Q2"/>
    <alias index="27" name="" field="iHyd_SPLow"/>
    <alias index="28" name="" field="iHyd_SP2"/>
    <alias index="29" name="" field="AgencyID"/>
    <alias index="30" name="" field="oVC_HPE"/>
    <alias index="31" name="" field="oVC_EX"/>
    <alias index="32" name="" field="oCC_HPE"/>
    <alias index="33" name="" field="mCC_HPE_CT"/>
    <alias index="34" name="" field="oCC_EX"/>
    <alias index="35" name="" field="mCC_EX_CT"/>
    <alias index="36" name="" field="LimitationID"/>
    <alias index="37" name="" field="RiskID"/>
    <alias index="38" name="" field="OpportunityID"/>
    <alias index="39" name="" field="iPC_Canal"/>
    <alias index="40" name="" field="iPC_DivPts"/>
    <alias index="41" name="" field="iPC_Privat"/>
    <alias index="42" name="" field="oPC_Dist"/>
    <alias index="43" name="" field="IsMainCh"/>
    <alias index="44" name="" field="IsMultiCh"/>
    <alias index="45" name="" field="mCC_HisDep"/>
    <alias index="46" name="" field="Watershed"/>
    <alias index="47" name="" field="ReachType"/>
    <alias index="48" name="" field="Agency"/>
    <alias index="49" name="" field="Limitation"/>
    <alias index="50" name="" field="Risk"/>
    <alias index="51" name="" field="Opportunity"/>
  </aliases>
  <defaults>
    <default applyOnUpdate="0" field="ReachID" expression=""/>
    <default applyOnUpdate="0" field="WatershedID" expression=""/>
    <default applyOnUpdate="0" field="ReachCode" expression=""/>
    <default applyOnUpdate="0" field="IsPeren" expression=""/>
    <default applyOnUpdate="0" field="StreamName" expression=""/>
    <default applyOnUpdate="0" field="Orig_DA" expression=""/>
    <default applyOnUpdate="0" field="iGeo_Slope" expression=""/>
    <default applyOnUpdate="0" field="iGeo_ElMax" expression=""/>
    <default applyOnUpdate="0" field="iGeo_ElMin" expression=""/>
    <default applyOnUpdate="0" field="iGeo_Len" expression=""/>
    <default applyOnUpdate="0" field="iGeo_DA" expression=""/>
    <default applyOnUpdate="0" field="iVeg100EX" expression=""/>
    <default applyOnUpdate="0" field="iVeg_30EX" expression=""/>
    <default applyOnUpdate="0" field="iVeg100HPE" expression=""/>
    <default applyOnUpdate="0" field="iVeg_30HPE" expression=""/>
    <default applyOnUpdate="0" field="iPC_Road" expression=""/>
    <default applyOnUpdate="0" field="iPC_RoadX" expression=""/>
    <default applyOnUpdate="0" field="iPC_RoadVB" expression=""/>
    <default applyOnUpdate="0" field="iPC_Rail" expression=""/>
    <default applyOnUpdate="0" field="iPC_RailVB" expression=""/>
    <default applyOnUpdate="0" field="iPC_LU" expression=""/>
    <default applyOnUpdate="0" field="iPC_VLowLU" expression=""/>
    <default applyOnUpdate="0" field="iPC_LowLU" expression=""/>
    <default applyOnUpdate="0" field="iPC_ModLU" expression=""/>
    <default applyOnUpdate="0" field="iPC_HighLU" expression=""/>
    <default applyOnUpdate="0" field="iHyd_QLow" expression=""/>
    <default applyOnUpdate="0" field="iHyd_Q2" expression=""/>
    <default applyOnUpdate="0" field="iHyd_SPLow" expression=""/>
    <default applyOnUpdate="0" field="iHyd_SP2" expression=""/>
    <default applyOnUpdate="0" field="AgencyID" expression=""/>
    <default applyOnUpdate="0" field="oVC_HPE" expression=""/>
    <default applyOnUpdate="0" field="oVC_EX" expression=""/>
    <default applyOnUpdate="0" field="oCC_HPE" expression=""/>
    <default applyOnUpdate="0" field="mCC_HPE_CT" expression=""/>
    <default applyOnUpdate="0" field="oCC_EX" expression=""/>
    <default applyOnUpdate="0" field="mCC_EX_CT" expression=""/>
    <default applyOnUpdate="0" field="LimitationID" expression=""/>
    <default applyOnUpdate="0" field="RiskID" expression=""/>
    <default applyOnUpdate="0" field="OpportunityID" expression=""/>
    <default applyOnUpdate="0" field="iPC_Canal" expression=""/>
    <default applyOnUpdate="0" field="iPC_DivPts" expression=""/>
    <default applyOnUpdate="0" field="iPC_Privat" expression=""/>
    <default applyOnUpdate="0" field="oPC_Dist" expression=""/>
    <default applyOnUpdate="0" field="IsMainCh" expression=""/>
    <default applyOnUpdate="0" field="IsMultiCh" expression=""/>
    <default applyOnUpdate="0" field="mCC_HisDep" expression=""/>
    <default applyOnUpdate="0" field="Watershed" expression=""/>
    <default applyOnUpdate="0" field="ReachType" expression=""/>
    <default applyOnUpdate="0" field="Agency" expression=""/>
    <default applyOnUpdate="0" field="Limitation" expression=""/>
    <default applyOnUpdate="0" field="Risk" expression=""/>
    <default applyOnUpdate="0" field="Opportunity" expression=""/>
  </defaults>
  <constraints>
    <constraint unique_strength="0" exp_strength="0" field="ReachID" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="WatershedID" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="ReachCode" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="IsPeren" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="StreamName" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="Orig_DA" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iGeo_Slope" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iGeo_ElMax" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iGeo_ElMin" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iGeo_Len" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iGeo_DA" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iVeg100EX" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iVeg_30EX" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iVeg100HPE" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iVeg_30HPE" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iPC_Road" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iPC_RoadX" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iPC_RoadVB" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iPC_Rail" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iPC_RailVB" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iPC_LU" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iPC_VLowLU" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iPC_LowLU" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iPC_ModLU" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iPC_HighLU" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iHyd_QLow" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iHyd_Q2" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iHyd_SPLow" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iHyd_SP2" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="AgencyID" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="oVC_HPE" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="oVC_EX" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="oCC_HPE" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="mCC_HPE_CT" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="oCC_EX" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="mCC_EX_CT" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="LimitationID" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="RiskID" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="OpportunityID" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iPC_Canal" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iPC_DivPts" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="iPC_Privat" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="oPC_Dist" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="IsMainCh" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="IsMultiCh" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="mCC_HisDep" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="Watershed" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="ReachType" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="Agency" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="Limitation" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="Risk" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" exp_strength="0" field="Opportunity" constraints="0" notnull_strength="0"/>
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
  <attributetableconfig sortOrder="0" sortExpression="&quot;Orig_DA&quot;" actionWidgetStyle="dropDown">
    <columns>
      <column type="field" hidden="0" name="ReachID" width="-1"/>
      <column type="field" hidden="0" name="WatershedID" width="-1"/>
      <column type="field" hidden="0" name="ReachCode" width="-1"/>
      <column type="field" hidden="0" name="IsPeren" width="-1"/>
      <column type="field" hidden="0" name="StreamName" width="-1"/>
      <column type="field" hidden="0" name="Orig_DA" width="-1"/>
      <column type="field" hidden="0" name="iGeo_Slope" width="-1"/>
      <column type="field" hidden="0" name="iGeo_ElMax" width="-1"/>
      <column type="field" hidden="0" name="iGeo_ElMin" width="-1"/>
      <column type="field" hidden="0" name="iGeo_Len" width="-1"/>
      <column type="field" hidden="0" name="iGeo_DA" width="-1"/>
      <column type="field" hidden="0" name="iVeg100EX" width="-1"/>
      <column type="field" hidden="0" name="iVeg_30EX" width="-1"/>
      <column type="field" hidden="0" name="iVeg100HPE" width="-1"/>
      <column type="field" hidden="0" name="iVeg_30HPE" width="-1"/>
      <column type="field" hidden="0" name="iPC_Road" width="-1"/>
      <column type="field" hidden="0" name="iPC_RoadX" width="-1"/>
      <column type="field" hidden="0" name="iPC_RoadVB" width="-1"/>
      <column type="field" hidden="0" name="iPC_Rail" width="-1"/>
      <column type="field" hidden="0" name="iPC_RailVB" width="-1"/>
      <column type="field" hidden="0" name="iPC_LU" width="-1"/>
      <column type="field" hidden="0" name="iPC_VLowLU" width="-1"/>
      <column type="field" hidden="0" name="iPC_LowLU" width="-1"/>
      <column type="field" hidden="0" name="iPC_ModLU" width="-1"/>
      <column type="field" hidden="0" name="iPC_HighLU" width="-1"/>
      <column type="field" hidden="0" name="iHyd_QLow" width="-1"/>
      <column type="field" hidden="0" name="iHyd_Q2" width="-1"/>
      <column type="field" hidden="0" name="iHyd_SPLow" width="-1"/>
      <column type="field" hidden="0" name="iHyd_SP2" width="-1"/>
      <column type="field" hidden="0" name="AgencyID" width="-1"/>
      <column type="field" hidden="0" name="oVC_HPE" width="-1"/>
      <column type="field" hidden="0" name="oVC_EX" width="-1"/>
      <column type="field" hidden="0" name="oCC_HPE" width="-1"/>
      <column type="field" hidden="0" name="mCC_HPE_CT" width="-1"/>
      <column type="field" hidden="0" name="oCC_EX" width="-1"/>
      <column type="field" hidden="0" name="mCC_EX_CT" width="-1"/>
      <column type="field" hidden="0" name="LimitationID" width="-1"/>
      <column type="field" hidden="0" name="RiskID" width="-1"/>
      <column type="field" hidden="0" name="OpportunityID" width="-1"/>
      <column type="field" hidden="0" name="iPC_Canal" width="-1"/>
      <column type="field" hidden="0" name="iPC_DivPts" width="-1"/>
      <column type="field" hidden="0" name="iPC_Privat" width="-1"/>
      <column type="field" hidden="0" name="oPC_Dist" width="-1"/>
      <column type="field" hidden="0" name="IsMainCh" width="-1"/>
      <column type="field" hidden="0" name="IsMultiCh" width="-1"/>
      <column type="field" hidden="0" name="mCC_HisDep" width="-1"/>
      <column type="field" hidden="0" name="Watershed" width="-1"/>
      <column type="field" hidden="0" name="ReachType" width="-1"/>
      <column type="field" hidden="0" name="Agency" width="-1"/>
      <column type="field" hidden="0" name="Limitation" width="-1"/>
      <column type="field" hidden="0" name="Risk" width="-1"/>
      <column type="field" hidden="0" name="Opportunity" width="-1"/>
      <column type="actions" hidden="1" width="-1"/>
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
    <field name="Agency" editable="1"/>
    <field name="AgencyID" editable="1"/>
    <field name="IsMainCh" editable="1"/>
    <field name="IsMultiCh" editable="1"/>
    <field name="IsPeren" editable="1"/>
    <field name="Limitation" editable="1"/>
    <field name="LimitationID" editable="1"/>
    <field name="Opportunity" editable="1"/>
    <field name="OpportunityID" editable="1"/>
    <field name="Orig_DA" editable="1"/>
    <field name="ReachCode" editable="1"/>
    <field name="ReachID" editable="1"/>
    <field name="ReachType" editable="1"/>
    <field name="Risk" editable="1"/>
    <field name="RiskID" editable="1"/>
    <field name="StreamName" editable="1"/>
    <field name="Watershed" editable="1"/>
    <field name="WatershedID" editable="1"/>
    <field name="iGeo_DA" editable="1"/>
    <field name="iGeo_ElMax" editable="1"/>
    <field name="iGeo_ElMin" editable="1"/>
    <field name="iGeo_Len" editable="1"/>
    <field name="iGeo_Slope" editable="1"/>
    <field name="iHyd_Q2" editable="1"/>
    <field name="iHyd_QLow" editable="1"/>
    <field name="iHyd_SP2" editable="1"/>
    <field name="iHyd_SPLow" editable="1"/>
    <field name="iPC_Canal" editable="1"/>
    <field name="iPC_DivPts" editable="1"/>
    <field name="iPC_HighLU" editable="1"/>
    <field name="iPC_LU" editable="1"/>
    <field name="iPC_LowLU" editable="1"/>
    <field name="iPC_ModLU" editable="1"/>
    <field name="iPC_Privat" editable="1"/>
    <field name="iPC_Rail" editable="1"/>
    <field name="iPC_RailVB" editable="1"/>
    <field name="iPC_Road" editable="1"/>
    <field name="iPC_RoadVB" editable="1"/>
    <field name="iPC_RoadX" editable="1"/>
    <field name="iPC_VLowLU" editable="1"/>
    <field name="iVeg100EX" editable="1"/>
    <field name="iVeg100HPE" editable="1"/>
    <field name="iVeg_30EX" editable="1"/>
    <field name="iVeg_30HPE" editable="1"/>
    <field name="mCC_EX_CT" editable="1"/>
    <field name="mCC_HPE_CT" editable="1"/>
    <field name="mCC_HisDep" editable="1"/>
    <field name="oCC_EX" editable="1"/>
    <field name="oCC_HPE" editable="1"/>
    <field name="oPC_Dist" editable="1"/>
    <field name="oVC_EX" editable="1"/>
    <field name="oVC_HPE" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="Agency" labelOnTop="0"/>
    <field name="AgencyID" labelOnTop="0"/>
    <field name="IsMainCh" labelOnTop="0"/>
    <field name="IsMultiCh" labelOnTop="0"/>
    <field name="IsPeren" labelOnTop="0"/>
    <field name="Limitation" labelOnTop="0"/>
    <field name="LimitationID" labelOnTop="0"/>
    <field name="Opportunity" labelOnTop="0"/>
    <field name="OpportunityID" labelOnTop="0"/>
    <field name="Orig_DA" labelOnTop="0"/>
    <field name="ReachCode" labelOnTop="0"/>
    <field name="ReachID" labelOnTop="0"/>
    <field name="ReachType" labelOnTop="0"/>
    <field name="Risk" labelOnTop="0"/>
    <field name="RiskID" labelOnTop="0"/>
    <field name="StreamName" labelOnTop="0"/>
    <field name="Watershed" labelOnTop="0"/>
    <field name="WatershedID" labelOnTop="0"/>
    <field name="iGeo_DA" labelOnTop="0"/>
    <field name="iGeo_ElMax" labelOnTop="0"/>
    <field name="iGeo_ElMin" labelOnTop="0"/>
    <field name="iGeo_Len" labelOnTop="0"/>
    <field name="iGeo_Slope" labelOnTop="0"/>
    <field name="iHyd_Q2" labelOnTop="0"/>
    <field name="iHyd_QLow" labelOnTop="0"/>
    <field name="iHyd_SP2" labelOnTop="0"/>
    <field name="iHyd_SPLow" labelOnTop="0"/>
    <field name="iPC_Canal" labelOnTop="0"/>
    <field name="iPC_DivPts" labelOnTop="0"/>
    <field name="iPC_HighLU" labelOnTop="0"/>
    <field name="iPC_LU" labelOnTop="0"/>
    <field name="iPC_LowLU" labelOnTop="0"/>
    <field name="iPC_ModLU" labelOnTop="0"/>
    <field name="iPC_Privat" labelOnTop="0"/>
    <field name="iPC_Rail" labelOnTop="0"/>
    <field name="iPC_RailVB" labelOnTop="0"/>
    <field name="iPC_Road" labelOnTop="0"/>
    <field name="iPC_RoadVB" labelOnTop="0"/>
    <field name="iPC_RoadX" labelOnTop="0"/>
    <field name="iPC_VLowLU" labelOnTop="0"/>
    <field name="iVeg100EX" labelOnTop="0"/>
    <field name="iVeg100HPE" labelOnTop="0"/>
    <field name="iVeg_30EX" labelOnTop="0"/>
    <field name="iVeg_30HPE" labelOnTop="0"/>
    <field name="mCC_EX_CT" labelOnTop="0"/>
    <field name="mCC_HPE_CT" labelOnTop="0"/>
    <field name="mCC_HisDep" labelOnTop="0"/>
    <field name="oCC_EX" labelOnTop="0"/>
    <field name="oCC_HPE" labelOnTop="0"/>
    <field name="oPC_Dist" labelOnTop="0"/>
    <field name="oVC_EX" labelOnTop="0"/>
    <field name="oVC_HPE" labelOnTop="0"/>
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
