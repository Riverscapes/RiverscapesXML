"""
This is the most basic example demonstrating how to use RSXML to generate
a project.rs.xml file.

This example creates a project object and includes a single realization with
a single input, intermediate and output dataset. Everything is defined in one
go as arguments to the project constructor. When you are done you simply call
the write() method to write the project XML file to disk.
"""
# in your code you woulf write:
# from riverscapes import rsxml
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
)
from rsxml import Logger
from datetime import date

if __name__ == '__main__':

    log = Logger('Project')

    # Create a new Riverscapes Project from scratch
    project = Project(
        name='Riverscapes Context for Arly',
        proj_path='project.rs.xml',
        project_type='RSContext',
        description='Riverscapes Context pour le bassin versant de larly en France',
        citation='',
        bounds=ProjectBounds(
            centroid=Coords(6.5235, 45.7618),
            bounding_box=BoundingBox(6.2, 6.8, 45.6, 46),
            filepath='project_bounds.json',
        ),
        meta_data=MetaData(values=[Meta('Date de Création', '2023-07-18'), Meta('Bassin Versant', 'Arly')]),
        realizations=[
            Realization(
                xml_id='REALIZATION1',
                name='Riverscapes Context for Arly',
                product_version='Custom',
                date_created=date(2023, 7, 18),
                summary='',
                description='projet personnalisé du Riverscapes Context',
                # meta_data=MetaData(values=[Meta('Test', 'Test Value')]),
                datasets=[
                    Dataset(
                        xml_id='Precip',
                        name='précipitation',
                        path='climat/precipitation.tif',
                        ds_type='Raster',
                        description='précipitation annuelle'
                    ),
                    Dataset(
                        xml_id='CouvertureduSol',
                        name='OCSOL',
                        path = 'couverture_du_sol/ocsol_rousseau_2019_10k.tif',
                        ds_type='Raster',
                        description='OCSOL 2019'
                    ),
                    Dataset(
                        xml_id='OSO',
                        name='OSO 2021',
                        path='couverture_du_sol/oso_2021.shp',
                        ds_type='Vector',
                        description='OSO 2021'
                    ),
                    Dataset(
                        xml_id='ZoneVegetation',
                        name='Zone de vegetation',
                        path='couverture_du_sol/zone_de_vegetation.shp',
                        ds_type='Vector',
                        description='BD TOPO Zone de vegetation'
                    ),
                    Dataset(
                        xml_id='ZoneOccupation',
                        name='Zone Occupation Sol',
                        path='couverture_du_sol/zone_occupation_sol.shp',
                        ds_type='Vector',
                        description='BD CARTO Zone Occupation Sol'  
                    ),
                    Dataset(
                        xml_id='ARRONDISSIMENT',
                        name='Arrondissement',
                        path='fronteieres_politiques/arrondissement.shp',
                        ds_type='Vector',
                        description='BD CARTO Arrondissement'
                    ),
                    Dataset(
                        xml_id='COMMUNE',
                        name='Commune',
                        path='fronteieres_politiques/commune.shp',
                        ds_type='Vector',
                        description='BD CARTO Commune'
                    ),
                    Dataset(
                        xml_id='DEPARTEMENT',
                        name='Département',
                        path='fronteieres_politiques/departement.shp',
                        ds_type='Vector',
                        description='BD CARTO Département'
                    ),
                    Dataset(
                        xml_id='REGION',
                        name='Région',
                        path='fronteieres_politiques/region.shp',
                        ds_type='Vector',
                        description='BD CARTO Région'
                    ),
                    Dataset(
                        xml_id='EPCI',
                        name='EPCI',
                        path='fronteieres_politiques/epci.shp',
                        ds_type='Vector',
                        description='BD CARTO EPCI'
                    ),
                    Dataset(
                        xml_id='GEOLOGIE',
                        name='Géologie',
                        path='geologie/GEO050K_HARM_S_FGEOL_2154.shp',
                        ds_type='Vector',
                        description='base de données géoréférencées de cartes géologiques vectorisées et harmonisées au 1/50 000'
                    ), 
                    Geopackage(
                        xml_id='HYDROLOGIE',
                        name='Hydrologie',
                        path='hydrologie/hydrology.gpkg',
                        # summary='This is a dataset',
                        description='ensembles de données hydrographiques',
                        layers=[
                            GeopackageLayer(
                                lyr_name='BassinVersant',
                                name='Bassin Versant',
                                ds_type=GeoPackageDatasetTypes.VECTOR,
                                description='BD TOPO bassin versant'
                            ),
                            GeopackageLayer(
                                lyr_name='PlanEau',
                                name='Plan Eau',
                                ds_type=GeoPackageDatasetTypes.VECTOR,
                                description='BD TOPO plan eau'
                            ),
                            GeopackageLayer(
                                lyr_name='SurfaceElementaire',
                                name='Surface Elementaire',
                                ds_type=GeoPackageDatasetTypes.VECTOR,
                                description='BD TOPO surface elementaire'
                            ),
                            GeopackageLayer(
                                lyr_name='TronconHydrographique',
                                name='Troncon Hydrographique',
                                ds_type=GeoPackageDatasetTypes.VECTOR,
                                description='BD TOPO troncon hydrographique'
                            )
                        ]
                    ),   
                    Dataset(
                        xml_id='FORET',
                        name='Forêt Publique',
                        path='propriete_fonciere/foret_publique.shp',
                        ds_type='Vector',
                        description='BD TOPO Forêt Publique'
                    ),
                    Dataset(
                        xml_id='PARC',
                        name='Parc ou Réserve',
                        path='propriete_fonciere/parc_ou_reserve.shp',
                        ds_type='Vector',
                        description='BD TOPO Parc ou Réserve'
                    ),
                    Dataset(
                        xml_id='DEM',
                        name='5m DEM',
                        path='topographie/dem.tif',
                        ds_type='Raster',
                        # summary='This is a input dataset',
                        description='RGEALTI altimétrie ',
                    ),
                    Dataset(
                        xml_id='HILLSHADE',
                        name='DEM Hillshade',
                        path='topographie/dem_hillshade.tif',
                        ds_type='Raster',
                        description='dérivée de DEM'
                    ),
                    Dataset(
                        xml_id='SLOPE',
                        name='Pente',
                        path='topographie/slope.tif',
                        ds_type='Raster',
                        description='pente dérivée de DEM'
                    ),
                    Dataset(
                        xml_id='ROUTE',
                        name='Troncon de Route',
                        path='transport/TRONCON_DE_ROUTE.shp',
                        ds_type='Vector',
                        description='BD CARTO Troncon de Route'
                    ),
                    Dataset(
                        xml_id='VOIEFERREE',
                        name='Troncon de Voie Ferrée',
                        path='transport/TRONCON_DE_VOIE_FERREE.shp',
                        ds_type='Vector',
                        description='BD CARTO Troncon de Voie Ferrée'
                    ),
                    Dataset(
                        xml_id='CANAL',
                        name='Troncon de Canal',
                        path='canal.shp',
                        ds_type='Vector',
                        description='Canal de troncon hydrographique'
                    )
                ],
            )
        ]
    )

    # Write it to disk
    project.write()

    log.info('done')
