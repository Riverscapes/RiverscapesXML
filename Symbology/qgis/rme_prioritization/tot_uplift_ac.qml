<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.34.0-Prizren" styleCategories="Symbology">
  <renderer-v2 type="graduatedSymbol" attr="tot_uplift_ac" graduatedMethod="GraduatedColor" symbollevels="0" forceraster="0" enableorderby="0" referencescale="-1">
    <ranges>
      <range lower="0" upper="0" label="0 ac" symbol="0" render="true" uuid="{829f5d6d-f5de-471f-9de5-07dce709babd}"/>
      <range lower="1e-09" upper="0.25" label="0 &#8211; 0.25 ac" symbol="1" render="true" uuid="{0c85e5a3-d83a-4c27-b7ba-cf86bc64b613}"/>
      <range lower="0.25" upper="0.5" label="0.25 &#8211; 0.5 ac" symbol="2" render="true" uuid="{9fc63023-6176-4209-bd29-57e31ef50e06}"/>
      <range lower="0.5" upper="1" label="0.5 &#8211; 1 ac" symbol="3" render="true" uuid="{43396807-cce3-42a3-951d-b8328874cfbf}"/>
      <range lower="1" upper="2" label="1 &#8211; 2 ac" symbol="4" render="true" uuid="{84a11787-692f-4b80-b826-148e861d9550}"/>
      <range lower="2" upper="1e+09" label="&gt; 2 ac" symbol="5" render="true" uuid="{140fa43f-19c8-42be-9f0f-32f38ef13ee1}"/>
    </ranges>
    <symbols>
      <symbol name="0" type="fill" alpha="1" clip_to_extent="1" force_rhr="0">
        <layer class="SimpleFill" enabled="1" locked="0" pass="0">
          <Option type="Map">
            <Option name="color" type="QString" value="230,230,230,255"/>
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
            <Option name="color" type="QString" value="255,255,204,255"/>
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
            <Option name="color" type="QString" value="194,230,153,255"/>
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
            <Option name="color" type="QString" value="120,198,121,255"/>
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
            <Option name="color" type="QString" value="49,163,84,255"/>
            <Option name="style" type="QString" value="solid"/>
            <Option name="outline_color" type="QString" value="255,255,255,180"/>
            <Option name="outline_style" type="QString" value="solid"/>
            <Option name="outline_width" type="QString" value="0.06"/>
            <Option name="outline_width_unit" type="QString" value="MM"/>
            <Option name="joinstyle" type="QString" value="bevel"/>
          </Option>
        </layer>
      </symbol>
      <symbol name="5" type="fill" alpha="1" clip_to_extent="1" force_rhr="0">
        <layer class="SimpleFill" enabled="1" locked="0" pass="0">
          <Option type="Map">
            <Option name="color" type="QString" value="0,104,55,255"/>
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
