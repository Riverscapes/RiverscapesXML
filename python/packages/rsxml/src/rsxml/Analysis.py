"""_summary_

    Raises:
        NotImplementedError: _description_

    Returns:
        _type_: _description_
    """
from __future__ import annotations
from typing import List
import xml.etree.cElementTree as ET

from .RSObj import RSObj
from .MetaData import MetaData
from .Dataset import Dataset


class Analysis(RSObj):
    """_summary_

    Args:
        RSObj (_type_): _description_
    """
    metrics: MetaData
    configuration: List[Dataset]
    products: List[Dataset]

    def __init__(self, xml_id: str,
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
    def from_xml(xml_node: ET.Element) -> Analysis:
        rsobj = super.from_xml(xml_node)

        metrics = MetaData.from_xml(xml_node.find('Metrics'))

        configuration = [Dataset.from_xml(d) for d in xml_node.findall('Configuration/*')]
        products = [Dataset.from_xml(d) for d in xml_node.findall('Products/*')]

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

        xml_node.append(self.metrics.to_xml())

        if self.metrics:
            xml_node.append(self.metrics.to_xml())

        configuration = ET.SubElement(xml_node, 'Configuration')
        for dset in self.configuration:
            configuration.append(dset.to_xml())

        products = ET.SubElement(xml_node, 'Products')
        for dset in self.products:
            products.append(dset.to_xml())

        return xml_node
