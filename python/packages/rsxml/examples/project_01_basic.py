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
    GeoPackageDatasetTypes,
    Realization,
)
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
        realizations=[
            Realization(
                xml_id='test',
                name='Test Realization',
                product_version='1.0.0',
                date_created=date(2021, 1, 1),
                summary='This is a test realization',
                description='This is a test realization',
                meta_data=MetaData(values=[Meta('Test', 'Test Value')]),
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
                ]
            )
        ]
    )

    # Write it to disk
    project.write()

    log.info('done')
