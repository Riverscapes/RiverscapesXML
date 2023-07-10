"""
Represents a Dataset in a Riverscapes Project XML file. 
Datasets have subtypes of Geopackage or Log.
    """
from __future__ import annotations
from typing import List
import re

import xml.etree.cElementTree as ET

from rsxml.project_xml.RSObj import RSObj
from rsxml.project_xml.MetaData import MetaData

# This is from Projects/XSD/V2/RiverscapesProject.xsd
extRefPattern = r'^[0-9a-zA-Z-]{36,}:Project/[A-Za-z0-9_/#-]+$'
pathPattern = r'([A-Za-z0-9_.-]+/)*[A-Za-z0-9_.-]+'


class RefDataset():
    ref: str
    dataset: Dataset

    def __init__(self, ref: str, dataset: Dataset) -> None:
        self.ref = ref
        self.dataset = dataset

    def __eq__(self, other):
        if not isinstance(other, RefDataset):
            return False
        return self.ref == other.ref and self.dataset == other.dataset

    @staticmethod
    def from_xml(xml_node: ET.Element, common_datasets: List[Dataset] = None) -> RefDataset:
        ref = xml_node.get('ref')

        # Find the source dataset inside common_datasets
        orig_ds = None
        if common_datasets:
            orig_ds = next((ds for ds in common_datasets if ds.xml_id == ref), None)

        if not orig_ds:
            raise ValueError(f'Error parsing <CommonDatasetRef>. Could not find common dataset with id: {ref}')

        return RefDataset(ref, orig_ds)

    def to_xml(self) -> ET.Element:
        xml_node = ET.Element('CommonDatasetRef')
        xml_node.set('ref', self.ref)
        return xml_node


class Dataset(RSObj):
    """
    Datasets represent containers for data in a Riverscapes Project XML file.
    They can be rasters, Shapefiles, Geopackages, log files or other types of data.

    ShapeFiles and rasters represent a single geospatial layer as one object.
    However, Geopackages are containers for one or more geospatial layers.
    """
    path: str
    ds_type: str
    ext_ref: str

    def __init__(self,
                 xml_id: str,
                 name: str,
                 path: str,
                 ds_type: str,
                 ds_type_attr: str = None,  # The type="" attribute is used in the XML as a way to group datasets
                 ext_ref: str = None,
                 summary: str = None,
                 description: str = None,
                 citation: str = None,
                 meta_data: MetaData = None,
                 ) -> None:
        """
            Initializes a Dataset instance.

            Args:
                xml_id (str): The XML ID of the dataset.
                name (str): The name of the dataset.
                path (str): The path to the dataset.
                ds_type (str): The type of the dataset.
                ext_ref (str, optional): The external reference for the dataset. Defaults to None.
                summary (str, optional): A summary of the dataset. Defaults to None.
                description (str, optional): A detailed description of the dataset. Defaults to None.
                citation (str, optional): The citation information for the dataset. Defaults to None.
                meta_data (MetaData, optional): The metadata associated with the dataset. Defaults to None.

            Returns:
                None

            Examples:
                # Create a dataset instance with required attributes
                dataset = Dataset(xml_id="12345",
                                name="My Dataset",
                                path="/path/to/dataset",
                                ds_type="Type A")

                # Create a dataset instance with additional optional attributes
                dataset = Dataset(xml_id="12345",
                                name="My Dataset",
                                path="/path/to/dataset",
                                ds_type="Type A",
                                ext_ref="External Reference",
                                summary="A summary of the dataset",
                                description="A detailed description of the dataset",
                                citation="Citation information",
                                meta_data=MetaData(...))
        """

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
        path_stripped = path.strip()
        if path_stripped and not re.match(pathPattern, path_stripped):
            raise ValueError(f'Path must be a valid Riverscapes path for Dataset with a pattern: {pathPattern}')
        if not ds_type:
            raise ValueError('Dataset type is required for Dataset')
        if ext_ref and not re.match(extRefPattern, ext_ref):
            raise ValueError(f'ExtRef must be a valid Riverscapes extRef for Dataset with a pattern: {extRefPattern}')

        self.path = path_stripped if path else None
        self.ds_type = ds_type.strip() if ds_type else None
        self.ds_type_attr = ds_type_attr.strip() if ds_type_attr else None
        self.ext_ref = ext_ref.strip() if ext_ref else None

    def __eq__(self, other: RSObj) -> bool:
        if not isinstance(other, Dataset):
            return False

        if not super(Dataset, self).__eq__(other):
            return False

        return self.path == other.path and \
            self.ds_type == other.ds_type and \
            self.ext_ref == other.ext_ref

    @staticmethod
    def from_xml(xml_node: ET.Element) -> Dataset:
        """parse an xml node into a Dataset object

        Args:
            xml_node (ET.Element): XML node representing the Dataset

        Returns:
            Dataset: initialized dataset object from the XML node.
        """
        rsobj = RSObj.from_xml(xml_node)

        # if this is a dataset then the id will get picked up by the RSObj.from_xml
        dataset = Dataset(xml_id=rsobj.xml_id,
                          name=rsobj.name,
                          path=xml_node.find('Path').text,
                          ds_type=xml_node.tag,
                          ds_type_attr=xml_node.get('type'),
                          ext_ref=xml_node.get('extRef'),
                          summary=rsobj.summary,
                          description=rsobj.description,
                          citation=rsobj.citation,
                          meta_data=rsobj.meta_data
                          )
        return dataset

    def to_xml(self) -> ET.Element:
        """
        Serialize this object to an XML node ready for writing to a file.

        Returns:
            ET.Element: XML node representing this object.
        """
        xml_node = super().to_xml()

        if self.ext_ref:
            xml_node.set('extRef', self.ext_ref)

        if self.ds_type_attr:
            xml_node.set('type', self.ds_type_attr)

        ET.SubElement(xml_node, 'Path').text = self.path
        return xml_node


class Log(Dataset):
    """
    Inherits from Dataset and represents a log file in a Riverscapes Project XML file.
    """

    def __init__(self, xml_id: str,
                 name: str,
                 path: str,
                 ds_type_attr: str = None,  # The type="" attribute is used in the XML as a way to group datasets
                 ext_ref: str = None,
                 summary: str = None,
                 description: str = None,
                 citation: str = None,
                 meta_data: MetaData = None
                 ) -> None:
        """
        Initializes a Dataset instance.

        Args:
            xml_id (str): The XML ID of the dataset.
            name (str): The name of the dataset.
            path (str): The path to the dataset.
            ext_ref (str, optional): The external reference for the dataset. Defaults to None.
            summary (str, optional): A summary of the dataset. Defaults to None.
            description (str, optional): A detailed description of the dataset. Defaults to None.
            citation (str, optional): The citation information for the dataset. Defaults to None.
            meta_data (MetaData, optional): The metadata associated with the dataset. Defaults to None.

        Returns:
            None

        Examples:
            # Create a dataset instance with required attributes
            dataset = Dataset(xml_id="12345",
                            name="My Dataset",
                            path="/path/to/dataset")

            # Create a dataset instance with additional optional attributes
            dataset = Dataset(xml_id="12345",
                            name="My Dataset",
                            path="/path/to/dataset",
                            ext_ref="External Reference",
                            summary="A summary of the dataset",
                            description="A detailed description of the dataset",
                            citation="Citation information",
                            meta_data=MetaData(...))
        """

        super().__init__(xml_id, name, path, 'LogFile', ds_type_attr, ext_ref, summary, description, citation, meta_data)
