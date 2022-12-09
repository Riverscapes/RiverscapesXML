"""_summary_

    Raises:
        NotImplementedError: _description_

    Returns:
        _type_: _description_
    """
from __future__ import annotations
from typing import List
from datetime import date
import xml.etree.cElementTree as ET

from .RSObj import RSObj
from .MetaData import MetaData
from .Dataset import Dataset, Log
from .Analysis import Analysis


class Realization(RSObj):
    """_summary_

    Args:
        RSObj (_type_): _description_
    """
    date_created: date
    product_version: str

    datasets: List[Dataset]
    logs: List[Log]
    inputs: List[Dataset]
    intermediates: List[Dataset]
    outputs: List[Dataset]
    analyses: List[Analysis]

    def __init__(self, xml_id: str,
                 name: str,
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
        super().__init__(xml_id, name, summary, description, citation, meta_data)
        self.date_created = date_created
        self.product_version = product_version

        self.datasets = datasets
        self.logs = logs
        self.inputs = inputs
        self.intermediates = intermediates
        self.outputs = outputs
        self.analyses = analyses

    def to_xml(self) -> ET.Element:
        xml_node: ET.Element = super.to_xml()
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
