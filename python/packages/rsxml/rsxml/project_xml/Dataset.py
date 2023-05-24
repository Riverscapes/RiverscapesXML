"""_summary_

    Raises:
        NotImplementedError: _description_

    Returns:
        _type_: _description_
    """
from __future__ import annotations
from typing import List
import re

import xml.etree.cElementTree as ET

from rsxml.project_xml.RSObj import RSObj
from rsxml.project_xml.common import GeoPackageDatasetTypes
from rsxml.project_xml.MetaData import MetaData

# This is from Projects/XSD/V2/RiverscapesProject.xsd
extRefPattern = r'^[0-9a-zA-Z-]{36,}:Project/[A-Za-z0-9_/#-]+$'
pathPattern = r'([A-Za-z0-9_.-]+/)*[A-Za-z0-9_.-]+'


class Dataset(RSObj):
    """_summary_

    Args:
        RSObj (_type_): _description_
    """
    path: str
    ds_type: str
    ext_ref: str

    def __init__(self,
                 xml_id: str,
                 name: str,
                 path: str,
                 ds_type: str,
                 ext_ref: str = None,
                 summary: str = None,
                 description: str = None,
                 citation: str = None,
                 meta_data: MetaData = None,
                 ) -> None:
        super().__init__(xml_tag=ds_type,
                         xml_id=xml_id,
                         name=name,
                         summary=summary,
                         description=description,
                         citation=citation,
                         meta_data=meta_data,
                         )
        if not path:
            raise ValueError('Path is required for Dataset')
        if path and not re.match(pathPattern, path):
            raise ValueError(f'Path must be a valid Riverscapes path for Dataset with a pattern: {pathPattern}')
        if not ds_type:
            raise ValueError('Dataset type is required for Dataset')
        if ext_ref and not re.match(extRefPattern, ext_ref):
            raise ValueError(f'ExtRef must be a valid Riverscapes extRef for Dataset with a pattern: {extRefPattern}')

        self.path = path
        self.ds_type = ds_type
        self.ext_ref = ext_ref

    @staticmethod
    def from_xml(xml_node: ET.Element) -> Dataset:
        """parse an xml node into a Dataset object

        Args:
            xml_node (ET.Element): _description_

        Returns:
            Dataset: _description_
        """
        rsobj = RSObj.from_xml(xml_node)

        # if this is a dataset then the id will get picked up by the RSObj.from_xml
        dataset = Dataset(xml_id=rsobj.xml_id,
                          name=rsobj.name,
                          path=xml_node.find('Path').text,
                          ds_type=xml_node.tag,
                          ext_ref=xml_node.get('extRef'),
                          summary=rsobj.summary,
                          description=rsobj.description,
                          citation=rsobj.citation,
                          meta_data=rsobj.meta_data
                          )
        return dataset

    def to_xml(self) -> ET.Element:
        """_summary_

        Returns:
            ET.Element: _description_
        """
        xml_node = super().to_xml()

        if self.ext_ref:
            xml_node.set('extRef', self.ext_ref)

        ET.SubElement(xml_node, 'Path').text = self.path
        return xml_node


class Log(Dataset):
    """_summary_

    Args:
        Dataset (_type_): _description_
    """

    def __init__(self, xml_id: str,
                 name: str,
                 path: str,
                 ext_ref: str = None,
                 summary: str = None,
                 description: str = None,
                 citation: str = None,
                 meta_data: MetaData = None
                 ) -> None:

        super().__init__(xml_id, name, path, 'Log', ext_ref, summary, description, citation, meta_data)


class Geopackage(Dataset):
    """_summary_

    Args:
        Dataset (_type_): _description_
    """
    layers: List[GeopackageDataset]

    def __init__(self, xml_id: str,
                 name: str,
                 path: str,
                 layers: List[GeopackageDataset],
                 ext_ref: str = None,
                 summary: str = None,
                 description: str = None,
                 citation: str = None,
                 meta_data: MetaData = None
                 ) -> None:

        super().__init__(xml_id, name, path, 'Geopackage', ext_ref, summary, description, citation, meta_data)
        self.layers = layers

    @staticmethod
    def from_xml(xml_node: ET.Element) -> Dataset:
        """parse an xml node into a Geopackage object

        Args:
            xml_node (ET.Element): _description_

        Returns:
            Dataset: _description_
        """
        dataset = Dataset.from_xml(xml_node)
        layers = []

        for layer in xml_node.findall('GeopackageDataset'):
            layers.append(GeopackageDataset.from_xml(layer))

        geopackage = Geopackage(dataset.xml_id,
                                dataset.name,
                                dataset.path,
                                layers,
                                dataset.ext_ref,
                                dataset.summary,
                                dataset.description,
                                dataset.citation,
                                dataset.meta_data
                                )
        return geopackage

    def to_xml(self) -> ET.Element:
        xml_node = super().to_xml()
        for layer in self.layers:
            xml_node.append(layer.to_xml())
        return xml_node


class GeopackageDataset(RSObj):
    """_summary_

    Args:
        RSObj (_type_): _description_
    """
    ds_type: GeoPackageDatasetTypes
    lyr_name: str
    ext_ref: str

    def __init__(self,
                 lyr_name: str,
                 name: str,
                 ds_type: GeoPackageDatasetTypes,
                 ext_ref: str = None,
                 summary: str = None,
                 description: str = None,
                 citation: str = None,
                 meta_data: MetaData = None,
                 ) -> None:

        super().__init__(xml_tag=ds_type,
                         xml_id=None,
                         name=name,
                         summary=summary,
                         description=description,
                         citation=citation,
                         meta_data=meta_data,
                         mandatory_id=False
                         )
        if not ds_type or ds_type not in GeoPackageDatasetTypes.__dict__.values():
            raise ValueError('Dataset type is required for Dataset')
        if not lyr_name:
            raise ValueError('Layer name is required for Dataset')

        self.lyr_name = lyr_name
        self.ds_type = ds_type
        self.ext_ref = ext_ref

    @staticmethod
    def from_xml(xml_node: ET.Element) -> GeopackageDataset:
        """parse an xml node into a Dataset object

        Args:
            xml_node (ET.Element): _description_

        Returns:
            Dataset: _description_
        """
        rsobj = RSObj.from_xml(xml_node)
        lyr_name = xml_node.get('lyrName')

        # if this is a dataset then the id will get picked up by the RSObj.from_xml
        dataset = GeopackageDataset(lyr_name=lyr_name,
                                    name=rsobj.name,
                                    ds_type=xml_node.tag,
                                    ext_ref=xml_node.get('extRef'),
                                    summary=rsobj.summary,
                                    description=rsobj.description,
                                    citation=rsobj.citation,
                                    meta_data=rsobj.meta_data
                                    )
        return dataset

    def to_xml(self) -> ET.Element:
        """_summary_

        Returns:
            ET.Element: _description_
        """
        xml_node = super.to_xml()

        xml_node.set('lyrName', self.lyr_name)
        if self.ext_ref:
            xml_node.set('extRef', self.ext_ref)

        return xml_node
