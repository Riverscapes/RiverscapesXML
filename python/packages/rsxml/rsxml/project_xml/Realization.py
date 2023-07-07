"""_summary_

    Raises:
        NotImplementedError: _description_

    Returns:
        _type_: _description_
    """
from __future__ import annotations
from typing import List
import re
from datetime import datetime
import xml.etree.cElementTree as ET

from rsxml.project_xml.RSObj import RSObj
from rsxml.project_xml.MetaData import MetaData
from rsxml.project_xml.Dataset import Dataset, Log
from rsxml.project_xml.Analysis import Analysis

from rsxml.logging.logger import Logger

versionPattern = r'^[0-9]+\.[0-9]+\.[0-9]+[a-z-]*$'


class Realization(RSObj):
    """_summary_

    Args:
        RSObj (_type_): _description_
    """
    date_created: datetime
    product_version: str
    xml_id: str

    datasets: List[Dataset]
    logs: List[Log]
    inputs: List[Dataset]
    intermediates: List[Dataset]
    outputs: List[Dataset]
    analyses: List[Analysis]

    def __init__(self,
                 name: str,
                 xml_id: str,
                 date_created: datetime,
                 product_version: str,
                 summary: str = None,
                 description: str = None,
                 citation: str = None,
                 meta_data: MetaData = None,
                 datasets: List[Dataset] = None,
                 logs: List[Log] = None,
                 inputs: List[Dataset] = None,
                 intermediates: List[Dataset] = None,
                 outputs: List[Dataset] = None,
                 analyses: List[Analysis] = None,
                 ) -> None:
        super().__init__('Realization', xml_id, name, summary, description, citation, meta_data)
        if not date_created or not isinstance(date_created, datetime):
            raise ValueError('date_created is mandatory')
        if product_version and not re.match(versionPattern, product_version):
            raise ValueError('product_version must match the pattern: ' + versionPattern)

        self.date_created = date_created
        self.product_version = product_version.strip() if product_version else None

        self.datasets = datasets if datasets else []
        self.logs = logs if logs else []
        self.inputs = inputs if inputs else []
        self.intermediates = intermediates if intermediates else []
        self.outputs = outputs if outputs else []
        self.analyses = analyses if analyses else []

    def to_xml(self) -> ET.Element:
        xml_node: ET.Element = super().to_xml()
        if self.date_created:
            xml_node.set('dateCreated', self.date_created.isoformat())
        if self.product_version:
            xml_node.set('productVersion', self.product_version)

        structure = {
            'Logs': self.logs,
            'Datasets': self.datasets,
            'Inputs': self.inputs,
            'Intermediates': self.intermediates,
            'Outputs': self.outputs,
            'Analyses': self.analyses
        }

        for xml_tag, dataset_list in structure.items():
            if dataset_list:
                node = ET.SubElement(xml_node, xml_tag)
                for ds in dataset_list:
                    node.append(ds.to_xml())

        return xml_node

    def from_xml(xml_node: ET.Element) -> Realization:
        """_summary_

        Args:
            xml_node (ET.Element): _description_

        Returns:
            Realization: _description_
        """
        log = Logger('Realization')
        if xml_node.tag != 'Realization':
            raise ValueError('xml_node must be a Realization node')

        rsobj = RSObj.from_xml(xml_node)

        try:
            date_created_node = xml_node.get('dateCreated')
            date_created = datetime.fromisoformat(date_created_node)
        except ValueError as err:
            log.error(f'dateCreated is not a valid ISO 8601 date like "{datetime.now().isoformat()}". Got: "{date_created_node}"')
            raise err

        product_version = xml_node.get('productVersion')

        datasets = [Dataset.from_xml(dataset_node) for dataset_node in xml_node.find('Datasets')] if xml_node.find('Datasets') else None
        logs = [Dataset.from_xml(log_node) for log_node in xml_node.find('Logs')] if xml_node.find('Logs') else None

        inputs = [Dataset.from_xml(input_node) for input_node in xml_node.find('Inputs')] if xml_node.find('Inputs') else None
        intermediates = [Dataset.from_xml(intermediate_node) for intermediate_node in xml_node.find('Intermediates')] if xml_node.find('Intermediates') else None
        outputs = [Dataset.from_xml(output_node) for output_node in xml_node.find('Outputs')] if xml_node.find('Outputs') else None

        analyses = [Analysis.from_xml(analysis) for analysis in xml_node.find('Analyses')] if xml_node.find('Analyses') else None

        return Realization(rsobj.name, rsobj.xml_id, date_created, product_version,
                           rsobj.summary, rsobj.description, rsobj.citation, rsobj.meta_data,
                           datasets, logs, inputs, intermediates, outputs, analyses)
