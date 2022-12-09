"""_summary_

    Raises:
        NotImplementedError: _description_

    Returns:
        _type_: _description_
    """
from __future__ import annotations
from typing import Dict
from datetime import date
import xml.etree.cElementTree as ET

from .RSObj import RSObj
from .MetaData import MetaData


class QAQCEvent(RSObj):
    """_summary_
    """
    date_created: date
    state: str
    performed_by: str
    links: Dict[str, str]

    def __init__(self,
                 date_created: date,
                 performed_by: str,
                 state: str,
                 name: str,
                 summary: str = None,
                 description: str = None,
                 citation: str = None,
                 meta_data: MetaData = None,
                 links: Dict[str, str] = None,
                 ) -> None:
        super().__init__(
            xml_id=None,
            mandatory_id=False,  # QAQCEvents don't need an ID,
            xml_tag='QAQCEvent',
            name=name,
            summary=summary,
            description=description,
            citation=citation,
            meta_data=meta_data,
        )
        if not date_created:
            raise ValueError('date_created is required')
        if not performed_by:
            raise ValueError('performed_by is required')
        if not state:
            raise ValueError('state is required')

        self.performed_by = performed_by
        self.date_created = date_created
        self.state = state
        self.links = links if links else {}

    @staticmethod
    def from_xml(xml_node: ET.Element) -> QAQCEvent:
        """_summary_

        Args:
            xml_node (ET.Element): _description_

        Returns:
            QAQCEvent: _description_
        """
        rs_obj = super.from_xml(xml_node)
        date_created = xml_node.get('dateCreated')
        performed_by = xml_node.get('performedBy')
        state = xml_node.get('state')

        links_node = xml_node.find('Links')
        if links_node:
            for link_node in links_node.findall('Link'):
                xml_node.links[link_node.get('type')] = link_node.text

        return QAQCEvent(
            date_created=date_created,
            performed_by=performed_by,
            state=state,
            name=rs_obj.name,
            summary=rs_obj.summary,
            description=rs_obj.description,
            citation=rs_obj.citation,
            meta_data=rs_obj.meta_data,
            links=rs_obj.links,
        )

    def to_xml(self) -> ET.Element:
        """_summary_

        Returns:
            str: _description_
        """
        xml_node = super.to_xml()
        xml_node.set('dateCreated', self.date_created.isoformat())
        xml_node.set('performedBy', self.performed_by)
        xml_node.set('state', self.state)

        if self.links:
            links_node = ET.SubElement(xml_node, 'Links')
            for link_type, link in self.links.items():
                link_node = ET.SubElement(links_node, 'Link')
                link_node.set('type', link_type)
                link_node.text = link

        return xml_node
