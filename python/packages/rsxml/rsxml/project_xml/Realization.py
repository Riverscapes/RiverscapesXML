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
from rsxml.project_xml.Geopackage import Geopackage
from rsxml.project_xml.MetaData import MetaData
from rsxml.project_xml.Dataset import Dataset, Log, RefDataset
from rsxml.project_xml.Analysis import Analysis


from rsxml.logging.logger import Logger

versionPattern = r'^[0-9]+\.[0-9]+\.[0-9]+[a-z-]*$'


class Realization(RSObj):
    """_summary_

    Args:
        RSObj (_type_): _description_
    """
    _common_ds: List[Dataset]

    date_created: datetime
    product_version: str
    xml_id: str

    logs: List[Log]
    datasets: List[Dataset | RefDataset]
    inputs: List[Dataset | RefDataset]
    intermediates: List[Dataset | RefDataset]
    outputs: List[Dataset | RefDataset]

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
                 common_datasets: List[Dataset] = [],
                 datasets: List[Dataset | RefDataset] = [],
                 logs: List[Log] = [],
                 inputs: List[Dataset | RefDataset] = [],
                 intermediates: List[Dataset | RefDataset] = [],
                 outputs: List[Dataset | RefDataset] = [],
                 analyses: List[Analysis] = [],
                 ) -> None:
        super().__init__('Realization', xml_id, name, summary, description, citation, meta_data)
        if not date_created or not isinstance(date_created, datetime):
            raise ValueError('date_created is mandatory')
        if product_version and not re.match(versionPattern, product_version):
            raise ValueError('product_version must match the pattern: ' + versionPattern)

        self.date_created = date_created
        self.product_version = product_version.strip() if product_version else None

        # This is so we can do a quick lookup of common datasets by name
        self._common_ds = common_datasets

        self.datasets = datasets
        self.logs = logs
        self.inputs = inputs
        self.intermediates = intermediates
        self.outputs = outputs
        self.analyses = analyses

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
                    if isinstance(ds, RefDataset):
                        node.append(ds.to_xml())
                    elif isinstance(ds, Dataset):
                        node.append(ds.to_xml())
                    elif isinstance(ds, Analysis):
                        node.append(ds.to_xml())
                    elif isinstance(ds, Geopackage):
                        node.append(ds.to_xml())
                    else:
                        raise ValueError(f'Unknown dataset type {type(ds)}')

        return xml_node

    def __ds_eq__(self, first_list: List[Dataset | RefDataset], other_list: List[Dataset | RefDataset]) -> bool:
        """_summary_
        """
        if not list or len(first_list) != len(other_list):
            return False

        return all([a == b for a, b in zip(first_list, other_list)])

    def __eq__(self, other: RSObj) -> bool:
        if not isinstance(other, Realization):
            return False

        return super().__eq__(other) and \
            self.date_created == other.date_created and \
            self.product_version == other.product_version and \
            self.__ds_eq__(self.datasets, other.datasets) and \
            self.__ds_eq__(self.logs, other.logs) and \
            self.__ds_eq__(self.inputs, other.inputs) and \
            self.__ds_eq__(self.intermediates, other.intermediates) and \
            self.__ds_eq__(self.outputs, other.outputs) and \
            self.__ds_eq__(self.analyses, other.analyses)

    @staticmethod
    def datasets_from_xml(xml_node: ET.Element, ds_type: str, common_datasets: List[Dataset] = []) -> List[Dataset | RefDataset]:
        """This works across a dataset container AND accounts for the possibility of RefDatasets
        """
        retvals = []
        found = xml_node.find(ds_type)
        if found:
            for ds in found:
                if ds.tag == 'CommonDatasetRef':
                    retvals.append(RefDataset.from_xml(ds, common_datasets))
                elif ds.tag == 'Geopackage':
                    retvals.append(Geopackage.from_xml(ds))
                elif ds.tag == 'LogFile':
                    retvals.append(Log.from_xml(ds))
                else:
                    retvals.append(Dataset.from_xml(ds))
        return retvals

    @staticmethod
    def from_xml(xml_node: ET.Element, common_datasets: List[Dataset] = []) -> Realization:
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

        datasets = Realization.datasets_from_xml(xml_node, 'Datasets', common_datasets)
        logs = Realization.datasets_from_xml(xml_node, 'Logs', common_datasets)

        inputs = Realization.datasets_from_xml(xml_node, 'Inputs', common_datasets)
        intermediates = Realization.datasets_from_xml(xml_node, 'Intermediates', common_datasets)
        outputs = Realization.datasets_from_xml(xml_node, 'Outputs', common_datasets)

        analyses = [Analysis.from_xml(analysis) for analysis in xml_node.find('Analyses')] if xml_node.find('Analyses') else None

        return Realization(rsobj.name, rsobj.xml_id, date_created, product_version,
                           rsobj.summary, rsobj.description, rsobj.citation, rsobj.meta_data,
                           common_datasets,
                           datasets, logs, inputs, intermediates, outputs, analyses)
