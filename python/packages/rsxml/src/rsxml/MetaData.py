"""Mostly common types and constants for the rsxml package.
"""

from __future__ import annotations
from typing import List, NamedTuple
import xml.etree.cElementTree as ET

MetaValue = str or float or int


class Meta(NamedTuple):
    """_summary_
    """
    name: str
    value: MetaValue
    type: str  # optional


class MetaData():

    _values = List[Meta]
    container_tag: str
    inner_tag: str

    def __init__(self, values: List[Meta] = None, container_tag: str = 'MetaData', inner_tag: str = 'Meta') -> None:
        self._values = values if values else []
        self.container_tag = container_tag
        self.inner_tag = inner_tag

    def add_meta(self, name: str, value: MetaValue, meta_type: str) -> None:
        """_summary_
        """
        if name in [s.name for s in self._values]:
            raise ValueError(f'{name} already exists')
        self._values.append(Meta(name, value, meta_type))

    def find_meta(self, name: str) -> Meta:
        """_summary_
        """
        return next((s for s in self._values if s.name == name), None)

    def remove_meta(self, name: str) -> None:
        """_summary_
        """
        self._values = [s for s in self._values if s.name != name]

    @staticmethod
    def from_xml(xml_node: ET.Element) -> MetaData:
        """_summary_

        Args:
            xml_node (ET.Element): _description_

        Returns:
            MetaData: _description_
        """
        inner_tag = xml_node.tag
        container_tag = xml_node.getparent().tag

        meta_data = MetaData(container_tag=container_tag, inner_tag=inner_tag)

        for meta in xml_node.findall('*'):
            meta_data.add_meta(
                meta.get('name'),
                meta.get('value'),
                meta.get('type'),
            )
        return meta_data

    def to_xml(self) -> ET.Element:
        """_summary_

        Returns:
            ET.Element: _description_
        """
        meta_data = ET.Element(self.container_tag)
        for meta in self._values:
            meta_data.append(ET.Element(self.inner_tag, {
                'name': meta.name,
                'value': meta.value,
                'type': meta.type,
            }))
