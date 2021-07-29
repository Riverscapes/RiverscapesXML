<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis minScale="100000000" simplifyDrawingHints="1" maxScale="0" labelsEnabled="0" simplifyMaxScale="1" simplifyLocal="1" simplifyDrawingTol="1" version="3.16.8-Hannover" hasScaleBasedVisibilityFlag="0" styleCategories="AllStyleCategories" readOnly="0" simplifyAlgorithm="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <temporal fixedDuration="0" endExpression="" accumulate="0" startExpression="" mode="0" endField="FDate" startField="FDate" durationUnit="min" enabled="0" durationField="">
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
          <prop k="color" v="0,77,168,255"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,0"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_unit" v="MM"/>
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
    <field configurationFlags="None" name="Permanent_">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="FDate">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="Resolution">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="GNIS_ID">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="GNIS_Name">
      <editWidget type="TextEdit">
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
    <field configurationFlags="None" name="Elevation">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="FType">
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
    <field configurationFlags="None" name="Visibility">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="Shape_Leng">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="Shape_Area">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="NHDPlusID">
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
  </fieldConfiguration>
  <aliases>
    <alias field="Permanent_" name="" index="0"/>
    <alias field="FDate" name="" index="1"/>
    <alias field="Resolution" name="" index="2"/>
    <alias field="GNIS_ID" name="" index="3"/>
    <alias field="GNIS_Name" name="" index="4"/>
    <alias field="AreaSqKm" name="" index="5"/>
    <alias field="Elevation" name="" index="6"/>
    <alias field="FType" name="" index="7"/>
    <alias field="FCode" name="" index="8"/>
    <alias field="Visibility" name="" index="9"/>
    <alias field="Shape_Leng" name="" index="10"/>
    <alias field="Shape_Area" name="" index="11"/>
    <alias field="NHDPlusID" name="" index="12"/>
    <alias field="VPUID" name="" index="13"/>
  </aliases>
  <defaults>
    <default applyOnUpdate="0" field="Permanent_" expression=""/>
    <default applyOnUpdate="0" field="FDate" expression=""/>
    <default applyOnUpdate="0" field="Resolution" expression=""/>
    <default applyOnUpdate="0" field="GNIS_ID" expression=""/>
    <default applyOnUpdate="0" field="GNIS_Name" expression=""/>
    <default applyOnUpdate="0" field="AreaSqKm" expression=""/>
    <default applyOnUpdate="0" field="Elevation" expression=""/>
    <default applyOnUpdate="0" field="FType" expression=""/>
    <default applyOnUpdate="0" field="FCode" expression=""/>
    <default applyOnUpdate="0" field="Visibility" expression=""/>
    <default applyOnUpdate="0" field="Shape_Leng" expression=""/>
    <default applyOnUpdate="0" field="Shape_Area" expression=""/>
    <default applyOnUpdate="0" field="NHDPlusID" expression=""/>
    <default applyOnUpdate="0" field="VPUID" expression=""/>
  </defaults>
  <constraints>
    <constraint exp_strength="0" field="Permanent_" notnull_strength="0" unique_strength="0" constraints="0"/>
    <constraint exp_strength="0" field="FDate" notnull_strength="0" unique_strength="0" constraints="0"/>
    <constraint exp_strength="0" field="Resolution" notnull_strength="0" unique_strength="0" constraints="0"/>
    <constraint exp_strength="0" field="GNIS_ID" notnull_strength="0" unique_strength="0" constraints="0"/>
    <constraint exp_strength="0" field="GNIS_Name" notnull_strength="0" unique_strength="0" constraints="0"/>
    <constraint exp_strength="0" field="AreaSqKm" notnull_strength="0" unique_strength="0" constraints="0"/>
    <constraint exp_strength="0" field="Elevation" notnull_strength="0" unique_strength="0" constraints="0"/>
    <constraint exp_strength="0" field="FType" notnull_strength="0" unique_strength="0" constraints="0"/>
    <constraint exp_strength="0" field="FCode" notnull_strength="0" unique_strength="0" constraints="0"/>
    <constraint exp_strength="0" field="Visibility" notnull_strength="0" unique_strength="0" constraints="0"/>
    <constraint exp_strength="0" field="Shape_Leng" notnull_strength="0" unique_strength="0" constraints="0"/>
    <constraint exp_strength="0" field="Shape_Area" notnull_strength="0" unique_strength="0" constraints="0"/>
    <constraint exp_strength="0" field="NHDPlusID" notnull_strength="0" unique_strength="0" constraints="0"/>
    <constraint exp_strength="0" field="VPUID" notnull_strength="0" unique_strength="0" constraints="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="Permanent_" exp="" desc=""/>
    <constraint field="FDate" exp="" desc=""/>
    <constraint field="Resolution" exp="" desc=""/>
    <constraint field="GNIS_ID" exp="" desc=""/>
    <constraint field="GNIS_Name" exp="" desc=""/>
    <constraint field="AreaSqKm" exp="" desc=""/>
    <constraint field="Elevation" exp="" desc=""/>
    <constraint field="FType" exp="" desc=""/>
    <constraint field="FCode" exp="" desc=""/>
    <constraint field="Visibility" exp="" desc=""/>
    <constraint field="Shape_Leng" exp="" desc=""/>
    <constraint field="Shape_Area" exp="" desc=""/>
    <constraint field="NHDPlusID" exp="" desc=""/>
    <constraint field="VPUID" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortExpression="" sortOrder="0" actionWidgetStyle="dropDown">
    <columns>
      <column width="-1" hidden="0" name="Permanent_" type="field"/>
      <column width="-1" hidden="0" name="FDate" type="field"/>
      <column width="-1" hidden="0" name="Resolution" type="field"/>
      <column width="-1" hidden="0" name="GNIS_ID" type="field"/>
      <column width="-1" hidden="0" name="GNIS_Name" type="field"/>
      <column width="-1" hidden="0" name="AreaSqKm" type="field"/>
      <column width="-1" hidden="0" name="Elevation" type="field"/>
      <column width="-1" hidden="0" name="FType" type="field"/>
      <column width="-1" hidden="0" name="FCode" type="field"/>
      <column width="-1" hidden="0" name="Visibility" type="field"/>
      <column width="-1" hidden="0" name="Shape_Leng" type="field"/>
      <column width="-1" hidden="0" name="Shape_Area" type="field"/>
      <column width="-1" hidden="0" name="NHDPlusID" type="field"/>
      <column width="-1" hidden="0" name="VPUID" type="field"/>
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
    <field name="Elevation" editable="1"/>
    <field name="FCode" editable="1"/>
    <field name="FDate" editable="1"/>
    <field name="FType" editable="1"/>
    <field name="GNIS_ID" editable="1"/>
    <field name="GNIS_Name" editable="1"/>
    <field name="NHDPlusID" editable="1"/>
    <field name="Permanent_" editable="1"/>
    <field name="Resolution" editable="1"/>
    <field name="Shape_Area" editable="1"/>
    <field name="Shape_Leng" editable="1"/>
    <field name="VPUID" editable="1"/>
    <field name="Visibility" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="AreaSqKm" labelOnTop="0"/>
    <field name="Elevation" labelOnTop="0"/>
    <field name="FCode" labelOnTop="0"/>
    <field name="FDate" labelOnTop="0"/>
    <field name="FType" labelOnTop="0"/>
    <field name="GNIS_ID" labelOnTop="0"/>
    <field name="GNIS_Name" labelOnTop="0"/>
    <field name="NHDPlusID" labelOnTop="0"/>
    <field name="Permanent_" labelOnTop="0"/>
    <field name="Resolution" labelOnTop="0"/>
    <field name="Shape_Area" labelOnTop="0"/>
    <field name="Shape_Leng" labelOnTop="0"/>
    <field name="VPUID" labelOnTop="0"/>
    <field name="Visibility" labelOnTop="0"/>
  </labelOnTop>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"GNIS_Name"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
