"""
Represents a project with associated metadata, bounds, datasets, and analysis.

Use this class to instantiate a project with associated metadata, bounds, datasets, and analysis.
You can then write the project to an XML file.
"""
from __future__ import annotations
from typing import List
import xml.etree.cElementTree as ET
import os

from rsxml.project_xml.MetaData import MetaData
from rsxml.project_xml.RSObj import RSObj
from rsxml.project_xml.ProjectBounds import ProjectBounds
from rsxml.project_xml.Realization import Realization
from rsxml.project_xml.Geopackage import Geopackage
from rsxml.project_xml.Dataset import Dataset, RefDataset
from rsxml.project_xml.QAQCEvent import QAQCEvent
from rsxml.project_xml.Warehouse import Warehouse

from rsxml.logging.logger import Logger


class Project(RSObj):
    """
    Represents a project with associated metadata, bounds, datasets, and analysis.

    Attributes:
        name (str): The name of the project.
        metadata (MetaData): The metadata associated with the project.
        bounds (ProjectBounds): The geographic bounds of the project.
        datasets (List[Dataset]): The datasets associated with the project.
        analysis (Analysis): The analysis performed on the project.
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
        """
        Initializes a Project instance.

            Args:
                name (str): The name of the project.
                project_type (str): The type of the project.
                bounds (ProjectBounds): The geographic bounds of the project.
                proj_path (str, optional): The path to the project directory. Defaults to None.
                summary (str, optional): A summary of the project. Defaults to None.
                description (str, optional): A detailed description of the project. Defaults to None.
                citation (str, optional): The citation information for the project. Defaults to None.
                meta_data (MetaData, optional): The metadata associated with the project. Defaults to None.
                warehouse (Warehouse, optional): The warehouse where project data is stored. Defaults to None.
                common_datasets (List[Dataset], optional): The common datasets used in the project. Defaults to None.
                realizations (List[Realization], optional): The realizations associated with the project. Defaults to None.
                qaqc_events (List[QAQCEvent], optional): The QA/QC events related to the project. Defaults to None.
        """

        super().__init__(xml_tag='Project',
                         xml_id=None,
                         name=name,
                         summary=summary,
                         description=description,
                         citation=citation,
                         meta_data=meta_data,
                         mandatory_id=False  # projects don't need an ID
                         )

        self.project_type = project_type.strip() if project_type else None
        self.proj_path = proj_path.strip() if proj_path else None
        self.bounds = bounds
        self.warehouse = warehouse
        self.meta_data = meta_data if meta_data else MetaData()
        self.common_datasets = common_datasets if common_datasets else []
        self.realizations = realizations if realizations else []
        self.qaqc_events = qaqc_events if qaqc_events else []

    @staticmethod
    def load_project(xml_file_path: str) -> Project:
        """
        Loads a project from an XML file.

        Args:
            xml_file (str): Full, absolute path to the project XML file.

        Returns:
            Project: initialized project object
        """
        xml_node = ET.parse(xml_file_path).getroot()
        return Project.from_xml(xml_node, xml_file_path)

    @staticmethod
    def datasets_from_xml(xml_node: ET.Element, ds_type: str) -> List[Dataset | RefDataset]:
        """This works across a dataset container AND accounts for the possibility of RefDatasets
        """
        retvals = []
        found = xml_node.find(ds_type)
        if found:
            for ds in found:
                if ds.tag == 'Geopackage':
                    retvals.append(Geopackage.from_xml(ds))
                else:
                    retvals.append(Dataset.from_xml(ds))
        return retvals

    @staticmethod
    def from_xml(xml_node: ET.Element, proj_path: str = None) -> Project:
        """
        Initializes a Project instance from an XML node.
        Typically only used within the load_project method.

        Args:
            xml_node (ET.Element): Root node from project XML file.

        Returns:
            Project: loaded project object
        """

        rsobj = RSObj.from_xml(xml_node)
        warehouse_find = xml_node.find('Warehouse')
        warehouse = Warehouse.from_xml(warehouse_find) if warehouse_find is not None else None

        project_bounds_find = xml_node.find('ProjectBounds')
        if project_bounds_find is None:
            log = Logger('Project')
            log.warning("""WARNING: No ProjectBounds.
                The project will load into the Riverscapes Data Exchange, but will be easier to discover if you add a ProjectBounds.""")

        # We need to find common datasets before realizations, because realizations reference common datasets
        common_datasets = Project.datasets_from_xml(xml_node, 'CommonDatasets')

        realizations = []
        realization_nodes = xml_node.find('Realizations')
        if realization_nodes:
            for realization_node in realization_nodes:
                if realization_node:
                    realizations.append(Realization.from_xml(realization_node, common_datasets))

        qaqc_events = []
        qaqc_events_nodes = xml_node.find('QAQCEvents')
        if qaqc_events_nodes:
            for qaqc_event_node in qaqc_events_nodes:
                if qaqc_event_node:
                    qaqc_events.append(QAQCEvent.from_xml(qaqc_event_node))

        project = Project(
            name=rsobj.name,
            project_type=xml_node.find('ProjectType').text,
            bounds=ProjectBounds.from_xml(project_bounds_find) if project_bounds_find else None,
            proj_path=proj_path,
            summary=rsobj.summary,
            description=rsobj.description,
            citation=rsobj.citation,
            meta_data=rsobj.meta_data,
            warehouse=warehouse,

            # List comprehension on the result of find() will iterate over all the children of the node. Do not wildcard!
            common_datasets=common_datasets,
            realizations=realizations,
            qaqc_events=qaqc_events
        )

        return project

    def to_xml(self) -> ET.Element:
        """
        Serialize an instance of this class to an XML node.

        Returns:
            ET.Element: XML node representing this project.
        """
        xml_node = super().to_xml()

        ET.SubElement(xml_node, 'ProjectType').text = self.project_type

        if self.warehouse:
            xml_node.append(self.warehouse.to_xml())

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

    def write(self, new_path: str = None):
        """
        Serialize the project to an XML file on disk.
        Call this method once you have finished modifying the project and want to save it to disk.

        https://stackoverflow.com/questions/28813876/how-do-i-get-pythons-elementtree-to-pretty-print-to-an-xml-file
        """
        log = Logger('Project Writer')
        final_path = new_path if new_path else self.proj_path

        if not final_path:
            raise ValueError('Project path is not set. Cannot write project.')
        path_dir = os.path.dirname(final_path)
        if not os.path.exists(path_dir) or not os.path.isdir(path_dir):
            raise ValueError(f'Project path {path_dir} does not exist or is not a directory. Cannot write project.')
        if os.path.exists(final_path):
            log.warning(f'Project path {final_path} already exists. Overwriting.')

        xml_node = self.to_xml()
        encoding = 'UTF-8'

        # Set the attributes
        xml_node.set("xmlns:xsi", "http://www.w3.org/2001/XMLSchema-instance")
        xml_node.set("xsi:noNamespaceSchemaLocation", "https://xml.riverscapes.net/Projects/XSD/V2/RiverscapesProject.xsd")

        # Create a copy of the input element: Convert to string, then parse again
        copy = ET.fromstring(ET.tostring(xml_node, encoding='utf-8'))

        # Format copy. This needs Python 3.9+
        ET.indent(copy, space="  ", level=0)

        # tostring() returns a binary, so we need to decode it to get a string
        xml_string = ET.tostring(copy, encoding=encoding).decode(encoding)

        with open(final_path, 'w', encoding=encoding) as f:
            f.write('<?xml version="1.0" ?>\n')
            f.write(xml_string)
