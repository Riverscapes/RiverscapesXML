"""[summary]"""
import unittest
import os
from uuid import uuid4

from src import rsxml

MOCK_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'mock')


class RSObjTest(unittest.TestCase):
    """[summary]"""

    def test_rsobj(self):
        """[summary]
        """
        xml_id = 'SOMEID'
        name = 'test_project'
        xml_tag = 'MyTag'
        description = 'test description'
        summary = 'test summary'
        citation = 'test citation'
        meta = {
            'test_key': 'test_value',
            'test_key2': 'test_value2',
        }
        rsobj = rsxml.RSObj(xml_id=xml_id,
                            xml_tag=xml_tag,
                            name=name,
                            summary=summary,
                            description=description,
                            citation=citation,
                            meta_data=meta
                            )
        self.assertEqual(rsobj.xml_id, xml_id)
        self.assertEqual(rsobj.xml_tag, xml_tag)
        self.assertEqual(rsobj.name, name)
        self.assertEqual(rsobj.summary, summary)
        self.assertEqual(rsobj.description, description)
        self.assertEqual(rsobj.citation, citation)
        self.assertDictEqual(rsobj.meta_data, meta)

        xml = rsobj.to_xml()
        self.assertEqual(xml.attrib['id'], xml_id)
        self.assertEqual(xml.find('Name').text, name)
        self.assertEqual(xml.find('Summary').text, summary)
        self.assertEqual(xml.find('Description').text, description)
        self.assertEqual(xml.find('Citation').text, citation)
        self.assertEqual(xml.find('MetaData/Meta[@name=\'test_key\']').text, 'test_value')
        self.assertEqual(xml.find('MetaData/Meta[@name=\'test_key2\']').text, 'test_value2')


class ProjectClasses(unittest.TestCase):
    """[summary]"""

    def test_project_bounds_init(self):
        """[summary]
        """
        bounds = rsxml.ProjectBounds(
            bounding_box=rsxml.BoundingBox(-1.0, -2.0, -0.5, -0.5),
            centroid=rsxml.Coords(-0.75, -1.25),
            filepath='test_path/test.geojson'
        )
        self.assertEqual(bounds.bounding_box, (-1.0, -2.0, -0.5, -0.5))
        self.assertEqual(bounds.centroid, (-0.75, -1.25))
        self.assertEqual(bounds.filepath, 'test_path/test.geojson')

        xml = bounds.to_xml()
        self.assertEqual(xml.tag, 'ProjectBounds')
        self.assertEqual(xml.find('Centroid/Lng').text, '-0.75')
        self.assertEqual(xml.find('Centroid/Lat').text, '-1.25')
        self.assertEqual(xml.find('BoundingBox/MinLng').text, '-1.0')
        self.assertEqual(xml.find('BoundingBox/MinLat').text, '-2.0')
        self.assertEqual(xml.find('BoundingBox/MaxLng').text, '-0.5')
        self.assertEqual(xml.find('BoundingBox/MaxLat').text, '-0.5')
        self.assertEqual(xml.find('Path').text, 'test_path/test.geojson')

    def test_warehouse(self):
        """Test the px.Warehouse class constructor
        """
        guid = str(uuid4())
        api_url = 'https://api.something.com/api'
        warehouse = rsxml.Warehouse(guid, api_url=api_url)

        self.assertEqual(warehouse.guid, guid)
        self.assertEqual(warehouse.api_url, api_url)

        xml = warehouse.to_xml()
        self.assertDictEqual(xml.attrib, {'id': guid, 'apiUrl': api_url})

    def test_project(self):
        """Test the px.Project class constructor
        """
        guid = str(uuid4())
        name = 'test_project'
        description = 'test description'
        project_type = 'VBET'
        summary = 'test summary'
        citation = 'test citation'
        bounds = rsxml.ProjectBounds(
            bounding_box=rsxml.BoundingBox(-1.0, -2.0, -0.5, -0.5),
            centroid=rsxml.Coords(-0.75, -1.25),
            filepath='test_path/test.geojson'
        )
        meta_data = {"test_key": "test_value"}

        project = rsxml.Project(
            name=name,
            project_type=project_type,
            description=description,
            summary=summary,
            citation=citation,
            bounds=bounds,
            meta_data=meta_data
        )

        self.assertEqual(project.name, name)
        self.assertEqual(project.description, description)
        self.assertEqual(project.project_type, project_type)
        self.assertEqual(project.summary, summary)
        self.assertEqual(project.citation, citation)
        self.assertEqual(project.bounds, bounds)
        self.assertEqual(project.meta_data, meta_data)

        xml = project.to_xml()
        self.assertDictEqual(xml.attrib, {'id': guid})
        self.assertEqual(xml.find('Name').text, name)
        self.assertEqual(xml.find('Description').text, description)
        self.assertEqual(xml.find('ProjectType').text, project_type)
        self.assertEqual(xml.find('Summary').text, summary)
        self.assertEqual(xml.find('Citation').text, citation)
        self.assertEqual(xml.find('ProjectBounds/Centroid/Lng').text, '-0.75')
        self.assertEqual(xml.find('ProjectBounds/Centroid/Lat').text, '-1.25')
        self.assertEqual(xml.find('ProjectBounds/BoundingBox/MinLng').text, '-1.0')
        self.assertEqual(xml.find('ProjectBounds/BoundingBox/MinLat').text, '-2.0')
        self.assertEqual(xml.find('ProjectBounds/BoundingBox/MaxLng').text, '-0.5')
        self.assertEqual(xml.find('ProjectBounds/BoundingBox/MaxLat').text, '-0.5')
        self.assertEqual(xml.find('ProjectBounds/Path').text, 'test_path/test.geojson')
        self.assertEqual(xml.find('MetaData/Item').attrib, {'key': 'test_key', 'value': 'test_value'})

    def test_dataset(self):
        """Test the px.Dataset class constructor
        """
        xml_id = 'SOMEID'
        name = 'test_dataset'
        ds_type = 'CSV'
        description = 'test description'
        ds_path = 'test_path/test.geojson'
        summary = 'test summary'
        citation = 'test citation'

        dataset = rsxml.Dataset(
            xml_id=xml_id,
            name=name,
            ds_type=ds_type,
            path=ds_path,
            description=description,
            summary=summary,
            citation=citation
        )

        self.assertEqual(dataset.xml_id, xml_id)
        self.assertEqual(dataset.name, name)
        self.assertEqual(dataset.ds_type, ds_type)
        self.assertEqual(dataset.description, description)
        self.assertEqual(dataset.summary, summary)
        self.assertEqual(dataset.citation, citation)

        xml = dataset.to_xml()
        self.assertEqual(xml.tag, ds_type)
        self.assertDictEqual(xml.attrib, {'id': xml_id})
        self.assertEqual(xml.find('Name').text, name)
        self.assertEqual(xml.find('Description').text, description)
        self.assertEqual(xml.find('Summary').text, summary)
        self.assertEqual(xml.find('Path').text, ds_path)
        self.assertEqual(xml.find('Citation').text, citation)
