# in your code you woulf write:
# from riverscapes import rsxml
from rsxml.project_xml import Project, MetaData, Meta, ProjectBounds, Coords, BoundingBox, Dataset, GeoPackageDatasetTypes, Realization, QAQCEvent, Analysis
from rsxml import Logger
from datetime import date

if __name__ == '__main__':
    log = Logger('Project')
    # Create a new Riverscapes Project from scratch
    project = Project(
        name='Test Project',
        proj_path='project.rs.xml',
        project_type='VBET',
        description='This is a test project',
        citation='This is a citation',
        bounds=ProjectBounds(
            centroid=Coords(-21.23, 114.56),
            bounding_box=BoundingBox(-22, -21, 114, 116),
            filepath='project_bounds.json',
        ),
        meta_data=MetaData(values=[Meta('Test', 'Test Value')]),
        qaqc_events=[
            QAQCEvent(
                date_performed=date(2021, 1, 1),
                performed_by='Larry the testing guy',
                state='passed',
                name='Test QAQC Event',
                summary='This is a test QAQC event',
                description='I did a thing and then a thing happened',
                citation='This is a citation',
                meta_data=MetaData(values=[Meta('Test', 'Test Value')]),
                links={
                    'link1': 'https://www.google.com',
                    'link2': 'https://www.google.com',
                }
            )
        ],
        common_datasets=[
            Dataset(
                xml_id='test',
                name='Test Dataset 2',
                path='test.gpkg',
                ds_type=GeoPackageDatasetTypes.VECTOR,
                ext_ref='f23b187a-537b-4dd0-8b71-4b7c4a6e9747:Project/Realizations/Realization#REALIZATION1/Datasets/Raster#DEM',
                summary='This is a test dataset',
                description='This is a test dataset',
            )
        ],
        realizations=[
            Realization(
                xml_id='test',
                name='Test Realization',
                product_version='1.0.0',
                date_created=date(2021, 1, 1),
                summary='This is a test realization',
                description='This is a test realization',
                meta_data=MetaData(values=[Meta('Test', 'Test Value')]),
                datasets=[
                    Dataset(
                        xml_id='ds1',
                        name='Dataset1',
                        path='datasets/ds1.gpkg',
                        ds_type=GeoPackageDatasetTypes.VECTOR,
                        summary='This is a dataset',
                        description='This is a dataset',
                    )
                ],
                inputs=[
                    Dataset(
                        xml_id='input1',
                        name='InputDS1',
                        path='datasets/input1.tiff',
                        ds_type=GeoPackageDatasetTypes.RASTER,
                        summary='This is a input dataset',
                        description='This is a input dataset',
                    )
                ],
                intermediates=[
                    Dataset(
                        xml_id='inter1',
                        name='inter1DS',
                        path='datasets/inter1.tiff',
                        ds_type=GeoPackageDatasetTypes.RASTER,
                        summary='This is a input dataset',
                        description='This is a input dataset',
                    )
                ],
                outputs=[
                    Dataset(
                        xml_id='output1',
                        name='OutputDS1',
                        path='datasets/output.tiff',
                        ds_type=GeoPackageDatasetTypes.RASTER,
                        summary='This is a input dataset',
                        description='This is a input dataset',
                    )
                ],
                analyses=[
                    Analysis(
                        xml_id='analysis1',
                        name='Test Analysis',
                        metrics=MetaData(values=[Meta('Test', 'Test Value')]),
                        configuration=[
                            Dataset(
                                xml_id='conf1',
                                name='Configuration Dataset',
                                path='analysis/conf.gpkg',
                                ds_type=GeoPackageDatasetTypes.VECTOR,
                                summary='This is a conf dataset',
                                description='This is a conf dataset',
                            )
                        ],
                        products=[
                            Dataset(
                                xml_id='prod1',
                                name='Product Dataset',
                                path='products/prod.gpkg',
                                ds_type=GeoPackageDatasetTypes.VECTOR,
                                summary='This is a prod dataset',
                                description='This is a prod dataset',
                            )
                        ]
                    )
                ]
            )
        ]
    )

    # Add some more project metadata
    project.meta_data.add_meta('Test2', 'Test Value 2')

    # Add a dataset
    my_real = project.realizations[0]
    my_real.datasets.append(
        Dataset(
            xml_id='test2',
            name='Test Dataset 2',
            path='test2.gpkg',
            ds_type='CSV',
            ext_ref='f23b187a-537b-4dd0-8b71-4b7c4a6e9747:Project/Realizations/Realization#REALIZATION1/Datasets/Raster#DEM',
            summary='This is a test dataset 2',
            description='This is a test dataset 2'
        )
    )

    # Write it to disk
    project.write()

    # Now open and parse it
    new_project = Project.load_project('project.rs.xml')

    project.write()

    log.info('done')
