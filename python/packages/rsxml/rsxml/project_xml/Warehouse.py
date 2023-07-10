from __future__ import annotations
import xml.etree.cElementTree as ET


class Warehouse:
    """
    Represents a Riverscapes Warehouse where the project is stored.
    Only use this class if the project is already stored in a warehouse.
    """
    guid: str
    api_url: str

    def __init__(self, guid, api_url) -> None:
        self.guid = guid
        self.api_url = api_url

    @staticmethod
    def from_xml(xml_node: ET.Element) -> Warehouse:
        """
        Load an instance of this class from an XML node.

        Args:
            xml_node (ET.Element): XML node representing this warehouse.

        Returns:
            Warehouse: Initialized warehouse object.
        """

        return Warehouse(
            guid=xml_node.attrib['id'],
            api_url=xml_node.attrib['apiUrl']
        )

    def to_xml(self) -> ET.Element:
        """
        Serialize an instance of this class to an XML node.

        Returns:
            str: XML node representing this warehouse, ready to be written to disk.
        """
        root = ET.Element('Warehouse')
        root.set('id', self.guid)
        root.set('apiUrl', self.api_url)
        return root
