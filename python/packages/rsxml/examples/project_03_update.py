"""
Example demonstrating how to load an existing project XML file
and update it by adding some metadata and a realization.
This is just a basic demonstration. You can also load a
project XML file and add realizations, datasets, etc. to it.
"""
# in your code you woulf write:
# from riverscapes import rsxml
import tempfile
import os
# from datetime import date
from rsxml.project_xml import (
    Project,
    Dataset,
)
from rsxml import Logger


def main(filepath: str):
    log = Logger('Project')

    # open and parse and existing project XML file
    project = Project.load_project(filepath)

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
            ext_ref='f23b187a-537b-4dd0-8b71-4b7c4a6e9747:Project/Realizations/Realization#REALIZATION1/Datasets/CSV#TEST2',
            summary='This is a test dataset 2',
            description='This is a test dataset 2'
        )
    )
    my_real.inputs.append(
        Dataset(
            xml_id='test3',
            name='Test Dataset 3',
            path='test2.gpkg',
            ds_type='Vector',
            ext_ref='f23b187a-537b-4dd0-8b71-4b7c4a6e9747:Project/Realizations/Realization#REALIZATION1/Datasets/Vector#TEST3',
            summary='This is a test dataset 3',
            description='This is a test dataset 3'
        )
    )

    # Write it to disk
    project.write()

    log.info('done')


if __name__ == '__main__':
    with tempfile.NamedTemporaryFile(prefix='project.rs.', suffix='.xml') as f:
        # Prepopulate the file with the XML from our sample file
        with open(os.path.join(os.path.dirname(__file__), 'project_03_input.rs.xml'), 'r', encoding='utf-8') as inf:
            f.write(inf.read().encode('utf-8'))
            f.flush()

        print("\n\nConsole Output\n========================================================================\n")
        main(f.name)

        print("\n\nProject XML\n========================================================================\n")
        with open(f.name, 'r', encoding='utf-8') as f:
            print(f.read())


# OUTPUT ========================================================================

# <?xml version="1.0" ?>
# <Project xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="https://xml.riverscapes.net/Projects/XSD/V2/RiverscapesProject.xsd">
#     <Name>Test Project</Name>
#     <Description>This is a test project</Description>
#     <Citation>This is a citation</Citation>
#     <MetaData>
#         <Meta name="Test1">Test Value 1</Meta>
#         <Meta name="Test2">Test Value 2</Meta>
#     </MetaData>
#     <ProjectType>VBET</ProjectType>
#     <ProjectBounds>
#         <Centroid>
#             <Lat>-21.23</Lat>
#             <Lng>114.56</Lng>
#         </Centroid>
#         <BoundingBox>
#             <MinLng>-21.0</MinLng>
#             <MinLat>-22.0</MinLat>
#             <MaxLng>116.0</MaxLng>
#             <MaxLat>114.0</MaxLat>
#         </BoundingBox>
#         <Path>project_bounds.json</Path>
#     </ProjectBounds>
#     <Realizations>
#         <Realization id="test" dateCreated="2021-10-02T16:48:50.457945" productVersion="1.0.0">
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
#             <Inputs>
#                 <Vector id="test3" extRef="f23b187a-537b-4dd0-8b71-4b7c4a6e9747:Project/Realizations/Realization#REALIZATION1/Datasets/Vector#TEST3">
#                     <Name>Test Dataset 3</Name>
#                     <Summary>This is a test dataset 3</Summary>
#                     <Description>This is a test dataset 3</Description>
#                     <Path>test2.gpkg</Path>
#                 </Vector>
#             </Inputs>
#         </Realization>
#     </Realizations>
# </Project>
