"""_summary_

    Raises:
        NotImplementedError: _description_

    Returns:
        _type_: _description_
    """
from __future__ import annotations
from typing import List
import re
from datetime import date
import xml.etree.cElementTree as ET

from rsxml.project_xml.RSObj import RSObj
from rsxml.project_xml.MetaData import MetaData
from rsxml.project_xml.Dataset import Dataset, Log
from rsxml.project_xml.Analysis import Analysis

versionPattern = r'^[0-9]+\.[0-9]+\.[0-9]+[a-z-]*$'


class Realization(RSObj):
    """_summary_

    Args:
        RSObj (_type_): _description_
    """
    date_created: date
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
                 date_created: date,
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
        if not date_created or not isinstance(date_created, date):
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
