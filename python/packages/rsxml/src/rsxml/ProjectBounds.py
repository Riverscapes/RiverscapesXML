""" Project bounds XML """
from __future__ import annotations
import xml.etree.cElementTree as ET
from .common import Coords, BoundingBox


class ProjectBounds:
    """Generates the <ProjectBounds> tag for the project.xml file"""
    centroid: Coords
    bounding_box: BoundingBox
    filepath: str

    def __init__(self, centroid: Coords,
                 bounding_box: BoundingBox,
                 filepath: str) -> None:
        self.centroid = centroid
        self.bounding_box = bounding_box
        self.filepath = filepath

    @staticmethod
    def from_xml(xml_node: ET.Element) -> ProjectBounds:
        """parse the following XML and return a ProjectBounds object
          <ProjectBounds>
            <Centroid>
                <Lat>43.03677585761058</Lat>
                <Lng>-105.46875</Lng>
            </Centroid>
            <BoundingBox>
                <MinLat>38.58252615935333</MinLat>
                <MinLng>-115.13671875</MinLng>
                <MaxLat>46.6795944656402</MaxLat>
                <MaxLng>-96.0205078125</MaxLng>
            </BoundingBox>
            <Path>some_file_name.geojson</Path>
        </ProjectBounds>
        """
        centroid_node = xml_node.find('Centroid')
        centroid = Coords(float(centroid_node.find('Lat').text), float(centroid_node.find('Lng').text))

        bounding_box_node = xml_node.find('BoundingBox')
        bounding_box = BoundingBox(
            float(bounding_box_node.find('MinLat').text),
            float(bounding_box_node.find('MinLng').text),
            float(bounding_box_node.find('MaxLat').text),
            float(bounding_box_node.find('MaxLng').text)
        )

        filepath = xml_node.find('Path').text
        return ProjectBounds(centroid, bounding_box, filepath)

    def to_xml(self) -> ET.Element:
        """_summary_

        Returns:
            ET.Element: _description_
        """
        root = ET.Element('ProjectBounds')
        centroid = ET.SubElement(root, 'Centroid')
        ET.SubElement(centroid, 'Lat').text = str(self.centroid.lat)
        ET.SubElement(centroid, 'Lng').text = str(self.centroid.lng)

        boundingbox = ET.SubElement(root, 'BoundingBox')
        ET.SubElement(boundingbox, 'MinLng').text = str(self.bounding_box.minLng)
        ET.SubElement(boundingbox, 'MinLat').text = str(self.bounding_box.minLat)
        ET.SubElement(boundingbox, 'MaxLng').text = str(self.bounding_box.maxLng)
        ET.SubElement(boundingbox, 'MaxLat').text = str(self.bounding_box.maxLat)

        fpath = ET.SubElement(root, 'Path')
        fpath.text = self.filepath
        return root
