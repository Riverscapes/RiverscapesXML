<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" simplifyDrawingHints="1" simplifyLocal="1" minScale="100000000" version="3.20.0-Odense" simplifyMaxScale="1" readOnly="0" styleCategories="AllStyleCategories" labelsEnabled="0" simplifyDrawingTol="1" hasScaleBasedVisibilityFlag="0" simplifyAlgorithm="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal startExpression="" endField="" mode="0" fixedDuration="0" endExpression="" durationField="" accumulate="0" startField="" durationUnit="min" enabled="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <renderer-v2 forceraster="0" type="RuleRenderer" enableorderby="0" symbollevels="0">
    <rules key="{f004c8bc-ebbd-481d-846d-ef06c974b9f0}">
      <rule label="0 " filter="&quot;Orig_DA&quot; >= 0.000000 AND &quot;Orig_DA&quot; &lt;= 0.000001" symbol="0" key="{464f2ef9-2dad-4afa-8fdd-c1044e51e57c}"/>
      <rule label="NULL" filter="ELSE" symbol="1" key="{91b9c9ea-394c-4666-bf6e-3a417145fae9}"/>
      <rule filter="&quot;Orig_DA&quot; > 0.000001 AND &quot;Orig_DA&quot; &lt;= 100000000000000.000000" symbol="2" key="{44612821-0199-4dcd-9da6-b61b8e48a8ad}"/>
    </rules>
    <symbols>
      <symbol force_rhr="0" alpha="1" type="line" clip_to_extent="1" name="0">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" pass="0" class="SimpleLine" enabled="1">
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
            <Option type="QString" value="255,0,0,255" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="0.7" name="line_width"/>
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
          <prop v="0" k="align_dash_pattern"/>
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="dash_pattern_offset"/>
          <prop v="3x:0,0,0,0,0,0" k="dash_pattern_offset_map_unit_scale"/>
          <prop v="MM" k="dash_pattern_offset_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="255,0,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.7" k="line_width"/>
          <prop v="Point" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="trim_distance_end"/>
          <prop v="3x:0,0,0,0,0,0" k="trim_distance_end_map_unit_scale"/>
          <prop v="MM" k="trim_distance_end_unit"/>
          <prop v="0" k="trim_distance_start"/>
          <prop v="3x:0,0,0,0,0,0" k="trim_distance_start_map_unit_scale"/>
          <prop v="MM" k="trim_distance_start_unit"/>
          <prop v="0" k="tweak_dash_pattern_on_corners"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" alpha="1" type="line" clip_to_extent="1" name="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" pass="0" class="SimpleLine" enabled="1">
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
            <Option type="QString" value="245,245,0,255" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="0.66" name="line_width"/>
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
          <prop v="0" k="align_dash_pattern"/>
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="dash_pattern_offset"/>
          <prop v="3x:0,0,0,0,0,0" k="dash_pattern_offset_map_unit_scale"/>
          <prop v="MM" k="dash_pattern_offset_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="245,245,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.66" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="trim_distance_end"/>
          <prop v="3x:0,0,0,0,0,0" k="trim_distance_end_map_unit_scale"/>
          <prop v="MM" k="trim_distance_end_unit"/>
          <prop v="0" k="trim_distance_start"/>
          <prop v="3x:0,0,0,0,0,0" k="trim_distance_start_map_unit_scale"/>
          <prop v="MM" k="trim_distance_start_unit"/>
          <prop v="0" k="tweak_dash_pattern_on_corners"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" alpha="0" type="line" clip_to_extent="1" name="2">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" pass="0" class="SimpleLine" enabled="1">
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
            <Option type="QString" value="255,255,255,255" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="1.1" name="line_width"/>
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
          <prop v="0" k="align_dash_pattern"/>
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="dash_pattern_offset"/>
          <prop v="3x:0,0,0,0,0,0" k="dash_pattern_offset_map_unit_scale"/>
          <prop v="MM" k="dash_pattern_offset_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="255,255,255,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="1.1" k="line_width"/>
          <prop v="Point" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="trim_distance_end"/>
          <prop v="3x:0,0,0,0,0,0" k="trim_distance_end_map_unit_scale"/>
          <prop v="MM" k="trim_distance_end_unit"/>
          <prop v="0" k="trim_distance_start"/>
          <prop v="3x:0,0,0,0,0,0" k="trim_distance_start_map_unit_scale"/>
          <prop v="MM" k="trim_distance_start_unit"/>
          <prop v="0" k="tweak_dash_pattern_on_corners"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
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
      <Option type="List" name="dualview/previewExpressions">
        <Option type="QString" value="&quot;StreamName&quot;"/>
      </Option>
      <Option type="int" value="0" name="embeddedWidgets/count"/>
      <Option name="variableNames"/>
      <Option name="variableValues"/>
    </Option>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory scaleBasedVisibility="0" enabled="0" sizeScale="3x:0,0,0,0,0,0" height="15" diagramOrientation="Up" rotationOffset="270" showAxis="1" width="15" lineSizeType="MM" penColor="#000000" opacity="1" backgroundAlpha="255" penAlpha="255" maxScaleDenominator="1e+08" minimumSize="0" minScaleDenominator="0" sizeType="MM" backgroundColor="#ffffff" lineSizeScale="3x:0,0,0,0,0,0" spacingUnitScale="3x:0,0,0,0,0,0" barWidth="5" penWidth="0" spacingUnit="MM" direction="0" scaleDependency="Area" spacing="5" labelPlacementMethod="XHeight">
      <fontProperties description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0" style=""/>
      <attribute field="" label="" color="#000000"/>
      <axisSymbol>
        <symbol force_rhr="0" alpha="1" type="line" clip_to_extent="1" name="">
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <layer locked="0" pass="0" class="SimpleLine" enabled="1">
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
            <prop v="0" k="align_dash_pattern"/>
            <prop v="square" k="capstyle"/>
            <prop v="5;2" k="customdash"/>
            <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
            <prop v="MM" k="customdash_unit"/>
            <prop v="0" k="dash_pattern_offset"/>
            <prop v="3x:0,0,0,0,0,0" k="dash_pattern_offset_map_unit_scale"/>
            <prop v="MM" k="dash_pattern_offset_unit"/>
            <prop v="0" k="draw_inside_polygon"/>
            <prop v="bevel" k="joinstyle"/>
            <prop v="35,35,35,255" k="line_color"/>
            <prop v="solid" k="line_style"/>
            <prop v="0.26" k="line_width"/>
            <prop v="MM" k="line_width_unit"/>
            <prop v="0" k="offset"/>
            <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
            <prop v="MM" k="offset_unit"/>
            <prop v="0" k="ring_filter"/>
            <prop v="0" k="trim_distance_end"/>
            <prop v="3x:0,0,0,0,0,0" k="trim_distance_end_map_unit_scale"/>
            <prop v="MM" k="trim_distance_end_unit"/>
            <prop v="0" k="trim_distance_start"/>
            <prop v="3x:0,0,0,0,0,0" k="trim_distance_start_map_unit_scale"/>
            <prop v="MM" k="trim_distance_start_unit"/>
            <prop v="0" k="tweak_dash_pattern_on_corners"/>
            <prop v="0" k="use_custom_dash"/>
            <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
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
  <DiagramLayerSettings linePlacementFlags="18" showAll="1" zIndex="0" placement="2" priority="0" obstacle="0" dist="0">
    <properties>
      <Option type="Map">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
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
    <constraint field="ReachID" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="WatershedID" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="ReachCode" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="IsPeren" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="StreamName" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="Orig_DA" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iGeo_Slope" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iGeo_ElMax" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iGeo_ElMin" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iGeo_Len" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iGeo_DA" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iVeg100EX" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iVeg_30EX" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iVeg100HPE" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iVeg_30HPE" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iPC_Road" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iPC_RoadX" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iPC_RoadVB" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iPC_Rail" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iPC_RailVB" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iPC_LU" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iPC_VLowLU" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iPC_LowLU" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iPC_ModLU" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iPC_HighLU" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iHyd_QLow" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iHyd_Q2" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iHyd_SPLow" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iHyd_SP2" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="AgencyID" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="oVC_HPE" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="oVC_EX" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="oCC_HPE" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="mCC_HPE_CT" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="oCC_EX" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="mCC_EX_CT" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="LimitationID" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="RiskID" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="OpportunityID" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iPC_Canal" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iPC_DivPts" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="iPC_Privat" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="oPC_Dist" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="IsMainCh" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="IsMultiCh" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="mCC_HisDep" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="Watershed" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="ReachType" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="Agency" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="Limitation" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="Risk" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="Opportunity" exp_strength="0" notnull_strength="0" constraints="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="ReachID" exp="" desc=""/>
    <constraint field="WatershedID" exp="" desc=""/>
    <constraint field="ReachCode" exp="" desc=""/>
    <constraint field="IsPeren" exp="" desc=""/>
    <constraint field="StreamName" exp="" desc=""/>
    <constraint field="Orig_DA" exp="" desc=""/>
    <constraint field="iGeo_Slope" exp="" desc=""/>
    <constraint field="iGeo_ElMax" exp="" desc=""/>
    <constraint field="iGeo_ElMin" exp="" desc=""/>
    <constraint field="iGeo_Len" exp="" desc=""/>
    <constraint field="iGeo_DA" exp="" desc=""/>
    <constraint field="iVeg100EX" exp="" desc=""/>
    <constraint field="iVeg_30EX" exp="" desc=""/>
    <constraint field="iVeg100HPE" exp="" desc=""/>
    <constraint field="iVeg_30HPE" exp="" desc=""/>
    <constraint field="iPC_Road" exp="" desc=""/>
    <constraint field="iPC_RoadX" exp="" desc=""/>
    <constraint field="iPC_RoadVB" exp="" desc=""/>
    <constraint field="iPC_Rail" exp="" desc=""/>
    <constraint field="iPC_RailVB" exp="" desc=""/>
    <constraint field="iPC_LU" exp="" desc=""/>
    <constraint field="iPC_VLowLU" exp="" desc=""/>
    <constraint field="iPC_LowLU" exp="" desc=""/>
    <constraint field="iPC_ModLU" exp="" desc=""/>
    <constraint field="iPC_HighLU" exp="" desc=""/>
    <constraint field="iHyd_QLow" exp="" desc=""/>
    <constraint field="iHyd_Q2" exp="" desc=""/>
    <constraint field="iHyd_SPLow" exp="" desc=""/>
    <constraint field="iHyd_SP2" exp="" desc=""/>
    <constraint field="AgencyID" exp="" desc=""/>
    <constraint field="oVC_HPE" exp="" desc=""/>
    <constraint field="oVC_EX" exp="" desc=""/>
    <constraint field="oCC_HPE" exp="" desc=""/>
    <constraint field="mCC_HPE_CT" exp="" desc=""/>
    <constraint field="oCC_EX" exp="" desc=""/>
    <constraint field="mCC_EX_CT" exp="" desc=""/>
    <constraint field="LimitationID" exp="" desc=""/>
    <constraint field="RiskID" exp="" desc=""/>
    <constraint field="OpportunityID" exp="" desc=""/>
    <constraint field="iPC_Canal" exp="" desc=""/>
    <constraint field="iPC_DivPts" exp="" desc=""/>
    <constraint field="iPC_Privat" exp="" desc=""/>
    <constraint field="oPC_Dist" exp="" desc=""/>
    <constraint field="IsMainCh" exp="" desc=""/>
    <constraint field="IsMultiCh" exp="" desc=""/>
    <constraint field="mCC_HisDep" exp="" desc=""/>
    <constraint field="Watershed" exp="" desc=""/>
    <constraint field="ReachType" exp="" desc=""/>
    <constraint field="Agency" exp="" desc=""/>
    <constraint field="Limitation" exp="" desc=""/>
    <constraint field="Risk" exp="" desc=""/>
    <constraint field="Opportunity" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortExpression="&quot;Orig_DA&quot;" sortOrder="0" actionWidgetStyle="dropDown">
    <columns>
      <column hidden="0" type="field" width="-1" name="ReachID"/>
      <column hidden="0" type="field" width="-1" name="WatershedID"/>
      <column hidden="0" type="field" width="-1" name="ReachCode"/>
      <column hidden="0" type="field" width="-1" name="IsPeren"/>
      <column hidden="0" type="field" width="-1" name="StreamName"/>
      <column hidden="0" type="field" width="-1" name="Orig_DA"/>
      <column hidden="0" type="field" width="-1" name="iGeo_Slope"/>
      <column hidden="0" type="field" width="-1" name="iGeo_ElMax"/>
      <column hidden="0" type="field" width="-1" name="iGeo_ElMin"/>
      <column hidden="0" type="field" width="-1" name="iGeo_Len"/>
      <column hidden="0" type="field" width="-1" name="iGeo_DA"/>
      <column hidden="0" type="field" width="-1" name="iVeg100EX"/>
      <column hidden="0" type="field" width="-1" name="iVeg_30EX"/>
      <column hidden="0" type="field" width="-1" name="iVeg100HPE"/>
      <column hidden="0" type="field" width="-1" name="iVeg_30HPE"/>
      <column hidden="0" type="field" width="-1" name="iPC_Road"/>
      <column hidden="0" type="field" width="-1" name="iPC_RoadX"/>
      <column hidden="0" type="field" width="-1" name="iPC_RoadVB"/>
      <column hidden="0" type="field" width="-1" name="iPC_Rail"/>
      <column hidden="0" type="field" width="-1" name="iPC_RailVB"/>
      <column hidden="0" type="field" width="-1" name="iPC_LU"/>
      <column hidden="0" type="field" width="-1" name="iPC_VLowLU"/>
      <column hidden="0" type="field" width="-1" name="iPC_LowLU"/>
      <column hidden="0" type="field" width="-1" name="iPC_ModLU"/>
      <column hidden="0" type="field" width="-1" name="iPC_HighLU"/>
      <column hidden="0" type="field" width="-1" name="iHyd_QLow"/>
      <column hidden="0" type="field" width="-1" name="iHyd_Q2"/>
      <column hidden="0" type="field" width="-1" name="iHyd_SPLow"/>
      <column hidden="0" type="field" width="-1" name="iHyd_SP2"/>
      <column hidden="0" type="field" width="-1" name="AgencyID"/>
      <column hidden="0" type="field" width="-1" name="oVC_HPE"/>
      <column hidden="0" type="field" width="-1" name="oVC_EX"/>
      <column hidden="0" type="field" width="-1" name="oCC_HPE"/>
      <column hidden="0" type="field" width="-1" name="mCC_HPE_CT"/>
      <column hidden="0" type="field" width="-1" name="oCC_EX"/>
      <column hidden="0" type="field" width="-1" name="mCC_EX_CT"/>
      <column hidden="0" type="field" width="-1" name="LimitationID"/>
      <column hidden="0" type="field" width="-1" name="RiskID"/>
      <column hidden="0" type="field" width="-1" name="OpportunityID"/>
      <column hidden="0" type="field" width="-1" name="iPC_Canal"/>
      <column hidden="0" type="field" width="-1" name="iPC_DivPts"/>
      <column hidden="0" type="field" width="-1" name="iPC_Privat"/>
      <column hidden="0" type="field" width="-1" name="oPC_Dist"/>
      <column hidden="0" type="field" width="-1" name="IsMainCh"/>
      <column hidden="0" type="field" width="-1" name="IsMultiCh"/>
      <column hidden="0" type="field" width="-1" name="mCC_HisDep"/>
      <column hidden="0" type="field" width="-1" name="Watershed"/>
      <column hidden="0" type="field" width="-1" name="ReachType"/>
      <column hidden="0" type="field" width="-1" name="Agency"/>
      <column hidden="0" type="field" width="-1" name="Limitation"/>
      <column hidden="0" type="field" width="-1" name="Risk"/>
      <column hidden="0" type="field" width="-1" name="Opportunity"/>
      <column hidden="1" type="actions" width="-1"/>
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
