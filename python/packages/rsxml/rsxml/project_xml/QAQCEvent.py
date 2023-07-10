"""_summary_

    Raises:
        NotImplementedError: _description_

    Returns:
        _type_: _description_
    """
from __future__ import annotations
from typing import Dict
from datetime import datetime
import xml.etree.cElementTree as ET

from rsxml.project_xml.RSObj import RSObj
from rsxml.project_xml.MetaData import MetaData
from rsxml.logging.logger import Logger

ALLOWED_STATES = [
    'passed',
    'failed',
    'provisional',
]


class QAQCEvent(RSObj):
    """_summary_
    """
    date_performed: datetime
    state: str
    performed_by: str
    links: Dict[str, str]

    def __init__(self,
                 date_performed: datetime,
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
        if not date_performed:
            raise ValueError('date_performed is required')
        if not performed_by:
            raise ValueError('performed_by is required')
        if not state:
            raise ValueError('state is required')
        if state not in ALLOWED_STATES:
            raise ValueError(f'state must be one of {ALLOWED_STATES}')

        self.performed_by = performed_by.strip() if performed_by else None
        self.date_performed = date_performed
        self.state = state.strip() if state else None
        self.links = links if links else {}

    @staticmethod
    def from_xml(xml_node: ET.Element) -> QAQCEvent:
        """_summary_

        Args:
            xml_node (ET.Element): _description_

        Returns:
            QAQCEvent: _description_
        """
        log = Logger()
        rs_obj = RSObj.from_xml(xml_node)

        try:
            date_performed_node = xml_node.get('datePerformed')
            date_performed = datetime.fromisoformat(date_performed_node)
        except ValueError as err:
            log.error(f'QAQC: datePerformed is not a valid ISO 8601 date like "{datetime.now().isoformat()}". Got: "{date_performed_node}"')
            raise err

        performed_by = xml_node.find('PerformedBy').text
        state = xml_node.get('state')

        links = {}
        links_node = xml_node.find('Links')
        if links_node:
            for link_node in links_node.findall('URL'):
                links[link_node.get('text')] = link_node.text

        return QAQCEvent(
            date_performed=date_performed,
            performed_by=performed_by,
            state=state,
            name=rs_obj.name,
            summary=rs_obj.summary,
            description=rs_obj.description,
            citation=rs_obj.citation,
            meta_data=rs_obj.meta_data,
            links=links,
        )

    def to_xml(self) -> ET.Element:
        """_summary_

        Returns:
            str: _description_
        """
        log = Logger('QAQC')
        xml_node = super().to_xml()
        xml_node.set('datePerformed', self.date_performed.isoformat())
        xml_node.set('state', self.state)

        ET.SubElement(xml_node, 'PerformedBy').text = self.performed_by

        if self.links:
            links_node = ET.SubElement(xml_node, 'Links')
            for link_type, link in self.links.items():
                link_node = ET.SubElement(links_node, 'URL')
                link_node.set('text', link_type)
                link_node.text = link

        return xml_node
