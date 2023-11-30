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
        description='Priority LTPBR segments within the Bear River watershed. Transient storage was estimated across these segments and summarized at different scales and groupings',
        citation='',
        bounds=ProjectBounds(
            centroid=Coords(-111.39, 41.62),
            bounding_box=BoundingBox(-112, -110, 39, 43),
            filepath='project_Bounds.json',
        ),
        meta_data=MetaData(values=[Meta('', '')]),
        realizations=[
            Realization(
                xml_id='REALIZATION1',
                name='WCP for Bear River Watershed',
                product_version='1.0.0',
                date_created=datetime(2023, 9, 25),
                summary='',
                description='',
                meta_data=MetaData(values=[Meta('', '')]),
                inputs=[
                    Dataset(
                        xml_id='Land_Ownership',
                        name='Land Ownership',
                        path='Context/Land_Ownership.shp',
                        ds_type=GeoPackageDatasetTypes.VECTOR,
                        summary='',
                        description='',
                    ),
                    Dataset(
                        xml_id='HUC4',
                        name='Bear River HUC 4 Boundary',
                        path='Context/WBHU4.shp',
                        ds_type=GeoPackageDatasetTypes.VECTOR,
                        summary='',
                        description='',
                    ),
                    Dataset(
                        xml_id='HUC8_1',
                        name='Upper Bear HUC 8',
                        path='Context/WBDHU8_16010101.shp',
                        ds_type=GeoPackageDatasetTypes.VECTOR,
                        summary='',
                        description='',
                    ),
                    Dataset(
                        xml_id='HUC8_2',
                        name='Central Bear HUC 8',
                        path='Context/WBDHU8_16010102.shp',
                        ds_type=GeoPackageDatasetTypes.VECTOR,
                        summary='',
                        description='',
                    ),
                    Dataset(
                        xml_id='HUC8_3',
                        name='Bear Lake HUC 8',
                        path='Context/WBDHU8_16010201.shp',
                        ds_type=GeoPackageDatasetTypes.VECTOR,
                        summary='',
                        description='',
                    ),
                    Dataset(
                        xml_id='HUC8_4',
                        name='Middle Bear HUC 8',
                        path='Context/WBDHU8_16010202.shp',
                        ds_type=GeoPackageDatasetTypes.VECTOR,
                        summary='',
                        description='',
                    ),
                    Dataset(
                        xml_id='HUC8_5',
                        name='Little Bear-Logan HUC 8',
                        path='Context/WBDHU8_16010203.shp',
                        ds_type=GeoPackageDatasetTypes.VECTOR,
                        summary='',
                        description='',
                    ),
                    Dataset(
                        xml_id='HUC8_6',
                        name='Lower Bear-Malad HUC8',
                        path='Context/WBDHU8_16010204.shp',
                        ds_type=GeoPackageDatasetTypes.VECTOR,
                        summary='',
                        description='',
                    )
                ],
                outputs=[
                    Dataset(
                        xml_id='Ownership_Parcels',
                        name='Private Land Parcels',
                        path='Outputs/Bear_River_Parcels.shp',
                        ds_type=GeoPackageDatasetTypes.VECTOR,
                        summary='',
                        description='Private parcels identified by TU as having potential interst in LTPBR',
                    ),
                    Dataset(
                        xml_id='Reaches',
                        name='Potential LTBPR Reaches',
                        path='Outputs/Reaches.shp',
                        ds_type=GeoPackageDatasetTypes.VECTOR,
                        summary='',
                        description='These reaches were identified by either the BRAT model, reaches on identified private parcels, or ones identified by the USFS',
                    ),
                    Dataset(
                        xml_id='VBET_DGO',
                        name='VBET DGO',
                        path='Outputs/VBET_DGO.shp',
                        ds_type=GeoPackageDatasetTypes.VECTOR,
                        summary='',
                        description='',
                    ),
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
