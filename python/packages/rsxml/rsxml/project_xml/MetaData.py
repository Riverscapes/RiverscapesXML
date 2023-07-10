"""Mostly common types and constants for the rsxml package.
"""

from __future__ import annotations
from typing import List, NamedTuple
import xml.etree.cElementTree as ET
MetaValue = str or float or int

# These types are taken from the XSD definition
# https://github.com/Riverscapes/RiverscapesXML/blob/e5b7a967d1c17224d6ef001acf37e7df8c129391/Projects/XSD/V2/RiverscapesProject.xsd#L501-L521
# These must be updated here if the XSD changes
META_TYPES = [
    'guid',
    'url',
    'filepath',
    'image',
    'video',
    'isodate',
    'timestamp',
    'float',
    'boolean',
    'int',
    'richtext',
    'markdown',
    'json',
    'hidden'
]

# These types are taken from the XSD definition
# https://github.com/Riverscapes/RiverscapesXML/blob/e5b7a967d1c17224d6ef001acf37e7df8c129391/Projects/XSD/V2/RiverscapesProject.xsd#L531-L537
# These must be updated here if the XSD changes
EXT_TYPES = [
    'warehouse',
    'project',
    'dataset'
]


class Meta(NamedTuple):
    """
    Represents a metadata tag in the project.xml file. This is a named tuple with the following fields:
    key: The name of the metadata tag.
    value: The value of the metadata tag.
    """
    name: str
    value: MetaValue
    type: str = None  # optional
    ext: str = None  # optional


class MetaData():
    """
    Represents a collection of metadata tags in the project.xml file. This is a named tuple with the following fields:
    values: A list of Meta objects.
    container_tag: The name of the container tag for the metadata.
    inner_tag: The name of the inner tag for the metadata.
    """

    _values = List[Meta]
    container_tag: str
    inner_tag: str

    def __init__(self, values: List[Meta] = [], container_tag: str = 'MetaData', inner_tag: str = 'Meta') -> None:
        """
        Initializes an instance of the Metadata class.

        Args:
            values (List[Meta], optional): A list of Meta objects. Defaults to None.
            container_tag (str, optional): The tag name for the container element. Defaults to 'MetaData'.
            inner_tag (str, optional): The tag name for the inner elements. Defaults to 'Meta'.

        Returns:
            None

        Examples:
            # Create an instance of the class with default values
            obj = ClassName()

            # Create an instance of the class with custom values
            obj = ClassName(values=[Meta(...), Meta(...)],
                            container_tag='CustomContainer',
                            inner_tag='CustomInner')
        """

        if values and not isinstance(values, List):
            raise ValueError('values must be a list of Meta')

        if values:
            for meta in values:
                if meta.type is not None:
                    self._validate_meta_type(meta.type)

                if meta.ext is not None:
                    self._validate_ext_type(meta.ext)

        self._values = values if values else []
        self.container_tag = container_tag
        self.inner_tag = inner_tag

    def _validate_meta_type(self, meta_type: str) -> None:
        """
        Validates the meta type.
        """
        if meta_type not in META_TYPES:
            raise ValueError(f'Invalid meta type {meta_type}. Valid types are {META_TYPES}')

    def _validate_ext_type(self, ext: str) -> None:
        """
        Validates the ext type.
        """
        if ext not in EXT_TYPES:
            raise ValueError(f'Invalid ext type {ext}. Valid types are {EXT_TYPES}')

    def add_meta(self, name: str, value, meta_type: str = None, ext: str = None) -> None:
        """
        Add a metadata item to the collection.
        The name must be unique and cannot be empty.
        """

        if len(name) == 0:
            raise ValueError('name cannot be empty')

        if name in [s.name for s in self._values]:
            raise ValueError(f'{name} already exists')

        if meta_type is not None:
            self._validate_meta_type(meta_type)

        if ext is not None:
            self._validate_ext_type(ext)

        self._values.append(Meta(name, value, meta_type, ext))

    def find_meta(self, name: str) -> Meta:
        """
        Find an existing metadata item by name.
        """
        return next((s for s in self._values if s.name == name), None)

    def remove_meta(self, name: str) -> None:
        """
        Remove an existing metadata item by name.
        """
        self._values = [s for s in self._values if s.name != name]

    def __eq__(self, other: MetaData) -> bool:

        if not isinstance(other, MetaData):
            return False

        return self.container_tag == other.container_tag and \
            self.inner_tag == other.inner_tag and \
            len(self._values) == len(other._values) and \
            all([a == b for a, b in zip(self._values, other._values)])

    @staticmethod
    def from_xml(xml_node: ET.Element) -> MetaData:
        """
        Create an instance of the MetaData class from an xml node.

        Args:
            xml_node (ET.Element): _description_

        Returns:
            MetaData: _description_
        """
        if xml_node is None:
            return MetaData()
        container_tag = xml_node.tag
        inner_tag_find = xml_node.find('*')
        inner_tag = xml_node.find('*').tag if inner_tag_find is not None else None

        meta_data = MetaData(container_tag=container_tag, inner_tag=inner_tag)

        for meta in xml_node.findall('*'):
            meta_data.add_meta(
                meta.get('name'),
                meta.text.strip() if meta.text else "",
                meta.get('type'),
                meta.get('ext')
            )
        return meta_data

    def to_xml(self) -> ET.Element:
        """
        Serialize a MetaData item to an xml node ready to be written to a project.rs.xml file.

        Returns:
            ET.Element: XML node representing the MetaData item.
        """
        if len(self._values) == 0:
            return None
        meta_data = ET.Element(self.container_tag)
        for meta in self._values:
            meta_node = ET.Element(self.inner_tag, {
                'name': meta.name,
            })
            if meta.type is not None:
                meta_node.set('type', meta.type)
            if meta.ext is not None:
                meta_node.set('ext', meta.ext)

            meta_node.text = str(meta.value)
            meta_data.append(meta_node)

        return meta_data
