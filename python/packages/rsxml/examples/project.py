# in your code you woulf write:
# from riverscapes import rsxml
from src.rsxml import Project, MetaData, Meta, ProjectBounds, Coords, BoundingBox, Dataset, GeoPackageDatasetTypes, Realization
from datetime import date

if __name__ == '__main__':

    # Create a new Riverscapes Project from scratch
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
        meta_data=MetaData(values=Meta('Test', 'Test Value')),
        common_datasets=[
            Dataset(
                xml_id='test',
                name='Test Dataset',
                path='test.gpkg',
                ds_type=GeoPackageDatasetTypes.VECTOR,
                ext_ref='test.gpkg',
                summary='This is a test dataset',
                description='This is a test dataset',
            )
        ],
        realizations=[
            Realization(
                xml_id='test',
                name='Test Realization',
                product_version='1.0.0',
                date_created=date('2021-01-01'),
                summary='This is a test realization',
                description='This is a test realization',
                meta_data=MetaData(values=Meta('Test', 'Test Value')),
            )
        ]
    )

    # Add some more project metadata
    project.meta_data.add(Meta('Test2', 'Test Value 2'))

    # Add a dataset
    my_real = project.realizations[0]
    my_real.datasets.append(
        Dataset(
            xml_id='test2',
            name='Test Dataset 2',
            path='test2.gpkg',
            ds_type='CSV',
            ext_ref='test2.gpkg',
            summary='This is a test dataset 2',
            description='This is a test dataset 2'
        )
    )

    # Write it to disk
    project.write()

    # Now open and parse it
    new_project = Project.load_project('project.rs.xml')
