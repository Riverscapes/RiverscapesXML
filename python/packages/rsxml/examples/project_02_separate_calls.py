"""
Example showing how to create a project XML by calling methods separately
rather than specifying everything in the constructor (as in example 1).
"""
import tempfile
from datetime import datetime
# in your code you woulf write:
# from riverscapes import rsxml
from rsxml.project_xml import (
    Project,
    ProjectBounds,
    Coords,
    BoundingBox,
    Dataset,
    Realization,
    MetaData,
    Meta
)
from rsxml import Logger


def main(filepath: str):
    log = Logger('Project')

    # First create a new Riverscapes Project from scratch
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
        realizations=[
            Realization(
                xml_id='test',
                name='Test Realization',
                product_version='1.0.0',
                date_created=datetime(2021, 1, 1),
                summary='This is a test realization',
                description='This is a test realization',
                meta_data=MetaData(values=[Meta('Test', 'Test Value')]),
            )
        ]
    )

    # ========================================================================
    # ... maybe you do some work
    # ========================================================================

    # Now add some metadata
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

    log.info('done')


if __name__ == '__main__':
    with tempfile.NamedTemporaryFile(prefix='project.rs.', suffix='.xml') as f:
        print("\n\nConsole Output\n========================================================================\n")
        main(f.name)
        print("\n\nProject XML\n========================================================================\n")
        with open(f.name, 'r', encoding='utf-8') as f:
            print(f.read())


# FINAL OUTPUT ========================================================================

# <?xml version="1.0" ?>
# <Project xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="https://xml.riverscapes.net/Projects/XSD/V2/RiverscapesProject.xsd">
#     <Name>Test Project</Name>
#     <Description>This is a test project</Description>
#     <Citation>This is a citation</Citation>
#     <MetaData>
#         <Meta name="Test2">Test Value 2</Meta>
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
#         <Realization id="test" dateCreated="2021-01-01" productVersion="1.0.0">
#             <Name>Test Realization</Name>
#             <Summary>This is a test realization</Summary>
#             <Description>This is a test realization</Description>
#             <MetaData>
#                 <Meta name="Test">Test Value</Meta>
#             </MetaData>
#             <Datasets>
#                 <CSV id="test2" extRef="f23b187a-537b-4dd0-8b71-4b7c4a6e9747:Project/Realizations/Realization#REALIZATION1/Datasets/Raster#DEM">
#                     <Name>Test Dataset 2</Name>
#                     <Summary>This is a test dataset 2</Summary>
#                     <Description>This is a test dataset 2</Description>
#                     <Path>test2.gpkg</Path>
#                 </CSV>
#             </Datasets>
#         </Realization>
#     </Realizations>
# </Project>
