"""
Represents a Dataset in a Riverscapes Project XML file. 
Datasets have subtypes of Geopackage or Log.
    """
from __future__ import annotations
from typing import List
import xml.etree.cElementTree as ET

from rsxml.project_xml.Dataset import Dataset
from rsxml.project_xml.RSObj import RSObj
from rsxml.project_xml.common import GeoPackageDatasetTypes
from rsxml.project_xml.MetaData import MetaData


class Geopackage(Dataset):
    """
    Inherits from Dataset and represents a geopackage in a Riverscapes Project XML file.
    Geopackages can contain one or more geospatial layers
    """
    layers: List[GeopackageLayer]

    def __init__(self, xml_id: str,
                 name: str,
                 path: str,
                 layers: List[GeopackageLayer] = [],
                 ds_type_attr: str = None,  # The type="" attribute is used in the XML as a way to group datasets
                 ext_ref: str = None,
                 summary: str = None,
                 description: str = None,
                 citation: str = None,
                 meta_data: MetaData = None
                 ) -> None:
        """
        Initializes a Geopackage instance.

        Args:
            xml_id (str): The XML ID of the dataset.
            name (str): The name of the dataset.
            path (str): The path to the dataset.
            layers (List[GeopackageDataset]): The layers associated with the dataset.
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
                            layers=[GeopackageDataset(...), GeopackageDataset(...)])

            # Create a dataset instance with additional optional attributes
            dataset = Dataset(xml_id="12345",
                            name="My Dataset",
                            path="/path/to/dataset",
                            layers=[GeopackageDataset(...), GeopackageDataset(...)],
                            ext_ref="External Reference",
                            summary="A summary of the dataset",
                            description="A detailed description of the dataset",
                            citation="Citation information",
                            meta_data=MetaData(...))
        """

        super().__init__(xml_id, name, path, 'Geopackage', ds_type_attr, ext_ref, summary, description, citation, meta_data)
        self.layers = layers

    def __ds_eq__(self, first_list: List[GeopackageLayer], other_list: List[GeopackageLayer]) -> bool:
        """_summary_
        """
        if not list or len(first_list) != len(other_list):
            return False

        return all([a == b for a, b in zip(first_list, other_list)])

    def __eq__(self, other: Geopackage) -> bool:
        if not isinstance(other, Geopackage):
            return False
        return super(Geopackage, self).__eq__(other) and self.__ds_eq__(self.layers, other.layers)

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

        for layer in xml_node.findall('Layers/*'):
            layers.append(GeopackageLayer.from_xml(layer))

        geopackage = Geopackage(dataset.xml_id,
                                dataset.name,
                                dataset.path,
                                layers,
                                dataset.ds_type_attr,
                                dataset.ext_ref,
                                dataset.summary,
                                dataset.description,
                                dataset.citation,
                                dataset.meta_data
                                )
        return geopackage

    def to_xml(self) -> ET.Element:
        xml_node = super().to_xml()

        layers_node = ET.SubElement(xml_node, 'Layers')
        for layer in self.layers:
            layers_node.append(layer.to_xml())
        return xml_node


class GeopackageLayer(RSObj):
    """
    Represents a layer within a Geopackage. Typically these are vector layers.
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
        """
        Initializes a GeoPackageDataset instance.

        Args:
            lyr_name (str): The name of the dataset layer.
            name (str): The name of the dataset.
            ds_type (GeoPackageDatasetTypes): The type of the dataset.
            ext_ref (str, optional): The external reference for the dataset. Defaults to None.
            summary (str, optional): A summary of the dataset. Defaults to None.
            description (str, optional): A detailed description of the dataset. Defaults to None.
            citation (str, optional): The citation information for the dataset. Defaults to None.
            meta_data (MetaData, optional): The metadata associated with the dataset. Defaults to None.

        Returns:
            None

        Examples:
            # Create a GeoPackageDataset instance with required attributes
            dataset = GeoPackageDataset(lyr_name="LayerName",
                                        name="DatasetName",
                                        ds_type=GeoPackageDatasetTypes.TYPE_A)

            # Create a GeoPackageDataset instance with additional optional attributes
            dataset = GeoPackageDataset(lyr_name="LayerName",
                                        name="DatasetName",
                                        ds_type=GeoPackageDatasetTypes.TYPE_A,
                                        ext_ref="External Reference",
                                        summary="A summary of the dataset",
                                        description="A detailed description of the dataset",
                                        citation="Citation information",
                                        meta_data=MetaData(...))
        """

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
    def from_xml(xml_node: ET.Element) -> GeopackageLayer:
        """parse an xml node into a Dataset object

        Args:
            xml_node (ET.Element): Node representing the layer in the XML
        """
        rsobj = RSObj.from_xml(xml_node)
        lyr_name = xml_node.get('lyrName')

        # if this is a dataset then the id will get picked up by the RSObj.from_xml
        dataset = GeopackageLayer(lyr_name=lyr_name,
                                  name=rsobj.name,
                                  ds_type=xml_node.tag,
                                  ext_ref=xml_node.get('extRef'),
                                  summary=rsobj.summary,
                                  description=rsobj.description,
                                  citation=rsobj.citation,
                                  meta_data=rsobj.meta_data
                                  )
        return dataset

    def __eq__(self, o: object) -> bool:
        if not isinstance(o, GeopackageLayer):
            return False
        return super().__eq__(o) and \
            self.lyr_name == o.lyr_name and \
            self.ds_type == o.ds_type and \
            self.ext_ref == o.ext_ref

    def to_xml(self) -> ET.Element:
        """
        Serialize a GeopackageLayer object to an XML node

        Returns:
            ET.Element: XML node representing the GeopackageLayer
        """
        xml_node = super().to_xml()

        xml_node.set('lyrName', self.lyr_name)
        if self.ext_ref:
            xml_node.set('extRef', self.ext_ref)

        return xml_node
