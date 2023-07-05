"""
Example showing how to create a project XML by calling methods separately
rather than specifying everything in the constructor (as in example 1).
"""
# in your code you woulf write:
# from riverscapes import rsxml
from rsxml.project_xml import (
    Project,
    ProjectBounds,
    Coords,
    BoundingBox,
    Dataset,
)
from rsxml import Logger
from datetime import date

if __name__ == '__main__':
    log = Logger('Project')
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
    )

    # Add some more project metadata
    project.meta_data.add_meta('Test2', 'Test Value 2')

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

    log.info('done')
