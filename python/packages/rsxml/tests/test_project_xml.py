"""[summary]"""
import unittest
import os
from uuid import uuid4
import xml.etree.cElementTree as ET

from rsxml import project_xml
from rsxml.project_xml import MetaData, Dataset

MOCK_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'mock')


def validate_xml(element):
    try:
        """ Make sure the XML we generate is valid and can go back and forth cleanly
        between ElementTree and string.

        In general you should probably only use this in unit tests
        """
        xml_node = element.to_xml()
        ET.fromstring(ET.tostring(xml_node, encoding='utf8'))
        return True
    except Exception as e:
        return False


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
        meta = MetaData(values=[
            project_xml.Meta(name='test_key', value='test_value'),
            project_xml.Meta(name='test_key2', value='test_value2')
        ])

        rsobj = project_xml.RSObj(xml_id=xml_id,
                                  xml_tag=xml_tag,
                                  name=name,
                                  summary=summary,
                                  description=description,
                                  citation=citation,
                                  meta_data=meta
                                  )
        self.assertTrue(validate_xml(rsobj))
        self.assertEqual(rsobj.xml_id, xml_id)
        self.assertEqual(rsobj.xml_tag, xml_tag)
        self.assertEqual(rsobj.name, name)
        self.assertEqual(rsobj.summary, summary)
        self.assertEqual(rsobj.description, description)
        self.assertEqual(rsobj.citation, citation)

        xml = rsobj.to_xml()
        self.assertEqual(xml.attrib['id'], xml_id)
        self.assertEqual(xml.find('Name').text, name)
        self.assertEqual(xml.find('Summary').text, summary)
        self.assertEqual(xml.find('Description').text, description)
        self.assertEqual(xml.find('Citation').text, citation)
        self.assertEqual(xml.find('MetaData/Meta/[@name=\'test_key\']').text, 'test_value')
        self.assertEqual(xml.find('MetaData/Meta[@name=\'test_key2\']').text, 'test_value2')

        rsobj2 = project_xml.RSObj.from_xml(xml)
        self.assertEqual(rsobj, rsobj2)

        # Now test differences
        rsobj3 = project_xml.RSObj.from_xml(xml)
        rsobj3.meta_data.remove_meta('test_key2')
        self.assertNotEqual(rsobj, rsobj3)

        rsobj4 = project_xml.RSObj.from_xml(xml)
        rsobj4.name = 'newNAME'
        self.assertNotEqual(rsobj, rsobj4)

        rsobj5 = project_xml.RSObj.from_xml(xml)
        rsobj5.summary = 'newSUMMARY'
        self.assertNotEqual(rsobj, rsobj5)

        rsobj6 = project_xml.RSObj.from_xml(xml)
        rsobj6.description = None
        self.assertNotEqual(rsobj, rsobj6)

        rsobj7 = project_xml.RSObj.from_xml(xml)
        rsobj7.citation = 'newCITATION'
        self.assertNotEqual(rsobj, rsobj7)

        rsobj8 = project_xml.RSObj.from_xml(xml)
        rsobj8.meta_data.add_meta(name='test_key3', value='test_value3')
        rsobj8.meta_data.add_meta('test_key4', 'test_value4')
        self.assertNotEqual(rsobj, rsobj8)


class ProjectClasses(unittest.TestCase):
    """[summary]"""

    def test_project_bounds_init(self):
        """[summary]
        """
        bounds = project_xml.ProjectBounds(
            bounding_box=project_xml.BoundingBox(-1.0, -2.0, -0.5, -0.5),
            centroid=project_xml.Coords(-0.75, -1.25),
            filepath='test_path/test.geojson'
        )
        self.assertTrue(validate_xml(bounds))
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
        warehouse = project_xml.Warehouse(guid, api_url=api_url)
        self.assertTrue(validate_xml(warehouse))

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
        bounds = project_xml.ProjectBounds(
            bounding_box=project_xml.BoundingBox(-1.0, -2.0, -0.5, -0.5),
            centroid=project_xml.Coords(-0.75, -1.25),
            filepath='test_path/test.geojson'
        )
        meta_data = project_xml.MetaData([project_xml.Meta(name='test_key', value='test_value')])

        project = project_xml.Project(
            name=name,
            project_type=project_type,
            description=description,
            summary=summary,
            citation=citation,
            bounds=bounds,
            meta_data=meta_data,
        )

        self.assertEqual(project.name, name)
        self.assertEqual(project.description, description)
        self.assertEqual(project.project_type, project_type)
        self.assertEqual(project.summary, summary)
        self.assertEqual(project.citation, citation)
        self.assertEqual(project.bounds, bounds)
        self.assertEqual(project.meta_data, meta_data)
        self.assertTrue(validate_xml(project))

        xml = project.to_xml()
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

        dataset = project_xml.Dataset(
            xml_id=xml_id,
            name=name,
            ds_type=ds_type,
            path=ds_path,
            description=description,
            summary=summary,
            citation=citation
        )
        self.assertTrue(validate_xml(dataset))

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

        dataset2 = Dataset.from_xml(xml)
        self.assertEqual(dataset2, dataset)

        dataset3 = Dataset.from_xml(xml)
        dataset3.meta_data.add_meta('test_key', 'test_value')
        self.assertNotEqual(dataset3, dataset)

        dataset4 = Dataset.from_xml(xml)
        dataset4.name = 'test_name'
        self.assertNotEqual(dataset4, dataset)

    def test_logs(self):
        log_obj = project_xml.Log(
            xml_id='SOMEID',
            name='test_log',
            description='test description',
            summary='test summary',
            citation='test citation',
            path='test_path/log.log'
        )

        xml = log_obj.to_xml()
        self.assertEqual(xml.tag, 'LogFile')
        self.assertEqual(xml.find('Name').text, 'test_log')
        self.assertEqual(xml.find('Description').text, 'test description')
        self.assertEqual(xml.find('Summary').text, 'test summary')
        self.assertEqual(xml.find('Citation').text, 'test citation')
        self.assertEqual(xml.find('Path').text, 'test_path/log.log')

        log2 = Dataset.from_xml(xml)
        self.assertEqual(log2, log_obj)

        log_obj3 = Dataset.from_xml(xml)
        log_obj3.meta_data.add_meta('test_key', 'test_value')
        self.assertNotEqual(log_obj3, log_obj)

        log_obj4 = Dataset.from_xml(xml)
        log_obj4.name = 'test_name'
        self.assertNotEqual(log_obj4, log_obj)

    def test_metadata(self):

        # Test the metadata types
        test_meta = MetaData(values=[
            project_xml.Meta(name='test_key', value='test_no_type'),
            project_xml.Meta(name='test_key2', value='test_valid_type', type='filepath')
        ])
        self.assertTrue(validate_xml(test_meta))

        try:
            test_meta2 = MetaData(values=[
                project_xml.Meta(name='test_key2', value='test_invalid_type', type='invalid_type')
            ])
            # Should not be able to get here with invalid metadata
            self.fail('Expected ValueError')
        except ValueError:
            pass

        # Test the ext types
        test_meta3 = MetaData(values=[
            project_xml.Meta(name='test_key', value='test_no_type'),
            project_xml.Meta(name='test_key2', value='test_valid_ext', ext='project')
        ])

        try:
            test_meta4 = MetaData(values=[
                project_xml.Meta(name='test_key2', value='test_invalid_ext', ext='invalid_ext')
            ])
            # Should not be able to get here with invalid metadata
            self.fail('Expected ValueError')
        except ValueError:
            pass

    def test_geopackage(self):

        gpkg = project_xml.Geopackage(
            xml_id='SOMEID',
            name='test_geopackage',
            description='test description',
            summary='test summary',
            citation='test citation',
            path='test_path/test.gpkg',
            layers=[
                project_xml.GeopackageLayer(
                    name='test_layer',
                    citation='test citation',
                    description='test description',
                    ds_type=project_xml.GeoPackageDatasetTypes.RASTER,
                    ext_ref='test_path/test.tiff',
                    lyr_name='test_layer',
                    meta_data=MetaData(values=[
                        project_xml.Meta(name='test_key', value='test_no_type'),
                        project_xml.Meta(name='test_key2', value='test_valid_type', type='filepath')
                    ])
                )
            ]
        )

        xml = gpkg.to_xml()
        self.assertEqual(xml.tag, 'Geopackage')
        self.assertEqual(xml.find('Name').text, 'test_geopackage')
        self.assertEqual(xml.find('Description').text, 'test description')
        self.assertEqual(xml.find('Summary').text, 'test summary')
        self.assertEqual(xml.find('Citation').text, 'test citation')
        self.assertEqual(xml.find('Path').text, 'test_path/test.gpkg')

        gpkg2 = project_xml.Geopackage.from_xml(xml)
        self.assertEqual(gpkg2, gpkg)

        gpkg3 = project_xml.Geopackage.from_xml(xml)
        gpkg3.meta_data.add_meta('test_key', 'test_value')
        self.assertNotEqual(gpkg3, gpkg)

        gpkg4 = project_xml.Geopackage.from_xml(xml)
        gpkg4.name = 'test_name'
        self.assertNotEqual(gpkg4, gpkg)

    def test_geopackage_add_layer(self):

        gpkg = project_xml.Geopackage(
            xml_id='SOMEID',
            name='test_geopackage',
            description='test description',
            summary='test summary',
            citation='test citation',
            path='test_path/test.gpkg',
        )

        gpkg.layers.append(
            project_xml.GeopackageLayer(
                name='test_layer',
                citation='test citation',
                description='test description',
                ds_type=project_xml.GeoPackageDatasetTypes.RASTER,
                ext_ref='test_path/test.tiff',
                lyr_name='test_layer',
                meta_data=MetaData(values=[
                    project_xml.Meta(name='test_key', value='test_no_type'),
                    project_xml.Meta(name='test_key2', value='test_valid_type', type='filepath')
                ])
            )
        )

        xml = gpkg.to_xml()

        gpkg2 = project_xml.Geopackage.from_xml(xml)
        self.assertEqual(gpkg2, gpkg)

    def test_metadata_parsing(self):
        """Test the px.MetaData class constructor
        """

        xml_node = """
        <MetaData>
            <Meta name="test_key">
                test value
            </Meta>
            <Meta name="test_key2" type="filepath">
                test value 2 😎
            </Meta>
            <Meta name="test_key3" ext="project">
            <![CDATA[
                test value 3 1245 🚀 \\ <thing>
                & ' " %^&*()_+=-[]{};:|,./<>?
            ]]>
            </Meta>
        </MetaData>
        """

        test_meta = MetaData.from_xml(ET.fromstring(xml_node))

        self.assertEqual(test_meta._values[0].name, 'test_key')
        self.assertEqual(test_meta._values[0].value, 'test value')
        self.assertEqual(test_meta._values[0].type, None)

        self.assertEqual(test_meta._values[1].name, 'test_key2')
        self.assertEqual(test_meta._values[1].value, 'test value 2 😎')
        self.assertEqual(test_meta._values[1].type, 'filepath')

        self.assertEqual(test_meta._values[2].name, 'test_key3')
        self.assertEqual(test_meta._values[2].value, 'test value 3 1245 🚀 \\ <thing>\n                & \' " %^&*()_+=-[]{};:|,./<>?')
        self.assertEqual(test_meta._values[2].ext, 'project')
