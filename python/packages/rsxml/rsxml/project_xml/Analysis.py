"""_summary_

    Raises:
        NotImplementedError: _description_

    Returns:
        _type_: _description_
    """
from __future__ import annotations
from typing import List
import xml.etree.cElementTree as ET

from rsxml.project_xml.RSObj import RSObj
from rsxml.project_xml.MetaData import MetaData
from rsxml.project_xml.Geopackage import Geopackage
from rsxml.project_xml.Dataset import Dataset, RefDataset


class Analysis(RSObj):
    """_summary_

    Args:
        RSObj (_type_): _description_
    """
    metrics: MetaData
    configuration: List[Dataset]
    products: List[Dataset]

    def __init__(self,
                 xml_id: str,
                 name: str,
                 metrics: MetaData,
                 configuration: List[Dataset],
                 products: List[Dataset],
                 summary: str = None,
                 description: str = None,
                 citation: str = None,
                 meta_data: MetaData = None) -> None:

        super().__init__(xml_tag='Analysis',
                         xml_id=xml_id,
                         name=name,
                         summary=summary,
                         description=description,
                         citation=citation,
                         meta_data=meta_data
                         )

        self.metrics = MetaData(metrics._values, inner_tag='Metric', container_tag='Metrics') if metrics else None
        self.configuration = configuration
        self.products = products

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
                else:
                    retvals.append(Dataset.from_xml(ds))
        return retvals

    @staticmethod
    def from_xml(xml_node: ET.Element) -> Analysis:
        rsobj = RSObj.from_xml(xml_node)

        metrics = MetaData.from_xml(xml_node.find('Metrics'))

        configuration = Analysis.datasets_from_xml(xml_node, 'Configuration')
        products = Analysis.datasets_from_xml(xml_node, 'Products')

        return Analysis(xml_id=rsobj.xml_id,
                        name=rsobj.name,
                        metrics=metrics,
                        configuration=configuration,
                        products=products,
                        summary=rsobj.summary,
                        description=rsobj.description,
                        citation=rsobj.citation,
                        meta_data=rsobj.meta_data
                        )

    def to_xml(self) -> ET.Element:
        """_summary_

        Returns:
            ET.Element: _description_
        """
        xml_node = super().to_xml()

        if self.metrics is not None and len(self.metrics._values) > 0:
            metadata_root = ET.SubElement(xml_node, 'Metrics')
            for meta in self.metrics._values:
                meta_item = ET.SubElement(metadata_root, 'Metric')
                meta_item.set('name', meta.name)
                if meta.type:
                    meta_item.set('type', meta.type)
                meta_item.text = meta.value

        configuration = ET.SubElement(xml_node, 'Configuration')
        for dset in self.configuration:
            configuration.append(dset.to_xml())

        products = ET.SubElement(xml_node, 'Products')
        for dset in self.products:
            products.append(dset.to_xml())

        return xml_node
