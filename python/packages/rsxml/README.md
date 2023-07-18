# RSXML

This pip module contains a series of classes to help people generate compliant `project.rs.xml` files. These files lie at the heart of the Riverscapes Consortium data standards. Each collection of geospatial data is referred to as a "project" and must be accompanied by a single `project.rs.xml` file. The file must validate against the set of rules defined in the [riverscapes XSD schema](https://github.com/Riverscapes/RiverscapesXML/blob/master/Projects/XSD/V2/RiverscapesProject.xsd).

It is absolutely vital that once you have used this module to write one or more `project.rs.xml` files that you validate the output to ensure its compliance with the XSD ruleset. There are many ways to do this; the one we prefer is to use Visual Studio Code free code editor that is capable of validating XML when an XSD is specified. It even possesses Intellisense that can autocomplate XML tags and suggest fixes to problems.

# How to Use This Pip Module

The most common use case for this pip module is when you have a collection of data that you want to upload into the Riverscapes Data Exchange. You can use the classes in this module to write the `project.rs.xml`  file that MUST accompany your data before it can be uploaded. There are two approaches to do this:

## Construct a Project Directly

You can construct an instance of a `Project` class that incorporates all the necessary subcomponents such as metadata and datasets etc. Once you have constructed an instance of the Project class you can write it to an XML file. Here's a brief example showing a project with one ShapeFile and one Geopackage layer.


```python
 project = Project(
        name='Test Project',
        proj_path='project.rs.xml',
        project_type='VBET',
        description='This is a test project',
        citation='This is a citation',
        bounds=ProjectBounds(
            centroid=Coords(-21.23, 114.56),
            bounding_box=BoundingBox(-22, -21, 114, 116),
            filepath='project_bounds.json',
        ),
        meta_data=MetaData(values=[Meta('Test', 'Test Value')]),
        realizations=[
            Realization(
                xml_id='test',
                name='Test Realization',
                product_version='1.0.0',
                date_created=datetime(2021, 1, 1),
                summary='This is a test realization',
                description='This is a test realization',
                meta_data=MetaData(values=[Meta('Test', 'Test Value')]),
                datasets=[
                    Dataset(
                        xml_id='ds1',
                        name='Dataset1',
                        path='datasets/ds1.shp',
                        ds_type=GeoPackageDatasetTypes.VECTOR,
                        summary='This is a dataset',
                        description='This is a dataset',
                    ),
                    Geopackage(
                        xml_id='ds2',
                        name='Dataset2',
                        path='datasets/ds2.gpkg',
                        summary='This is a dataset',
                        description='This is a dataset',
                        citation='This is a citation',
                        meta_data=MetaData(values=[Meta('Test', 'Test Value')]),
                        layers=[
                            GeopackageLayer(
                                lyr_name='layer1',
                                name='Layer1',
                                ds_type=GeoPackageDatasetTypes.VECTOR,
                                 summary='This is a dataset',
                                description='This is a dataset',
                                citation='This is a citation',
                                meta_data=MetaData(values=[Meta('Test', 'Test Value')])
                            )
                        ]
                    )

                ],
                outputs=[
                    Dataset(
                        xml_id='output1',
                        name='OutputDS1',
                        path='datasets/output.tiff',
                        ds_type=GeoPackageDatasetTypes.RASTER,
                        summary='This is a input dataset',
                        description='This is a input dataset',
                    )
                ],
            )
        ]
    )

    # Write it to disk
    project.write()
```

## Construct a Project Sequentially

Alternatively you can start by constructing a project object and then add each of the required components. Again, finishing by writing the project to XML file.

```python

 project = Project(
        name='Test Project',
        proj_path='project.rs.xml',
        project_type='VBET',
        description='This is a test project',
        citation='This is a citation',
        bounds=ProjectBounds(
            centroid=Coords(-21.23, 114.56),
            bounding_box=BoundingBox(-22, -21, 114, 116),
            filepath='project_bounds.json',
        ),
    )

    # Add some project metadata
    project.meta_data.add_meta('Test2', 'Test Value 2')

    # Add a relaization
    my_real = Realization(
                xml_id='test',
                name='Test Realization',
                product_version='1.0.0',
                date_created=datetime(2021, 1, 1),
                summary='This is a test realization',
                description='This is a test realization',
                meta_data=MetaData(values=[Meta('Test', 'Test Value')])
    )

    # Add a dataset
    my_real = project.realizations[0]
    my_real.datasets.append(
        Dataset(
            xml_id='test2',
            name='Test Dataset 2',
            path='test2.gpkg',
            ds_type='CSV',
            ext_ref='f23b187a-537b-4dd0-8b71-4b7c4a6e9747:Project/Realizations/Realization#REALIZATION1/Datasets/Raster#DEM',
            summary='This is a test dataset 2',
            description='This is a test dataset 2'
        )
    )

    # Write it to disk
    project.write()

# Install

```sh
$ python -m pip install rsxml
```

# Changes

See [CHANGES.md](./CHANGES.md)

# Contribution & Development

RSXML was developed by [North Arrow Research Ltd.](https://northarrowresearch.com) in collaboration with the [Riverscapes Consortium](https://riverscapes.net).

# License

See [LICENSE](./LICENSE)

# Additional Resources

- [Riverscapes Consortium](https://riverscapes.net)
- [Riverscapes Data Exchange](https://data.riverscapes.net)
- [Riverscapes Project XSD Schema](https://github.com/Riverscapes/RiverscapesXML/blob/master/Projects/XSD/V2/RiverscapesProject.xsd)