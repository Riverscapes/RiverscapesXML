<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<<<<<<< HEAD
<qgis maxScale="0" minScale="1e+08" version="3.16.8-Hannover" hasScaleBasedVisibilityFlag="0" styleCategories="AllStyleCategories">
=======
<qgis styleCategories="AllStyleCategories" version="3.20.0-Odense" maxScale="0" minScale="0" hasScaleBasedVisibilityFlag="0">
>>>>>>> 3f5296e (Authored .qml for Topography inputs)
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
<<<<<<< HEAD
  </flags>
  <temporal fetchMode="0" enabled="0" mode="0">
=======
    <Private>0</Private>
  </flags>
  <temporal fetchMode="0" mode="0" enabled="0">
>>>>>>> 3f5296e (Authored .qml for Topography inputs)
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <customproperties>
<<<<<<< HEAD
    <property value="false" key="WMSBackgroundLayer"/>
    <property value="false" key="WMSPublishDataSourceUrl"/>
    <property value="0" key="embeddedWidgets/count"/>
    <property value="Value" key="identify/format"/>
  </customproperties>
  <pipe>
    <provider>
      <resampling zoomedInResamplingMethod="nearestNeighbour" zoomedOutResamplingMethod="nearestNeighbour" maxOversampling="2" enabled="false"/>
    </provider>
    <rasterrenderer classificationMin="2.1731e-11" type="singlebandpseudocolor" alphaBand="-1" opacity="0.6" nodataColor="" classificationMax="1.85366e-09" band="1">
      <rasterTransparency/>
=======
    <Option/>
  </customproperties>
  <pipe>
    <provider>
      <resampling zoomedInResamplingMethod="nearestNeighbour" zoomedOutResamplingMethod="nearestNeighbour" enabled="false" maxOversampling="2"/>
    </provider>
    <rasterrenderer opacity="1" nodataColor="" classificationMin="8.57272863577342e-15" classificationMax="8.1995577582582e-10" type="singlebandpseudocolor" band="1" alphaBand="-1">
>>>>>>> 3f5296e (Authored .qml for Topography inputs)
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <rastershader>
<<<<<<< HEAD
        <colorrampshader clip="0" colorRampType="INTERPOLATED" classificationMode="1" maximumValue="1.85366e-09" minimumValue="2.1731000000000001e-11" labelPrecision="4">
          <colorramp name="[source]" type="gradient">
            <prop k="color1" v="0,32,77,255"/>
            <prop k="color2" v="255,234,70,255"/>
            <prop k="discrete" v="0"/>
            <prop k="rampType" v="gradient"/>
            <prop k="stops" v="0.0039063;0,33,78,255:0.0078125;0,34,80,255:0.0117188;0,34,82,255:0.015625;0,35,83,255:0.0195313;0,36,85,255:0.0234375;0,37,87,255:0.0273438;0,37,88,255:0.03125;0,38,90,255:0.0351563;0,39,92,255:0.0390625;0,39,94,255:0.0429688;0,40,96,255:0.046875;0,41,97,255:0.0507813;0,42,99,255:0.0546875;0,42,101,255:0.0585938;0,43,103,255:0.0625;0,44,105,255:0.0664063;0,44,106,255:0.0703125;0,45,108,255:0.0742188;0,46,110,255:0.078125;0,46,111,255:0.0820313;0,47,111,255:0.0859375;0,47,111,255:0.0898438;0,48,111,255:0.09375;0,48,111,255:0.0976563;0,49,111,255:0.101563;0,50,111,255:0.105469;0,51,111,255:0.109375;0,51,111,255:0.113281;0,52,111,255:0.117188;0,53,110,255:0.121094;1,54,110,255:0.125;6,54,110,255:0.128906;11,55,110,255:0.132813;15,56,110,255:0.136719;18,56,109,255:0.140625;21,57,109,255:0.144531;24,58,109,255:0.148438;26,59,109,255:0.152344;29,59,109,255:0.15625;31,60,109,255:0.160156;33,61,109,255:0.164063;35,62,108,255:0.167969;36,62,108,255:0.171875;38,63,108,255:0.175781;40,64,108,255:0.179688;42,64,108,255:0.183594;43,65,108,255:0.1875;45,66,108,255:0.191406;46,67,108,255:0.195313;48,67,108,255:0.199219;49,68,107,255:0.203125;50,69,107,255:0.207031;52,69,107,255:0.210938;53,70,107,255:0.214844;54,71,107,255:0.21875;56,72,107,255:0.222656;57,72,107,255:0.226563;58,73,107,255:0.230469;59,74,107,255:0.234375;61,74,107,255:0.238281;62,75,107,255:0.242188;63,76,107,255:0.246094;64,77,107,255:0.25;65,77,107,255:0.253906;66,78,107,255:0.257813;67,79,107,255:0.261719;68,79,107,255:0.265625;70,80,107,255:0.269531;71,81,107,255:0.273438;72,82,107,255:0.277344;73,82,107,255:0.28125;74,83,107,255:0.285156;75,84,108,255:0.289063;76,84,108,255:0.292969;77,85,108,255:0.296875;78,86,108,255:0.300781;79,87,108,255:0.304688;80,87,108,255:0.308594;81,88,108,255:0.3125;82,89,108,255:0.316406;83,89,108,255:0.320313;84,90,108,255:0.324219;85,91,109,255:0.328125;86,92,109,255:0.332031;87,92,109,255:0.335938;88,93,109,255:0.339844;89,94,109,255:0.34375;89,95,109,255:0.347656;90,95,109,255:0.351563;91,96,110,255:0.355469;92,97,110,255:0.359375;93,97,110,255:0.363281;94,98,110,255:0.367188;95,99,110,255:0.371094;96,100,111,255:0.375;97,100,111,255:0.378906;98,101,111,255:0.382813;99,102,111,255:0.386719;100,102,111,255:0.390625;100,103,112,255:0.394531;101,104,112,255:0.398438;102,105,112,255:0.402344;103,105,112,255:0.40625;104,106,113,255:0.410156;105,107,113,255:0.414063;106,108,113,255:0.417969;107,108,113,255:0.421875;108,109,114,255:0.425781;108,110,114,255:0.429688;109,110,114,255:0.433594;110,111,115,255:0.4375;111,112,115,255:0.441406;112,113,115,255:0.445313;113,113,116,255:0.449219;114,114,116,255:0.453125;114,115,116,255:0.457031;115,116,117,255:0.460938;116,116,117,255:0.464844;117,117,117,255:0.46875;118,118,118,255:0.472656;119,119,118,255:0.476563;120,119,119,255:0.480469;120,120,119,255:0.484375;121,121,119,255:0.488281;122,122,120,255:0.492188;123,122,120,255:0.496094;124,123,120,255:0.5;125,124,120,255:0.503906;126,125,120,255:0.507813;127,125,120,255:0.511719;128,126,121,255:0.515625;129,127,121,255:0.519531;130,128,121,255:0.523438;131,128,121,255:0.527344;132,129,121,255:0.53125;132,130,121,255:0.535156;133,131,121,255:0.539063;134,131,121,255:0.542969;135,132,121,255:0.546875;136,133,121,255:0.550781;137,134,121,255:0.554688;138,135,121,255:0.558594;139,135,121,255:0.5625;140,136,121,255:0.566406;141,137,121,255:0.570313;142,138,121,255:0.574219;143,138,121,255:0.578125;144,139,121,255:0.582031;145,140,120,255:0.585938;146,141,120,255:0.589844;147,142,120,255:0.59375;148,142,120,255:0.597656;149,143,120,255:0.601563;150,144,120,255:0.605469;151,145,120,255:0.609375;152,146,120,255:0.613281;153,146,120,255:0.617188;154,147,119,255:0.621094;155,148,119,255:0.625;156,149,119,255:0.628906;157,150,119,255:0.632813;158,150,119,255:0.636719;159,151,119,255:0.640625;160,152,119,255:0.644531;161,153,118,255:0.648438;162,154,118,255:0.652344;163,154,118,255:0.65625;164,155,118,255:0.660156;165,156,118,255:0.664063;166,157,117,255:0.667969;168,158,117,255:0.671875;169,159,117,255:0.675781;170,159,117,255:0.679688;171,160,116,255:0.683594;172,161,116,255:0.6875;173,162,116,255:0.691406;174,163,116,255:0.695313;175,164,115,255:0.699219;176,164,115,255:0.703125;177,165,115,255:0.707031;178,166,114,255:0.710938;179,167,114,255:0.714844;180,168,114,255:0.71875;181,169,113,255:0.722656;182,169,113,255:0.726563;183,170,113,255:0.730469;184,171,112,255:0.734375;185,172,112,255:0.738281;186,173,112,255:0.742188;187,174,111,255:0.746094;188,175,111,255:0.75;190,175,111,255:0.753906;191,176,110,255:0.757813;192,177,110,255:0.761719;193,178,109,255:0.765625;194,179,109,255:0.769531;195,180,109,255:0.773438;196,181,108,255:0.777344;197,181,108,255:0.78125;198,182,107,255:0.785156;199,183,107,255:0.789063;200,184,106,255:0.792969;201,185,106,255:0.796875;203,186,105,255:0.800781;204,187,105,255:0.804688;205,188,104,255:0.808594;206,188,104,255:0.8125;207,189,103,255:0.816406;208,190,103,255:0.820313;209,191,102,255:0.824219;210,192,102,255:0.828125;211,193,101,255:0.832031;212,194,100,255:0.835938;214,195,100,255:0.839844;215,196,99,255:0.84375;216,197,99,255:0.847656;217,197,98,255:0.851563;218,198,97,255:0.855469;219,199,97,255:0.859375;220,200,96,255:0.863281;221,201,95,255:0.867188;222,202,95,255:0.871094;224,203,94,255:0.875;225,204,93,255:0.878906;226,205,92,255:0.882813;227,206,92,255:0.886719;228,207,91,255:0.890625;229,208,90,255:0.894531;230,209,89,255:0.898438;232,210,89,255:0.902344;233,211,88,255:0.90625;234,211,87,255:0.910156;235,212,86,255:0.914063;236,213,85,255:0.917969;237,214,84,255:0.921875;239,215,83,255:0.925781;240,216,82,255:0.929688;241,217,81,255:0.933594;242,218,80,255:0.9375;243,219,79,255:0.941406;244,220,78,255:0.945313;246,221,77,255:0.949219;247,222,76,255:0.953125;248,223,75,255:0.957031;249,224,74,255:0.960938;250,225,73,255:0.964844;251,226,72,255:0.96875;253,227,70,255:0.972656;254,228,69,255:0.976563;255,229,68,255:0.980469;255,230,66,255:0.984375;255,231,66,255:0.988281;255,232,67,255"/>
          </colorramp>
          <item color="#828282" alpha="255" label="8.57254e-15" value="2.1731e-11"/>
          <item color="#eda113" alpha="255" label=" " value="3.69375e-10"/>
          <item color="#ffff00" alpha="255" label=" " value="7.17019e-10"/>
          <item color="#00db00" alpha="255" label=" " value="1.06466e-09"/>
          <item color="#20998f" alpha="255" label=" " value="1.41231e-09"/>
          <item color="#0b2c7a" alpha="255" label="1.85366e-09" value="1.85366e-09"/>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast contrast="0" gamma="1" brightness="0"/>
    <huesaturation colorizeOn="0" colorizeGreen="128" grayscaleMode="0" saturation="0" colorizeBlue="128" colorizeStrength="100" colorizeRed="255"/>
=======
        <colorrampshader minimumValue="8.5727286357734152e-15" classificationMode="1" maximumValue="8.1995577582581982e-10" labelPrecision="6" colorRampType="INTERPOLATED" clip="0">
          <colorramp name="[source]" type="gradient">
            <Option type="Map">
              <Option value="130,130,130,255" name="color1" type="QString"/>
              <Option value="11,44,122,255" name="color2" type="QString"/>
              <Option value="0" name="discrete" type="QString"/>
              <Option value="gradient" name="rampType" type="QString"/>
              <Option value="0.2;237,161,19,255:0.4;255,255,0,255:0.6;0,219,0,255:0.8;32,153,143,255" name="stops" type="QString"/>
            </Option>
            <prop v="130,130,130,255" k="color1"/>
            <prop v="11,44,122,255" k="color2"/>
            <prop v="0" k="discrete"/>
            <prop v="gradient" k="rampType"/>
            <prop v="0.2;237,161,19,255:0.4;255,255,0,255:0.6;0,219,0,255:0.8;32,153,143,255" k="stops"/>
          </colorramp>
          <item color="#828282" value="8.57272863577342e-15" label="8.57e-15" alpha="255"/>
          <item color="#eda113" value="1.63998013348073e-10" label="1.64e-10" alpha="255"/>
          <item color="#ffff00" value="3.27987453967509e-10" label="3.28e-10" alpha="255"/>
          <item color="#00db00" value="4.91976894586946e-10" label="4.92e-10" alpha="255"/>
          <item color="#20998f" value="6.55966335206383e-10" label="6.56e-10" alpha="255"/>
          <item color="#0b2c7a" value="8.1995577582582e-10" label="8.2e-10" alpha="255"/>
          <rampLegendSettings direction="0" suffix="" maximumLabel="" minimumLabel="" orientation="2" useContinuousLegend="1" prefix="">
            <numericFormat id="basic">
              <Option type="Map">
                <Option value="" name="decimal_separator" type="QChar"/>
                <Option value="6" name="decimals" type="int"/>
                <Option value="0" name="rounding_type" type="int"/>
                <Option value="false" name="show_plus" type="bool"/>
                <Option value="true" name="show_thousand_separator" type="bool"/>
                <Option value="false" name="show_trailing_zeros" type="bool"/>
                <Option value="" name="thousand_separator" type="QChar"/>
              </Option>
            </numericFormat>
          </rampLegendSettings>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast brightness="0" gamma="1" contrast="0"/>
    <huesaturation grayscaleMode="0" colorizeRed="255" colorizeOn="0" colorizeBlue="128" saturation="0" colorizeGreen="128" colorizeStrength="100"/>
>>>>>>> 3f5296e (Authored .qml for Topography inputs)
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
