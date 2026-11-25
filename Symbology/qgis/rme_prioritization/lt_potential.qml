<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.34.0-Prizren" styleCategories="Symbology">
  <renderer-v2 type="graduatedSymbol" attr="lt_potential" graduatedMethod="GraduatedColor" symbollevels="0" forceraster="0" enableorderby="0" referencescale="-1">
    <ranges>
      <range lower="0" upper="0.2" label="0 &#8211; 0.2" symbol="0" render="true" uuid="{09c0f280-2b0f-458f-9093-8c10f7a07916}"/>
      <range lower="0.2" upper="0.4" label="0.2 &#8211; 0.4" symbol="1" render="true" uuid="{212ae79d-e022-4e23-bf16-51394dabfdac}"/>
      <range lower="0.4" upper="0.6" label="0.4 &#8211; 0.6" symbol="2" render="true" uuid="{3e712d0e-4853-4c96-bf71-eb6f1ad12dc2}"/>
      <range lower="0.6" upper="0.8" label="0.6 &#8211; 0.8" symbol="3" render="true" uuid="{fddcc43c-fe4d-4d2f-81fe-ea3645a77bed}"/>
      <range lower="0.8" upper="1e+09" label="&gt; 0.8" symbol="4" render="true" uuid="{f49b199b-3cfa-4be1-a195-66e5037a674b}"/>
    </ranges>
    <symbols>
      <symbol name="0" type="fill" alpha="1" clip_to_extent="1" force_rhr="0">
        <layer class="SimpleFill" enabled="1" locked="0" pass="0">
          <Option type="Map">
            <Option name="color" type="QString" value="241,238,246,255"/>
            <Option name="style" type="QString" value="solid"/>
            <Option name="outline_color" type="QString" value="255,255,255,180"/>
            <Option name="outline_style" type="QString" value="solid"/>
            <Option name="outline_width" type="QString" value="0.06"/>
            <Option name="outline_width_unit" type="QString" value="MM"/>
            <Option name="joinstyle" type="QString" value="bevel"/>
          </Option>
        </layer>
      </symbol>
      <symbol name="1" type="fill" alpha="1" clip_to_extent="1" force_rhr="0">
        <layer class="SimpleFill" enabled="1" locked="0" pass="0">
          <Option type="Map">
            <Option name="color" type="QString" value="215,181,216,255"/>
            <Option name="style" type="QString" value="solid"/>
            <Option name="outline_color" type="QString" value="255,255,255,180"/>
            <Option name="outline_style" type="QString" value="solid"/>
            <Option name="outline_width" type="QString" value="0.06"/>
            <Option name="outline_width_unit" type="QString" value="MM"/>
            <Option name="joinstyle" type="QString" value="bevel"/>
          </Option>
        </layer>
      </symbol>
      <symbol name="2" type="fill" alpha="1" clip_to_extent="1" force_rhr="0">
        <layer class="SimpleFill" enabled="1" locked="0" pass="0">
          <Option type="Map">
            <Option name="color" type="QString" value="223,101,176,255"/>
            <Option name="style" type="QString" value="solid"/>
            <Option name="outline_color" type="QString" value="255,255,255,180"/>
            <Option name="outline_style" type="QString" value="solid"/>
            <Option name="outline_width" type="QString" value="0.06"/>
            <Option name="outline_width_unit" type="QString" value="MM"/>
            <Option name="joinstyle" type="QString" value="bevel"/>
          </Option>
        </layer>
      </symbol>
      <symbol name="3" type="fill" alpha="1" clip_to_extent="1" force_rhr="0">
        <layer class="SimpleFill" enabled="1" locked="0" pass="0">
          <Option type="Map">
            <Option name="color" type="QString" value="221,28,119,255"/>
            <Option name="style" type="QString" value="solid"/>
            <Option name="outline_color" type="QString" value="255,255,255,180"/>
            <Option name="outline_style" type="QString" value="solid"/>
            <Option name="outline_width" type="QString" value="0.06"/>
            <Option name="outline_width_unit" type="QString" value="MM"/>
            <Option name="joinstyle" type="QString" value="bevel"/>
          </Option>
        </layer>
      </symbol>
      <symbol name="4" type="fill" alpha="1" clip_to_extent="1" force_rhr="0">
        <layer class="SimpleFill" enabled="1" locked="0" pass="0">
          <Option type="Map">
            <Option name="color" type="QString" value="152,0,67,255"/>
            <Option name="style" type="QString" value="solid"/>
            <Option name="outline_color" type="QString" value="255,255,255,180"/>
            <Option name="outline_style" type="QString" value="solid"/>
            <Option name="outline_width" type="QString" value="0.06"/>
            <Option name="outline_width_unit" type="QString" value="MM"/>
            <Option name="joinstyle" type="QString" value="bevel"/>
          </Option>
        </layer>
      </symbol>
    </symbols>
    <source-symbol>
      <symbol name="0" type="fill" alpha="1" clip_to_extent="1" force_rhr="0">
        <layer class="SimpleFill" enabled="1" locked="0" pass="0">
          <Option type="Map">
            <Option name="color" type="QString" value="153,153,153,255"/>
            <Option name="style" type="QString" value="solid"/>
            <Option name="outline_color" type="QString" value="255,255,255,180"/>
            <Option name="outline_style" type="QString" value="solid"/>
            <Option name="outline_width" type="QString" value="0.06"/>
            <Option name="outline_width_unit" type="QString" value="MM"/>
            <Option name="joinstyle" type="QString" value="bevel"/>
          </Option>
        </layer>
      </symbol>
    </source-symbol>
    <mode name="manual"/>
    <labelformat format="%1 - %2" trimtrailingzeroes="1" decimalplaces="2"/>
  </renderer-v2>
</qgis>
