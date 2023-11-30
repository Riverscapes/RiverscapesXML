# in your code you would write:
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
import tempfile
# logging is always a good practice
from rsxml import Logger
from datetime import datetime


def main(filepath: str):
    log = Logger('Project')

    # Create a new Riverscapes Project from scratch
    project = Project(
        name='Bear River Watershed Conservation Prioritization',
        proj_path='WCP',
        project_type='Watershed Conservation Prioritization',
        description='This is a test project',
        citation='This is a citation',
        bounds=ProjectBounds(
            centroid=Coords(-111.39, 41.62),
            bounding_box=BoundingBox(-112, 39, -110, 43),
            filepath='project_Bounds.json',
        ),
        meta_data=MetaData(values=[Meta('Test', 'Test Value')]),
        realizations=[
            Realization(
                xml_id='test',
                name='Test Realization',
                product_version='1.0.0',
                date_created=datetime(2021, 1, 1),
                summary='This is a test realization',
                description='This is a test realization',
                meta_data=MetaData(values=[Meta('Test', 'Test Value')]),
                inputs=[
                    Dataset(
                        xml_id='input1',
                        name='InputDS1',
                        path='Context/Land_Ownership.shp',
                        ds_type=GeoPackageDatasetTypes.VECTOR,
                        summary='This is a input dataset',
                        description='This is a input dataset',
                    ),
                    Dataset(
                        xml_id='input2',
                        name='InputDS2',
                        path='Context/WBHU4.shp',
                        ds_type=GeoPackageDatasetTypes.VECTOR,
                        summary='This is a input dataset',
                        description='This is a input dataset',
                    ),
                    Dataset(
                        xml_id='input3',
                        name='InputDS3',
                        path='Context/WBDHU8_16010101.shp',
                        ds_type=GeoPackageDatasetTypes.VECTOR,
                        summary='This is a input dataset',
                        description='This is a input dataset',
                    ),
                    Dataset(
                        xml_id='input4',
                        name='InputDS4',
                        path='Context/WBDHU8_16010102.shp',
                        ds_type=GeoPackageDatasetTypes.VECTOR,
                        summary='This is a input dataset',
                        description='This is a input dataset',
                    ),
                    Dataset(
                        xml_id='input5',
                        name='InputDS5',
                        path='Context/WBDHU8_16010201.shp',
                        ds_type=GeoPackageDatasetTypes.VECTOR,
                        summary='This is a input dataset',
                        description='This is a input dataset',
                    ),
                    Dataset(
                        xml_id='input6',
                        name='InputDS6',
                        path='Context/WBDHU8_16010202.shp',
                        ds_type=GeoPackageDatasetTypes.VECTOR,
                        summary='This is a input dataset',
                        description='This is a input dataset',
                    ),
                    Dataset(
                        xml_id='input7',
                        name='InputDS7',
                        path='Context/WBDHU8_16010203.shp',
                        ds_type=GeoPackageDatasetTypes.VECTOR,
                        summary='This is a input dataset',
                        description='This is a input dataset',
                    ),
                    Dataset(
                        xml_id='input8',
                        name='InputDS8',
                        path='Context/WBDHU8_16010204.shp',
                        ds_type=GeoPackageDatasetTypes.VECTOR,
                        summary='This is a input dataset',
                        description='This is a input dataset',
                    )
                ],
                outputs=[
                    Dataset(
                        xml_id='output1',
                        name='OutputDS1',
                        path='Outputs/Bear_River_Parcels.shp',
                        ds_type=GeoPackageDatasetTypes.VECTOR,
                        summary='This is a input dataset',
                        description='This is a input dataset',
                    ),
                    Dataset(
                        xml_id='output2',
                        name='OutputDS2',
                        path='Outputs/Reaches.shp',
                        ds_type=GeoPackageDatasetTypes.VECTOR,
                        summary='This is a input dataset',
                        description='This is a input dataset',
                    ),
                    Dataset(
                        xml_id='output3',
                        name='OutputDS3',
                        path='Outputs/VBET_DGO.shp',
                        ds_type=GeoPackageDatasetTypes.VECTOR,
                        summary='This is a input dataset',
                        description='This is a input dataset',
                    )
                    # Dataset(
                    #     xml_id='output4',
                    #     name='OutputDS4',
                    #     path='Outputs/Storage.png',
                    #     ds_type=GeoPackageDatasetTypes.PNG,
                    #     summary='This is a input dataset',
                    #     description='This is a input dataset',
                    # ),
                ]
            )
        ]
    )

    # Write your new XML file to disk
    project.write('/mnt/c/Users/jordang/Downloads/project.rs.xml')

    log.info('done')


if __name__ == '__main__':
    with tempfile.NamedTemporaryFile(prefix='project.rs.', suffix='.xml') as f:
        print("\n\nConsole Output\n========================================================================\n")
        main(f.name)
        print("\n\nProject XML\n========================================================================\n")
        with open(f.name, 'r') as f:
            print(f.read())
