""" RSObj is a useful pattern for XML we generate often"""
from __future__ import annotations
import xml.etree.cElementTree as ET

from rsxml.project_xml.MetaData import MetaData, MetaValue, Meta


class RSObj:
    """_summary_
    """
    xml_id: str
    name: str
    summary: str
    description: str
    citation: str
    meta_data: MetaData
    xml_tag: str

    def __init__(self,
                 xml_tag: str,
                 xml_id: str,
                 name: str,
                 summary: str = None,
                 description: str = None,
                 citation: str = None,
                 meta_data: MetaData = None,
                 mandatory_id: bool = True
                 ) -> None:

        if mandatory_id and not xml_id:
            raise ValueError('xml_id is mandatory')
        if not xml_tag:
            raise ValueError('xml_tag is mandatory')
        if not name:
            raise ValueError('name is mandatory')

        self.xml_tag = xml_tag
        self.xml_id = xml_id.strip() if xml_id else None
        self.name = name.strip() if name else None

        self.summary = summary.strip() if summary else None
        self.description = description.strip() if description else None
        self.citation = citation.strip() if citation else None
        self.meta_data = meta_data

    @staticmethod
    def from_xml(xml_node: ET.Element) -> RSObj:
        """ parse XML and return an RSOBj """

        xml_id = xml_node.get('id')
        xml_tag = xml_node.tag
        name = xml_node.find('Name').text

        summary_find = xml_node.find('Summary')
        summary = summary_find.text if summary_find is not None else None

        description_find = xml_node.find('Description')
        description = description_find.text if description_find is not None else None

        citationFind = xml_node.find('Citation')
        citation = citationFind.text if citationFind is not None else None

        meta_data_find = xml_node.find('MetaData')
        meta_data = MetaData.from_xml(meta_data_find, xml_node) if meta_data_find is not None else None

        mandatory_id = xml_id is not None

        return RSObj(
            xml_tag=xml_tag,
            xml_id=xml_id,
            name=name,
            summary=summary,
            description=description,
            citation=citation,
            meta_data=meta_data,
            mandatory_id=mandatory_id
        )

    def to_xml(self) -> ET.Element:
        """turns the object into an XML node"""

        xml_node = ET.Element(self.xml_tag)

        if self.xml_id:
            xml_node.set('id', self.xml_id)
        if self.name:
            ET.SubElement(xml_node, 'Name').text = self.name
        if self.summary:
            ET.SubElement(xml_node, 'Summary').text = self.summary
        if self.description:
            ET.SubElement(xml_node, 'Description').text = self.description
        if self.citation:
            ET.SubElement(xml_node, 'Citation').text = self.citation

        if self.meta_data is not None and len(self.meta_data._values) > 0:
            metadata_root = ET.SubElement(xml_node, 'MetaData')
            for meta in self.meta_data._values:
                meta_item = ET.SubElement(metadata_root, 'Meta')
                meta_item.set('name', meta.name)
                if meta.type:
                    meta_item.set('type', meta.type)
                meta_item.text = meta.value
        return xml_node
