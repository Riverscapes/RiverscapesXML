<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis minScale="100000000" simplifyDrawingHints="1" maxScale="0" labelsEnabled="0" simplifyMaxScale="1" simplifyLocal="1" simplifyDrawingTol="1" version="3.16.8-Hannover" hasScaleBasedVisibilityFlag="0" styleCategories="AllStyleCategories" readOnly="0" simplifyAlgorithm="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <temporal fixedDuration="0" endExpression="" accumulate="0" startExpression="" mode="0" endField="" startField="" durationUnit="min" enabled="0" durationField="">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <renderer-v2 forceraster="0" enableorderby="0" symbollevels="0" type="singleSymbol">
    <symbols>
      <symbol alpha="1" force_rhr="0" clip_to_extent="1" name="0" type="fill">
        <layer class="SimpleFill" locked="0" pass="0" enabled="1">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="183,72,75,0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="255,170,0,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.4"/>
          <prop k="outline_width_unit" v="Point"/>
          <prop k="style" v="solid"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <customproperties>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Histogram">
    <DiagramCategory minScaleDenominator="0" width="15" direction="0" spacingUnit="MM" backgroundAlpha="255" enabled="0" lineSizeScale="3x:0,0,0,0,0,0" barWidth="5" penColor="#000000" minimumSize="0" labelPlacementMethod="XHeight" scaleBasedVisibility="0" spacing="5" sizeType="MM" scaleDependency="Area" penWidth="0" maxScaleDenominator="1e+08" height="15" rotationOffset="270" showAxis="1" diagramOrientation="Up" opacity="1" sizeScale="3x:0,0,0,0,0,0" backgroundColor="#ffffff" penAlpha="255" lineSizeType="MM" spacingUnitScale="3x:0,0,0,0,0,0">
      <fontProperties description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0" style=""/>
      <axisSymbol>
        <symbol alpha="1" force_rhr="0" clip_to_extent="1" name="" type="line">
          <layer class="SimpleLine" locked="0" pass="0" enabled="1">
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
            <prop k="tweak_dash_pattern_on_corners" v="0"/>
            <prop k="use_custom_dash" v="0"/>
            <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
            <data_defined_properties>
              <Option type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties"/>
                <Option name="type" value="collection" type="QString"/>
              </Option>
            </data_defined_properties>
          </layer>
        </symbol>
      </axisSymbol>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings showAll="1" linePlacementFlags="18" zIndex="0" priority="0" placement="1" obstacle="0" dist="0">
    <properties>
      <Option type="Map">
        <Option name="name" value="" type="QString"/>
        <Option name="properties"/>
        <Option name="type" value="collection" type="QString"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration type="Map">
      <Option name="QgsGeometryGapCheck" type="Map">
        <Option name="allowedGapsBuffer" value="0" type="double"/>
        <Option name="allowedGapsEnabled" value="false" type="bool"/>
        <Option name="allowedGapsLayer" value="" type="QString"/>
      </Option>
    </checkConfiguration>
  </geometryOptions>
  <legend type="default-vector"/>
  <referencedLayers/>
  <fieldConfiguration>
    <field configurationFlags="None" name="NHDPlusID">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="SourceFC">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="GridCode">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="AreaSqKm">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="VPUID">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="SHAPE_Leng">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="SHAPE_Area">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="NHDPlusID" name="" index="0"/>
    <alias field="SourceFC" name="" index="1"/>
    <alias field="GridCode" name="" index="2"/>
    <alias field="AreaSqKm" name="" index="3"/>
    <alias field="VPUID" name="" index="4"/>
    <alias field="SHAPE_Leng" name="" index="5"/>
    <alias field="SHAPE_Area" name="" index="6"/>
  </aliases>
  <defaults>
    <default applyOnUpdate="0" field="NHDPlusID" expression=""/>
    <default applyOnUpdate="0" field="SourceFC" expression=""/>
    <default applyOnUpdate="0" field="GridCode" expression=""/>
    <default applyOnUpdate="0" field="AreaSqKm" expression=""/>
    <default applyOnUpdate="0" field="VPUID" expression=""/>
    <default applyOnUpdate="0" field="SHAPE_Leng" expression=""/>
    <default applyOnUpdate="0" field="SHAPE_Area" expression=""/>
  </defaults>
  <constraints>
    <constraint exp_strength="0" field="NHDPlusID" notnull_strength="0" unique_strength="0" constraints="0"/>
    <constraint exp_strength="0" field="SourceFC" notnull_strength="0" unique_strength="0" constraints="0"/>
    <constraint exp_strength="0" field="GridCode" notnull_strength="0" unique_strength="0" constraints="0"/>
    <constraint exp_strength="0" field="AreaSqKm" notnull_strength="0" unique_strength="0" constraints="0"/>
    <constraint exp_strength="0" field="VPUID" notnull_strength="0" unique_strength="0" constraints="0"/>
    <constraint exp_strength="0" field="SHAPE_Leng" notnull_strength="0" unique_strength="0" constraints="0"/>
    <constraint exp_strength="0" field="SHAPE_Area" notnull_strength="0" unique_strength="0" constraints="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="NHDPlusID" exp="" desc=""/>
    <constraint field="SourceFC" exp="" desc=""/>
    <constraint field="GridCode" exp="" desc=""/>
    <constraint field="AreaSqKm" exp="" desc=""/>
    <constraint field="VPUID" exp="" desc=""/>
    <constraint field="SHAPE_Leng" exp="" desc=""/>
    <constraint field="SHAPE_Area" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortExpression="" sortOrder="0" actionWidgetStyle="dropDown">
    <columns>
      <column width="-1" hidden="0" name="NHDPlusID" type="field"/>
      <column width="-1" hidden="0" name="SourceFC" type="field"/>
      <column width="-1" hidden="0" name="GridCode" type="field"/>
      <column width="-1" hidden="0" name="AreaSqKm" type="field"/>
      <column width="-1" hidden="0" name="VPUID" type="field"/>
      <column width="-1" hidden="0" name="SHAPE_Leng" type="field"/>
      <column width="-1" hidden="0" name="SHAPE_Area" type="field"/>
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
    <field name="AreaSqKm" editable="1"/>
    <field name="GridCode" editable="1"/>
    <field name="NHDPlusID" editable="1"/>
    <field name="SHAPE_Area" editable="1"/>
    <field name="SHAPE_Leng" editable="1"/>
    <field name="SourceFC" editable="1"/>
    <field name="VPUID" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="AreaSqKm" labelOnTop="0"/>
    <field name="GridCode" labelOnTop="0"/>
    <field name="NHDPlusID" labelOnTop="0"/>
    <field name="SHAPE_Area" labelOnTop="0"/>
    <field name="SHAPE_Leng" labelOnTop="0"/>
    <field name="SourceFC" labelOnTop="0"/>
    <field name="VPUID" labelOnTop="0"/>
  </labelOnTop>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"NHDPlusID"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
