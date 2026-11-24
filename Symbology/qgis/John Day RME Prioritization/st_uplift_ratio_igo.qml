<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.34.0-Prizren" styleCategories="Symbology">
  <renderer-v2 type="graduatedSymbol" attr="st_uplift_ratio" graduatedMethod="GraduatedColor" symbollevels="0" forceraster="0" enableorderby="0" referencescale="-1">
    <ranges>
      <range lower="0" upper="0.1" label="0 &#8211; 0.1" symbol="0" render="true" uuid="{32d1b3ce-3e3a-4e18-a79c-434e3689ca29}"/>
      <range lower="0.1" upper="0.2" label="0.1 &#8211; 0.2" symbol="1" render="true" uuid="{8dce890d-d4be-4532-9571-77b225b4f0e4}"/>
      <range lower="0.2" upper="0.3" label="0.2 &#8211; 0.3" symbol="2" render="true" uuid="{99839d92-972b-4311-8a60-682a828747b8}"/>
      <range lower="0.3" upper="0.5" label="0.3 &#8211; 0.5" symbol="3" render="true" uuid="{45b10fd9-7860-4379-ba8d-accfbd55ef36}"/>
      <range lower="0.5" upper="1e+09" label="&gt; 0.5" symbol="4" render="true" uuid="{27cff2d8-67ae-44c4-b7f7-8028be5e3dae}"/>
    </ranges>
    <symbols>
      <symbol name="0" type="marker" alpha="1" clip_to_extent="1" force_rhr="0">
        <layer class="SimpleMarker" enabled="1" locked="0" pass="0">
          <Option type="Map">
            <Option name="color" type="QString" value="237,248,251,255"/>
            <Option name="name" type="QString" value="circle"/>
            <Option name="size" type="QString" value="2"/>
            <Option name="size_unit" type="QString" value="MM"/>
            <Option name="outline_color" type="QString" value="77,77,77,255"/>
            <Option name="outline_style" type="QString" value="solid"/>
            <Option name="outline_width" type="QString" value="0.1"/>
            <Option name="outline_width_unit" type="QString" value="MM"/>
            <Option name="scale_method" type="QString" value="diameter"/>
          </Option>
        </layer>
      </symbol>
      <symbol name="1" type="marker" alpha="1" clip_to_extent="1" force_rhr="0">
        <layer class="SimpleMarker" enabled="1" locked="0" pass="0">
          <Option type="Map">
            <Option name="color" type="QString" value="179,205,227,255"/>
            <Option name="name" type="QString" value="circle"/>
            <Option name="size" type="QString" value="2"/>
            <Option name="size_unit" type="QString" value="MM"/>
            <Option name="outline_color" type="QString" value="77,77,77,255"/>
            <Option name="outline_style" type="QString" value="solid"/>
            <Option name="outline_width" type="QString" value="0.1"/>
            <Option name="outline_width_unit" type="QString" value="MM"/>
            <Option name="scale_method" type="QString" value="diameter"/>
          </Option>
        </layer>
      </symbol>
      <symbol name="2" type="marker" alpha="1" clip_to_extent="1" force_rhr="0">
        <layer class="SimpleMarker" enabled="1" locked="0" pass="0">
          <Option type="Map">
            <Option name="color" type="QString" value="140,150,198,255"/>
            <Option name="name" type="QString" value="circle"/>
            <Option name="size" type="QString" value="2"/>
            <Option name="size_unit" type="QString" value="MM"/>
            <Option name="outline_color" type="QString" value="77,77,77,255"/>
            <Option name="outline_style" type="QString" value="solid"/>
            <Option name="outline_width" type="QString" value="0.1"/>
            <Option name="outline_width_unit" type="QString" value="MM"/>
            <Option name="scale_method" type="QString" value="diameter"/>
          </Option>
        </layer>
      </symbol>
      <symbol name="3" type="marker" alpha="1" clip_to_extent="1" force_rhr="0">
        <layer class="SimpleMarker" enabled="1" locked="0" pass="0">
          <Option type="Map">
            <Option name="color" type="QString" value="136,86,167,255"/>
            <Option name="name" type="QString" value="circle"/>
            <Option name="size" type="QString" value="2"/>
            <Option name="size_unit" type="QString" value="MM"/>
            <Option name="outline_color" type="QString" value="77,77,77,255"/>
            <Option name="outline_style" type="QString" value="solid"/>
            <Option name="outline_width" type="QString" value="0.1"/>
            <Option name="outline_width_unit" type="QString" value="MM"/>
            <Option name="scale_method" type="QString" value="diameter"/>
          </Option>
        </layer>
      </symbol>
      <symbol name="4" type="marker" alpha="1" clip_to_extent="1" force_rhr="0">
        <layer class="SimpleMarker" enabled="1" locked="0" pass="0">
          <Option type="Map">
            <Option name="color" type="QString" value="129,15,124,255"/>
            <Option name="name" type="QString" value="circle"/>
            <Option name="size" type="QString" value="2"/>
            <Option name="size_unit" type="QString" value="MM"/>
            <Option name="outline_color" type="QString" value="77,77,77,255"/>
            <Option name="outline_style" type="QString" value="solid"/>
            <Option name="outline_width" type="QString" value="0.1"/>
            <Option name="outline_width_unit" type="QString" value="MM"/>
            <Option name="scale_method" type="QString" value="diameter"/>
          </Option>
        </layer>
      </symbol>
    </symbols>
    <source-symbol>
      <symbol name="0" type="marker" alpha="1" clip_to_extent="1" force_rhr="0">
        <layer class="SimpleMarker" enabled="1" locked="0" pass="0">
          <Option type="Map">
            <Option name="color" type="QString" value="153,153,153,255"/>
            <Option name="name" type="QString" value="circle"/>
            <Option name="size" type="QString" value="2"/>
            <Option name="size_unit" type="QString" value="MM"/>
            <Option name="outline_color" type="QString" value="77,77,77,255"/>
            <Option name="outline_style" type="QString" value="solid"/>
            <Option name="outline_width" type="QString" value="0.1"/>
            <Option name="outline_width_unit" type="QString" value="MM"/>
            <Option name="scale_method" type="QString" value="diameter"/>
          </Option>
        </layer>
      </symbol>
    </source-symbol>
    <mode name="manual"/>
    <labelformat format="%1 - %2" trimtrailingzeroes="1" decimalplaces="2"/>
  </renderer-v2>
</qgis>
