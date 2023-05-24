"""_summary_

    Raises:
        NotImplementedError: _description_

    Returns:
        _type_: _description_
    """
from __future__ import annotations
from typing import List
import xml.etree.cElementTree as ET

from rsxml.project_xml.MetaData import MetaData
from rsxml.project_xml.RSObj import RSObj
from rsxml.project_xml.ProjectBounds import ProjectBounds
from rsxml.project_xml.Realization import Realization
from rsxml.project_xml.Dataset import Dataset
from rsxml.project_xml.QAQCEvent import QAQCEvent

from rsxml.logging.logger import Logger


class Project(RSObj):
    """_summary_
    """
    log = Logger('Project')
    prject_type: str
    warehouse: Warehouse
    realizations: List[Realization]
    common_datasets: List[Dataset]
    qaqc_events: List[QAQCEvent]
    proj_path: str

    def __init__(self,
                 name: str,
                 project_type: str,
                 bounds: ProjectBounds,
                 proj_path: str = None,
                 summary: str = None,
                 description: str = None,
                 citation: str = None,
                 meta_data: MetaData = None,
                 warehouse: Warehouse = None,
                 common_datasets: List[Dataset] = None,
                 realizations: List[Realization] = None,
                 qaqc_events: List[QAQCEvent] = None,
                 ) -> None:

        super().__init__(xml_tag='Project',
                         xml_id=None,
                         name=name,
                         summary=summary,
                         description=description,
                         citation=citation,
                         meta_data=meta_data,
                         mandatory_id=False  # projects don't need an ID
                         )

        self.project_type = project_type
        self.proj_path = proj_path
        self.bounds = bounds
        self.warehouse = warehouse
        self.common_datasets = common_datasets if common_datasets else []
        self.realizations = realizations if realizations else []
        self.qaqc_events = qaqc_events if qaqc_events else []

    @staticmethod
    def load_project(xml_file_path: str) -> Project:
        """_summary_

        Args:
            xml_file (str): _description_

        Returns:
            Project: _description_
        """
        xml_node = ET.parse(xml_file_path).getroot()
        return Project.from_xml(xml_node, xml_file_path)

    @staticmethod
    def from_xml(xml_node: ET.Element, proj_path: str) -> Project:
        """_summary_

        Args:
            xml_node (ET.Element): _description_

        Returns:
            Project: _description_
        """
        rsobj = RSObj.from_xml(xml_node)
        warehouse_find = xml_node.find('Warehouse')
        project = Project(
            name=rsobj.name,
            project_type=xml_node.find('ProjectType').text,
            bounds=ProjectBounds.from_xml(xml_node.find('ProjectBounds')),
            proj_path=proj_path,
            summary=rsobj.summary,
            description=rsobj.description,
            citation=rsobj.citation,
            meta_data=rsobj.meta_data,
            warehouse=Warehouse.from_xml(warehouse_find) if warehouse_find else None,

            # List comprehension on the result of find() will iterate over all the children of the node. Do not wildcard!
            common_datasets=[Dataset.from_xml(dataset_node) for dataset_node in xml_node.find('CommonDatasets')],
            realizations=[Realization.from_xml(realization_node) for realization_node in xml_node.find('Realizations')],
            qaqc_events=[QAQCEvent.from_xml(qaqc_event_node) for qaqc_event_node in xml_node.find('QAQCEvents')]
        )

        return project

    def to_xml(self) -> ET.Element:
        """_summary_

        Returns:
            ET.Element: _description_
        """
        xml_node = super().to_xml()

        ET.SubElement(xml_node, 'ProjectType').text = self.project_type

        # If there's no Model Version then throw a warning
        if not self.meta_data.find_meta('ModelVersion'):
            self.log.warning(f'WARNING: No ModelVersion found for {self.name}')

        if self.qaqc_events and len(self.qaqc_events) > 0:
            qaqc_node = ET.SubElement(xml_node, 'QAQCEvents')
            for qaqc_event in self.qaqc_events:
                qaqc_node.append(qaqc_event.to_xml())

        if self.common_datasets and len(self.common_datasets) > 0:
            common_datasets_node = ET.SubElement(xml_node, 'CommonDatasets')
            for dataset in self.common_datasets:
                common_datasets_node.append(dataset.to_xml())

        if self.bounds:
            xml_node.append(self.bounds.to_xml())

        realizations_node = ET.SubElement(xml_node, 'Realizations')

        for realization in self.realizations:
            realizations_node.append(realization.to_xml())

        return xml_node

    def write(self):
        """_summary_

        https://stackoverflow.com/questions/28813876/how-do-i-get-pythons-elementtree-to-pretty-print-to-an-xml-file
        """
        xml_node = self.to_xml()
        encoding = 'UTF-8'

        # Set the attributes
        xml_node.set("xmlns:xsi", "http://www.w3.org/2001/XMLSchema-instance")
        xml_node.set("xsi:noNamespaceSchemaLocation", "https://xml.riverscapes.net/Projects/XSD/V2/RiverscapesProject.xsd")

        # Create a copy of the input element: Convert to string, then parse again
        copy = ET.fromstring(ET.tostring(xml_node, encoding='utf8'))

        # Format copy. This needs Python 3.9+
        ET.indent(copy, space="    ", level=0)

        # tostring() returns a binary, so we need to decode it to get a string
        xml_string = ET.tostring(copy, encoding=encoding).decode(encoding)

        with open(self.proj_path, 'w', encoding=encoding) as f:
            f.write('<?xml version="1.0" ?>\n')
            f.write(xml_string)


class Warehouse:
    """_summary_
    """
    guid: str
    api_url: str

    def __init__(self, guid, api_url) -> None:
        self.guid = guid
        self.api_url = api_url

    @staticmethod
    def from_xml(xml_node: ET.Element) -> Warehouse:
        """_summary_

        Args:
            xml_node (ET.Element): _description_

        Returns:
            Warehouse: _description_
        """
        return Warehouse(
            guid=xml_node.attrib['id'],
            api_url=xml_node.attrib['apiUrl']
        )

    def to_xml(self) -> ET.Element:
        """_summary_

        Returns:
            str: _description_
        """
        root = ET.Element('Warehouse')
        root.set('id', self.guid)
        root.set('apiUrl', self.api_url)
        return root
