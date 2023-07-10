""" RSObj is a useful pattern for XML we generate often.
Most of the XML we generate has the same structure:
    <xml_tag>
        <Name>name</Name>
        <Summary>summary</Summary>
        <Description>description</Description>
        <Citation>citation</Citation>
        <MetaData>
            <Meta name="name" type="type">value</Meta>
            <Meta name="name" type="type">value</Meta>
            <Meta name="name" type="type">value</Meta>
        </MetaData>
    </xml_tag>

RSObj is a class that can be inherited to create a class that can be
instantiated with the above structure. It also has a static method
from_xml that can be used to parse an XML node into an RSObj.
"""
from __future__ import annotations
import abc
import xml.etree.cElementTree as ET

from rsxml.project_xml.MetaData import MetaData, Meta


class RSObj (abc.ABC):
    """
    Abstract base class from which several other classes are derived.
    This class is used as a pattern for XML we generate often.
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
                 meta_data: MetaData = MetaData(),
                 mandatory_id: bool = True
                 ) -> None:
        """
        Initializes an instance of RSObj, the base class for several other types.

        Args:
            xml_tag (str): The XML tag associated with the instance.
            xml_id (str): The XML ID of the instance.
            name (str): The name of the instance.
            summary (str, optional): A summary of the instance. Defaults to None.
            description (str, optional): A detailed description of the instance. Defaults to None.
            citation (str, optional): The citation information for the instance. Defaults to None.
            meta_data (MetaData, optional): The metadata associated with the instance. Defaults to None.
            mandatory_id (bool, optional): Flag indicating if the XML ID is mandatory. Defaults to True.

        Returns:
            None

        Examples:
            # Create an instance of the class with required attributes
            instance = ClassName(xml_tag="tag",
                                xml_id="12345",
                                name="My Instance")

            # Create an instance of the class with additional optional attributes
            instance = ClassName(xml_tag="tag",
                                xml_id="12345",
                                name="My Instance",
                                summary="A summary of the instance",
                                description="A detailed description of the instance",
                                citation="Citation information",
                                meta_data=MetaData(...),
                                mandatory_id=False)
        """

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
        self.meta_data = meta_data if meta_data else MetaData()

    @staticmethod
    def from_xml(xml_node: ET.Element) -> RSObj:
        """ parse XML and return an RSOBj """

        xml_id = xml_node.get('id')
        xml_tag = xml_node.tag
        name_find = xml_node.find('Name')
        if name_find is None:
            raise ValueError('Name is mandatory')
        name = name_find.text

        summary_find = xml_node.find('Summary')
        summary = summary_find.text if summary_find is not None else None

        description_find = xml_node.find('Description')
        description = description_find.text if description_find is not None else None

        citation_find = xml_node.find('Citation')
        citation = citation_find.text if citation_find is not None else None

        meta_data_find = xml_node.find('MetaData')
        meta_data = MetaData.from_xml(meta_data_find) if meta_data_find is not None else MetaData()

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

    def __eq__(self, other: RSObj) -> bool:
        """ Equality operator """

        if not isinstance(other, RSObj):
            return False

        return self.xml_id == other.xml_id and \
            self.name == other.name and \
            self.summary == other.summary and \
            self.description == other.description and \
            self.citation == other.citation and \
            self.meta_data == other.meta_data

    def to_xml(self) -> ET.Element:
        """
         Serializes the object into an XML node
        """

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

        if self.meta_data is not None:
            new_node = self.meta_data.to_xml()
            if new_node is not None:
                xml_node.append(new_node)

        return xml_node
