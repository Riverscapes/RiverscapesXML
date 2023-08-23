from rsxml.project_xml import (
    Project,
    MetaData,
    Meta,
    ProjectBounds,
    Coords,
    BoundingBox,
    Dataset,
    Geopackage,
    GeopackageLayer,
    GeoPackageDatasetTypes,
    Realization,
    Log
)
from rsxml import Logger
from datetime import datetime
import sys
import traceback

if __name__ == '__main__':

    log = Logger('Project')

    # Create a new Riverscapes Project from scratch
    project = Project(
        name='VBET for Arly',
        proj_path='/mnt/c/Users/jordang/Documents/Riverscapes/data/VBET/Arly/project.rs.xml',
        project_type='VBET',
        description='VBET pour le bassin versant de larly en France',
        bounds=ProjectBounds(
            centroid=Coords(6.5235, 45.7618),
            bounding_box=BoundingBox(6.2, 6.8, 45.6, 46),
            filepath='/mnt/c/Users/jordang/Documents/Riverscapes/data/VBET/Arly/project_bounds.json',
        ),
        meta_data=MetaData(values=[Meta('Date de Création', '2023-07-19'), Meta('Bassin Versant', 'Arly')]),
        realizations=[
            Realization(
                xml_id='REALIZATION1',
                name='VBET for Arly',
                product_version='3.0.7',
                date_created=datetime(2023, 7, 19),
                description='projet personnalisé du VBET',
                logs=[
                    Log(
                        xml_id='LOGFILE',
                        name='Log',
                        path='vbet.log',
                    )
                ],
                inputs=[
                    Dataset(
                        xml_id='HILLSHADE',
                        name='DEM Hillshade',
                        path='inputs/dem_hillshade.tif',
                        ds_type='Raster'
                    ),
                    Dataset(
                        xml_id='DEM',
                        name='DEM',
                        path='inputs/dem.tif',
                        ds_type='Raster'
                    ),
                    Dataset(
                        xml_id='SLOPE_RASTER',
                        name='Slope Raster',
                        path='inputs/slope.tif',
                        ds_type='Raster'
                    ),
                    Geopackage(
                        xml_id='INPUTS',
                        name='Inputs',
                        path='inputs/inputs.gpkg',
                        layers=[
                            GeopackageLayer(
                                lyr_name = 'flowlines',
                                name = 'NHD Flowlines',
                                ds_type = GeoPackageDatasetTypes.VECTOR
                            ),
                            GeopackageLayer(
                                lyr_name = 'channel_area_polygons',
                                name = 'Channel Area Polygons',
                                ds_type = GeoPackageDatasetTypes.VECTOR
                            )
                        ]
                    )
                ],
                intermediates=[
                    Dataset(
                        xml_id='PITFILL',
                        name='TauDEM Pitfill',
                        path='intermediates/pitfill.tif',
                        ds_type='Raster'
                    ),
                    Dataset(
                        xml_id='DINFFLOWDIR_ANG',
                        name='TauDEM D-Inf Flow Directions',
                        path='intermediates/dinfflowdir_ang.tif',
                        ds_type='Raster'
                    ),
                    Dataset(
                        xml_id='DINFFLOWDIR_SLP',
                        name='TauDEM D-Inf Flow Directions Slope',
                        path='intermediates/dinfflowdir_slp.tif',
                        ds_type='Raster'
                    ),
                    Dataset(
                        xml_id='VBET_ZONES',
                        name='VBET LevelPath Zones',
                        path='intermediates/vbet_level_path_zones.tif',
                        ds_type='Raster'
                    ),
                    Dataset(
                        xml_id='ACTIVE_FP_ZONES',
                        name='Active Floodplain LevelPath Zones',
                        path='intermediates/active_fp_level_path_zones.tif',
                        ds_type='Raster'
                    ),
                    Dataset(
                        xml_id='INACTIVE_FP_ZONES',
                        name='Inactive Floodplain LevelPath Zones',
                        path='intermediates/inactive_fp_level_path_zones.tif',
                        ds_type='Raster'
                    ),
                    Dataset(
                        xml_id='HAND_RASTER',
                        name='HAND Raster',
                        path='intermediates/hand_composite.tif',
                        ds_type='Raster'
                    ),
                    Dataset(
                        xml_id='TRANSFORMED_HAND',
                        name='Transformed HAND Evidence',
                        path='intermediates/hand_transformed.tif',
                        ds_type='Raster'
                    ),
                    Dataset(
                        xml_id='TRANSFORMED_SLOPE',
                        name='Transformed Slope',
                        path='intermediates/slope_transformed.tif',
                        ds_type='Raster'
                    ),
                    Dataset(
                        xml_id='EVIDENCE_TOPO_INTERIOR',
                        name='Topo Evidence (Interior)',
                        path='intermediates/topographic_evidence_interior.tif',
                        ds_type='Raster'
                    ),
                    Dataset(
                        xml_id='HAND_RASTER_INTERIOR',
                        name='HAND Raster (Interior)',
                        path='intermediates/hand_composite_interior.tif',
                        ds_type='Raster'
                    ),
                    Dataset(
                        xml_id='TRANSFORMED_HAND_INTERIOR',
                        name='Transformed HAND Evidence (Interior)',
                        path='intermediates/hand_transformed_interior.tif',
                        ds_type='Raster'
                    ),
                    Dataset(
                        xml_id='TRANSFORMED_SLOPE_INTERIOR',
                        name='Transformed Slope (Interior)',
                        path='intermediates/slope_transformed_interior.tif',
                        ds_type='Raster'
                    ),
                    Geopackage(
                        xml_id='Intermediates',
                        name='Intermediates',
                        path='intermediates/intermediates.gpkg',
                        layers=[
                            GeopackageLayer(
                                lyr_name = 'vbet_dgos',
                                name = 'VBET DGO Polygons',
                                ds_type = GeoPackageDatasetTypes.VECTOR
                            )
                        ]
                    )
                ],
                outputs=[
                    Dataset(
                        xml_id='VBET_EVIDENCE',
                        name='VBET Evidence Raster',
                        path='outputs/vbet_evidence.tif',
                        ds_type='Raster'
                    ),
                    Geopackage(
                        xml_id='VBET_OUTPUTS',
                        name='VBET',
                        path='outputs/vbet.gpkg',
                        layers=[
                            GeopackageLayer(
                                lyr_name = 'vbet_full',
                                name = 'VBET Full Extent',
                                ds_type = GeoPackageDatasetTypes.VECTOR
                            ),
                            GeopackageLayer(
                                lyr_name = 'active_valley_bottom',
                                name = 'VBET Inactive/Active Boundary',
                                ds_type = GeoPackageDatasetTypes.VECTOR
                            ),
                            GeopackageLayer(
                                lyr_name='vbet_channel_area',
                                name='VBET Channel Area',
                                ds_type=GeoPackageDatasetTypes.VECTOR
                            ),
                            GeopackageLayer(
                                lyr_name='active_floodplain',
                                name='Active Floodplain',
                                ds_type=GeoPackageDatasetTypes.VECTOR
                            ),
                            GeopackageLayer(
                                lyr_name='inactive_floodplain',
                                name='Inactive Floodplain',
                                ds_type=GeoPackageDatasetTypes.VECTOR
                            ),
                            GeopackageLayer(
                                lyr_name='floodplain',
                                name='Floodplain',
                                ds_type=GeoPackageDatasetTypes.VECTOR
                            ),
                            GeopackageLayer(
                                lyr_name='vbet_centerlines',
                                name='VBET Centerline',
                                ds_type=GeoPackageDatasetTypes.VECTOR
                            ),
                            GeopackageLayer(
                                lyr_name='vbet_igos',
                                name='Segmentation Points',
                                ds_type=GeoPackageDatasetTypes.VECTOR
                            ),
                        ]
                    )
                ]
            )
        ]
    )

    #Write it to disk
    try:
        project.write()
    except Exception as e:
        traceback.print_exc(file=sys.stdout)

    log.info('Finished writing project file')