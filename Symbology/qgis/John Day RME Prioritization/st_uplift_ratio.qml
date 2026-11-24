<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.34.0-Prizren" styleCategories="Symbology">
  <renderer-v2 type="graduatedSymbol" attr="st_uplift_ratio" graduatedMethod="GraduatedColor" symbollevels="0" forceraster="0" enableorderby="0" referencescale="-1">
    <ranges>
      <range lower="0" upper="0.1" label="0 &#8211; 0.1" symbol="0" render="true" uuid="{623d4793-443c-4778-98f9-b50a04d9a4bb}"/>
      <range lower="0.1" upper="0.2" label="0.1 &#8211; 0.2" symbol="1" render="true" uuid="{7b3a5478-c9c0-4495-ac7f-37e25a7e5a7c}"/>
      <range lower="0.2" upper="0.3" label="0.2 &#8211; 0.3" symbol="2" render="true" uuid="{05441156-11a9-4283-8aee-ad679be3327f}"/>
      <range lower="0.3" upper="0.5" label="0.3 &#8211; 0.5" symbol="3" render="true" uuid="{dd941304-501c-4b66-b8b6-daf3f53127e1}"/>
      <range lower="0.5" upper="1e+09" label="&gt; 0.5" symbol="4" render="true" uuid="{64aba39f-0ac4-4fbb-ad68-e33af7ed6283}"/>
    </ranges>
    <symbols>
      <symbol name="0" type="fill" alpha="1" clip_to_extent="1" force_rhr="0">
        <layer class="SimpleFill" enabled="1" locked="0" pass="0">
          <Option type="Map">
            <Option name="color" type="QString" value="237,248,251,255"/>
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
            <Option name="color" type="QString" value="179,205,227,255"/>
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
            <Option name="color" type="QString" value="140,150,198,255"/>
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
            <Option name="color" type="QString" value="136,86,167,255"/>
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
            <Option name="color" type="QString" value="129,15,124,255"/>
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
