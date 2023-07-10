"""_summary_"""
from __future__ import annotations
from typing import List
import os
from rsxml import Logger
from rsxml import project_xml
from rsxml import validate_project_file


class ProjectValidation:
    """_summary_
    """

    def __init__(self,
                 folder_path: str,
                 errors: List[str] = [],
                 warnings: List[str] = [],
                 unreferenced_files: List[str] = [],
                 missing_files: List[str] = []) -> None:
        self.log = Logger('ProjectValidation')
        self.errors = errors
        self.warnings = warnings
        self.unreferenced_files = unreferenced_files
        self.missing_files = missing_files
        self.folder_path = folder_path
        self.all_files = []
        self._validate()

    @property
    def valid(self):
        return len(self._errors) == 0

    def _validate_dataset(self, dataset: project_xml.Dataset):
        path = dataset.path

    def _validate(self):
        """Note: We return when we cannot go on
        """
        # Make sure the folder exists
        if not os.path.exists(self.folder_path) or not os.path.isdir(self.folder_path):
            self.errors.append(f'Folder does not exist: {self.folder_path}')
            return

        # Make sure the project.xml file exists
        project_xml_path = os.path.join(self.folder_path, 'project.rs.xml')
        if not os.path.exists(project_xml_path) or not os.path.isfile(project_xml_path):
            self.errors.append(f'project.rs.xml file does not exist: {project_xml_path}')
            return

        # Validate the project.xml file
        xml_validation_result, xml_validation_log = validate_project_file(project_xml_path)
        if not xml_validation_result:
            self.errors.append(f'project.rs.xml file is invalid: {project_xml_path} with {len(xml_validation_log)} errors')
            # Add all the XML errors to the project validation errors
            self.errors.extend(xml_validation_log)
            return

        # Get a list of all relative paths for all files in the project folder
        self.all_files = []
        for root, dirs, files in os.walk(self.folder_path):
            relpath = os.path.relpath(root, self.folder_path) if root != self.folder_path else ''
            for file in files:
                # Ignore the project.xml file and hidden files
                if file != 'project.rs.xml' and not file.startswith('.'):
                    self.all_files.append(os.path.join(relpath, file))

        # Now parse the Project file
        proj = project_xml.Project.load_project(project_xml_path)

        for dataset in proj.common_datasets:
            self._validate_dataset(dataset)

        for real in proj.realizations:
            for dataset in real.datasets:
                self._validate_dataset(dataset)
            for input in real.inputs:
                self._validate_dataset(input)
            for output in real.outputs:
                self._validate_dataset(output)
            for log in real.logs:
                self._validate_dataset(log)
            for intermediate in real.intermediates:
                self._validate_dataset(intermediate)

            for analysis in real.analyses:
                for configuration in analysis.configuration:
                    self._validate_dataset(configuration)
                for product in analysis.products:
                    self._validate_dataset(product)
