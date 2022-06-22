# The `extRef=""` attribute external project references

The extRef attribute is a way of referencing an upstream dataset inside your projects.

The main, universal purpose of the `extRef=""` attribute is to create a path for metadata to flow downwards in the system from the outputs of one project to the inputs of the next.

When you use the `extRef=""` attribute and upload your project into the warehouse the dataset in question in the `project.rs.xml` file will be augmented with the metadata from the upstream project.

A secondary benefit of using the `extRef` attribute is the system may only keep one copy of that layer and corresponding map tiles. This sharing will only happen in cases where the layers and the datasets share a 1:1 relationship like a TIF file, SHP file etc. **Geopackages will not be able to use this functionality for reasons we will explain below.**


## The simple 1:1 case (Geotiff, SHP):

For 1:1 layer:dataset types like GeoTiff, SHP, etc. The mechanism for referencing an upstream project is pretty simple:

```xml
<!-- Here's the original Dataset node in a RSContext project -->
<Project>
  <Realizations>
    <Realization id="REAL1">
      <Inputs>
        <DEM id="DEM1">
          <Name>NED 10m DEM</Name>
          <Path>topography/dem.tif</Path>
          <MetaData>
            <Meta name="num_rasters" type="int">2</Meta>
            <Meta name="origin_urls" type="json">[&quot;https://prd-tnm.s3.amazonaws.com/StagedProducts/Elevation/13/IMG/USGS_NED_13_n36w084_IMG.zip&quot;, &quot;https://prd-tnm.s3.amazonaws.com/StagedProducts/Elevation/13/IMG/n35w084.zip&quot;]</Meta>
          </MetaData>
        </DEM>
      </Inputs>
    </Relization>
  </Realizations>
</Project>

<!-- So when the same dataset gets used in VBET it could look like this: -->
<DEM id="VBETDEM" extRef="badfe8c1-0342-4876-8fac-b2eb5493a90f:Project/Realizations/Realization#REAL1/Inputs/DEM#DEM1">
  <Name>VBET Input: NED 10m DEM</Name>
  <Path>inputs/input_dem.tif</Path>
  <MetaData>
    <!-- This metadata is from the original project.rs.xml's project-level meta  -->
    <Meta ext="project" name="dateCreated" type="isodate">2019-09-12T16:42:24.610951</Meta>
    <Meta ext="project" name="HUC8">17010216</Meta>
    <!-- This metadata is from the original project.rs.xml's dataset-level-->
    <Meta ext="dataset" name="num_rasters" type="int">2</Meta>
    <Meta ext="dataset" name="origin_urls" type="json">[&quot;https://prd-tnm.s3.amazonaws.com/StagedProducts/Elevation/13/IMG/USGS_NED_13_n36w084_IMG.zip&quot;, &quot;https://prd-tnm.s3.amazonaws.com/StagedProducts/Elevation/13/IMG/n35w084.zip&quot;]</Meta>
    <!-- this metadata is added by VBET itself and not imported from the upstream project -->
    <Meta name="VBETInputWeight">6.523</Meta>
  </MetaData>
</DEM>
```


### FAQ

1. What form does the `extRef` take?
   * The `extRef` attribute takes the form `PROJECT_GUID:RSXPATH` where `PROJECT_GUID` is the id given to the original project in the warehouse and `RSXPATH` is our own proprietary shorthand for an xpath in a dom that takes the form `TAGNAME#TAGID/TAGNAME#TAGID/TAGNAME#TAGID` ... etc. Note: if there is no TAGID then the hash should be ommitted too like `TAGNAME/TAGNAME` etc..
2. When do I use `extRef` inside `<Geopackage>` like: `<Geopackage extRef="#########">`?
    * Almost never. The one rare case when you might consider this is when the input geopackage comes in completely unaltered. If you do this you should not use extRef in any of the sublayers. This is a special case we're going to have to check for and fail explicitly if we find it.

3. What happens to a tif/shp file if I mutate a layer a little bit but still use `extRef` before uploading it.
    * Your changes will be lost when you upload. `extRef` is only for when you're referencing an upstream project dataset in its original form. If you need to change the layer in any way you should make it an intermediate project and you are responsible for migrating the Metadata yourself.

4. What happens when the upstream project is deleted?
    * The layer from the upstream project will persist until the last downstream project that uses it is removed.

5. What happens if the upstream project changes this layer and re-uploads
    * This is a really important case to understand. We don't have plans to version-control datasets so it means that the next download of the downstream project will include a different input layer than the one used to create it. This is a drawback to this system and somewhat unnavoidable without a lot of extra complexity. Clearly communicating this caveat may be important.