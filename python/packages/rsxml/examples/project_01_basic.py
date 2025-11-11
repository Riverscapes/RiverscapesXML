"""
This is the most basic example demonstrating how to use RSXML to generate
a project.rs.xml file.

This example creates a project object and includes a single realization with
a single input, intermediate and output dataset. Everything is defined in one
go as arguments to the project constructor. When you are done you simply call
the write() method to write the project XML file to disk.
"""

import tempfile
from datetime import datetime
# in your code you would write:
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
# logging is always a good practice
from rsxml import Logger


def main(filepath: str):
    log = Logger('Project')

    # Create a new Riverscapes Project from scratch
    project = Project(
        name='Test Project',
        proj_path=filepath,
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
                date_created=datetime(2021, 1, 1),
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
                    ),
                    Geopackage(
                        xml_id='output2',
                        name='OutputDS2',
                        path='datasets/output.gpkg',
                        layers=[
                            GeopackageLayer(
                                lyr_name='output2_layer1',
                                lyr_type='output_layer',
                                name='OutputDS2 Layer 1',
                                ds_type=GeoPackageDatasetTypes.VECTOR,
                                summary='This is a input dataset',
                                description='This is a input dataset',
                            ),
                            GeopackageLayer(
                                lyr_name='output2_layer2',
                                name='OutputDS2 Layer 2',
                                ds_type=GeoPackageDatasetTypes.VECTOR,
                                summary='This is a input dataset',
                                description='This is a input dataset',
                            ),
                        ],
                        summary='This is a input dataset',
                        description='This is a input dataset',
                    ),
                ]
            )
        ]
    )

    # Write your new XML file to disk
    project.write()

    log.info('done')


if __name__ == '__main__':
    with tempfile.NamedTemporaryFile(prefix='project.rs.', suffix='.xml') as f:
        print("\n\nConsole Output\n========================================================================\n")
        main(f.name)
        print("\n\nProject XML\n========================================================================\n")
        with open(f.name, 'r', encoding='utf-8') as f:
            print(f.read())


# OUTPUT::

# <?xml version="1.0" ?>
# <Project xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="https://xml.riverscapes.net/Projects/XSD/V2/RiverscapesProject.xsd">
#     <Name>Test Project</Name>
#     <Description>This is a test project</Description>
#     <Citation>This is a citation</Citation>
#     <MetaData>
#         <Meta name="Test">Test Value</Meta>
#     </MetaData>
#     <ProjectType>VBET</ProjectType>
#     <ProjectBounds>
#         <Centroid>
#             <Lat>114.56</Lat>
#             <Lng>-21.23</Lng>
#         </Centroid>
#         <BoundingBox>
#             <MinLng>-22</MinLng>
#             <MinLat>-21</MinLat>
#             <MaxLng>114</MaxLng>
#             <MaxLat>116</MaxLat>
#         </BoundingBox>
#         <Path>project_bounds.json</Path>
#     </ProjectBounds>
#     <Realizations>
#         <Realization id="test" dateCreated="2021-01-01T00:00:00" productVersion="1.0.0">
#             <Name>Test Realization</Name>
#             <Summary>This is a test realization</Summary>
#             <Description>This is a test realization</Description>
#             <MetaData>
#                 <Meta name="Test">Test Value</Meta>
#             </MetaData>
#             <Inputs>
#                 <Raster id="input1">
#                     <Name>InputDS1</Name>
#                     <Summary>This is a input dataset</Summary>
#                     <Description>This is a input dataset</Description>
#                     <Path>datasets/input1.tiff</Path>
#                 </Raster>
#             </Inputs>
#             <Intermediates>
#                 <Raster id="inter1">
#                     <Name>inter1DS</Name>
#                     <Summary>This is a input dataset</Summary>
#                     <Description>This is a input dataset</Description>
#                     <Path>datasets/inter1.tiff</Path>
#                 </Raster>
#             </Intermediates>
#             <Outputs>
#                 <Raster id="output1">
#                     <Name>OutputDS1</Name>
#                     <Summary>This is a input dataset</Summary>
#                     <Description>This is a input dataset</Description>
#                     <Path>datasets/output.tiff</Path>
#                 </Raster>
#             </Outputs>
#         </Realization>
#     </Realizations>
# </Project>
