"""
Example demonstrating how to load an existing project XML file
and update it by adding some metadata and a realization.
This is just a basic demonstration. You can also load a
project XML file and add realizations, datasets, etc. to it.
"""
# in your code you woulf write:
# from riverscapes import rsxml
from rsxml.project_xml import (
    Project,
    Dataset,
)
from rsxml import Logger
from datetime import date

if __name__ == '__main__':

    log = Logger('Project')

    # open and parse and existing project XML file
    project = Project.load_project('project.rs.xml')

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
