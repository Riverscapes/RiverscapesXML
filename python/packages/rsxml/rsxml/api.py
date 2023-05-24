# # from graphql import query
# # from path import expanduser
# import os
# import json
# from pathlib import Path
# import requests
# # from lib.hashes import checkEtag
# from rsxml import Logger, ProgressBar


# class QueryMonster:

#     def __init__(self, api_url=None, api_user=None, api_password=None):
#         self.jwt = None
#         self.api_url = api_url
#         self.api_user = api_user
#         self.api_password = api_password

#         # 1). Load the .riverscapes file. This gets us the URL to the graphql endpoint
#         if (not self.api_password or not self.api_url or not self.api_user):
#             self.config_obj, self.programs = self.load_config()
#             self.program_id = self.config_obj['id']
#             self.api_url = self.config_obj['url']
#         else:
#             self.config_obj = {
#                 "url": self.api_url,
#                 "apiUser": self.api_user,
#                 "apiPass": self.api_password,
#             }

#         # 2). Call the URL from config_obj to get the cognito user pool id
#         self.gql_auth_obj = self.auth_query()

#         # 3) Get the JWT we will need to make queries
#         self.cognito_login()

#     def load_config(self):
#         """load the .riverscapes config file
#         """
#         log = Logger('API')
#         log.debug('Loading Config file')
#         with open(os.path.join(Path.home(), '.riverscapes')) as json_file:
#             data = json.load(json_file)
#         return data['programs'][data['default']], data['programs']

#     def cognito_login(self):
#         """Log into cognito and retrieve the JWT token

#         Arguments:
#             auth_meta {[type]} -- [description]
#             config_obj {[type]} -- [description]exit


#         Returns:
#             [type] -- [description]
#         """
#         client = boto3.client('cognito-idp')
#         resp = client.admin_initiate_auth(
#             UserPoolId=self.gql_auth_obj['userPool'],
#             ClientId=self.gql_auth_obj['clientId'],
#             AuthFlow='ADMIN_USER_PASSWORD_AUTH',
#             AuthParameters={
#                 "USERNAME": self.config_obj['apiUser'],
#                 "PASSWORD": self.config_obj['apiPass']
#             }
#         )
#         self.jwt = resp['AuthenticationResult']['AccessToken']

#     def run_query(self, query, variables):  # A simple function to use requests.post to make the API call. Note the json= section.
#         log = Logger('API_QUERY')
#         headers = {"Authorization": "Bearer " + self.jwt if self.jwt else "Bearer EMPTY"}
#         request = requests.post(self.api_url, json={
#             'query': query,
#             'variables': variables
#         }, headers=headers)

#         if request.status_code == 200:
#             resp_json = request.json()
#             if 'errors' in resp_json and len(resp_json['errors']) > 0:
#                 log.error(json.dumps(resp_json, indent=4, sort_keys=True))
#                 # Authentication timeout: re-login and retry the query
#                 if len(list(filter(lambda err: 'You must be authenticated' in err['message'], resp_json['errors']))) > 0:
#                     log.warning("Authentication timed out. Fetching new token...")
#                     self.cognito_login()
#                     log.warning("   done. Re-trying query...")
#                     self.run_query(query, variables)
#             else:
#                 # self.last_pass = True
#                 # self.retry = 0
#                 return request.json()
#         else:
#             raise Exception("Query failed to run by returning code of {}. {}".format(request.status_code, query))

#     def download_file(self, api_file_obj, local_path, force=False):
#         """[summary]

#         Arguments:
#             api_file_obj {[type]} -- The dictionary that the API returns. should include the name, md5, size etc
#             local_path {[type]} -- the file's local path

#         Keyword Arguments:
#             force {bool} -- if true we will download regardless
#         """
#         log = Logger('API_Download')
#         file_is_there = os.path.exists(local_path) and os.path.isfile(local_path)
#         etagMatch = file_is_there and checkEtag(local_path, api_file_obj['md5'])

#         if force is True or not file_is_there or not etagMatch:
#             if file_is_there and not etagMatch:
#                 log.warning('        File etag mismatch. Re-downloading: {}'.format(local_path))
#             elif not file_is_there:
#                 log.debug('        Downloading: {}'.format(local_path))
#             r = requests.get(api_file_obj['downloadUrl'], allow_redirects=True, stream=True)
#             total_length = r.headers.get('content-length')

#             dl = 0
#             with open(local_path, 'wb') as f:
#                 if total_length is None:  # no content length header
#                     f.write(r.content)
#                 else:
#                     progbar = ProgressBar(int(total_length), 50, local_path, byteFormat=True)
#                     for data in r.iter_content(chunk_size=4096):
#                         dl += len(data)
#                         f.write(data)
#                         progbar.update(dl)
#                     progbar.erase()
#             return True
#         return False

#     def auth_query(self):
#         result = self.run_query(QueryMonster._GQL_Auth, {})  # Execute the query
#         return result['data']['auth']  # Drill down the dictionary

#     def programs_query(self):
#         result = self.run_query(QueryMonster._GQL_Programs, {})  # Execute the query
#         return result['data']['programs']  # Drill down the dictionary

#     def search_query(self, projType, nameStr, metaStr, metaArr, tags, limit=10, nextToken=0, program_id=None, no_files=False):
#         qry_prog_id = program_id if program_id is not None else self.program_id
#         if not qry_prog_id:
#             raise Exception('You must specify a program')
#         qry = QueryMonster._GQL_Search_NOFILES if no_files is True else QueryMonster._GQL_Search
#         result = self.run_query(qry, {
#             "program": qry_prog_id,
#             "projType": projType,
#             "nameStr": nameStr,
#             "metaStr": metaStr,
#             "metaArr": metaArr,
#             "tags": tags,
#             "limit": limit,
#             "nextToken": nextToken
#         })  # Execute the query
#         # ($program: String!, $projType: String, $nameStr: String, $metaStr: String, $metaArr: String, $tags: String, $limit: Int, $nextToken: Int)

#         retval = result['data']['search'] if result else {'total': 0, 'projects': []}  # Drill down the dictionary
#         return retval

#     def get_layer_paths(self, project_id: str, program_id=None):
#         qry_prog_id = program_id if program_id is not None else self.program_id
#         if not qry_prog_id:
#             raise Exception('You must specify a program')
#         qry = QueryMonster._GQL_getLayerPaths
#         result = self.run_query(qry, {
#             "program": qry_prog_id,
#             "id": project_id
#         })  # Execute the query
#         # ($program: String!, $projType: String, $nameStr: String, $metaStr: String, $metaArr: String, $tags: String, $limit: Int, $nextToken: Int)
#         ret_arr = [x['layerPath'] for x in result['data']['project']['tree']['leaves'] if x['layerPath'] is not None and x['layerType'] != 'file'] if result else []
#         retval = list(set(ret_arr))
#         return retval

#     def getLayerTiles(self, program_id: str, projId: str, projType: str, layerPath: str):
#         qry_prog_id = program_id if program_id is not None else self.program_id
#         if not qry_prog_id:
#             raise Exception('You must specify a program')
#         qry = QueryMonster._GQL_getLayerTiles
#         result = self.run_query(qry, {
#             "program": qry_prog_id,
#             "id": projId,
#             "projType": projType,
#             "layerPath": layerPath,
#         })  # Execute the query
#         # ($program: String!, $projType: String, $nameStr: String, $metaStr: String, $metaArr: String, $tags: String, $limit: Int, $nextToken: Int)

#         retval = result['data']['getLayerTiles'] if result else {'projects': []}  # Drill down the dictionary
#         return retval

#     #     queueTileRebuild(id: $id, program: $program, projType: $projType, filePath: $filePath, symbologies: $symbologies)
#     def rebuild_tiles(self, projType, id, filePath, symbologies, program_id=None):
#         qry_prog_id = program_id if program_id is not None else self.program_id
#         if not qry_prog_id:
#             raise Exception('You must specify a program')
#         qry = QueryMonster._GQL_queueTileRebuild
#         result = self.run_query(qry, {
#             "program": qry_prog_id,
#             "projType": projType,
#             "id": id,
#             "filePath": filePath,
#             "symbologies": symbologies,
#         })  # Execute the query
#         return result['data']['queueTileRebuild'] if result and 'data' in result else result

#     def reindex_project(self, projType, id, program_id=None):
#         qry_prog_id = program_id if program_id is not None else self.program_id
#         if not qry_prog_id:
#             raise Exception('You must specify a program')

#         qry = QueryMonster._GQL_reIndexProject
#         result = self.run_query(qry, {
#             "program": qry_prog_id,
#             "projType": projType,
#             "id": id,
#         })  # Execute the query
#         return result

#     _GQL_Programs = """
#         query Programs {
#             programs {
#                 name
#                 machineName
#                 projectXSDs
#                 projectFile
#                 products {
#                     id
#                     name
#                     folder
#                     pathArr
#                 }
#                 hierarchy
#                 meta
#             }
#         }
#         """

#     _GQL_Auth = """
#         query Ping {
#             auth{
#             loggedIn
#             userPool
#             clientId
#             regionTODO
#             __typename
#             }
#         }
#         """
#     _GQL_Search = """
#         query searchQuery($program: String!, $projType: String, $nameStr: String, $metaStr: String, $metaArr: String, $tags: String, $limit: Int, $nextToken: Int) {
#             search(program: $program, projType: $projType, nameStr: $nameStr, metaStr: $metaStr, metaArr: $metaArr, tags: $tags,limit: $limit, nextToken: $nextToken) {
#                 projects {
#                     id
#                     name
#                     meta
#                     tags
#                     projType
#                     totalSize
#                     program
#                     createdOn
#                     updatedOn
#                     files {
#                         key
#                         size
#                         md5
#                         downloadUrl
#                     }
#                 }
#             nextToken
#             total
#             }
#         }
#         """
#     _GQL_Search_NOFILES = """
#         query searchQuery($program: String!, $projType: String, $nameStr: String, $metaStr: String, $metaArr: String, $tags: String, $limit: Int, $nextToken: Int) {
#             search(program: $program, projType: $projType, nameStr: $nameStr, metaStr: $metaStr, metaArr: $metaArr, tags: $tags,limit: $limit, nextToken: $nextToken) {
#                 projects {
#                     id
#                     name
#                     meta
#                     tags
#                     projType
#                     totalSize
#                     program
#                     createdOn
#                     updatedOn
#                 }
#             nextToken
#             total
#             }
#         }
#         """
#     _GQL_queueTileRebuild = """
#         mutation queueTileRebuild($id: ID!, $program: String!, $projType: String!, $filePath: String, $symbologies: [String]) {
#             queueTileRebuild(id: $id, program: $program, projType: $projType, filePath: $filePath, symbologies: $symbologies)
#         }
#     """

#     _GQL_reIndexProject = """
#     mutation reindexProject($id: ID!, $program: String!, $projType: String!) {
#         reIndexProject(id: $id, program: $program, projType: $projType) {
#             message
#             results
#             errors
#         }
#     }
#     """

#     _GQL_getLayerTiles = """
#     query getLayerTiles($program: String!, $id: ID!, $projType: String!, $layerPath: String!) {
#       getLayerTiles(program: $program, id: $id,  projType: $projType, layerPath: $layerPath){
#         status
#         lastStatus
#         error
#         rsLayer
#         started
#         duration
#         url
#         indexUrl
#         format
#         bounds
#         maxZoom
#         minZoom
#         originFile{
#         lastModified
#         etag
#         size
#         key
#         }
#     }
#     }
#     """

#     _GQL_getLayerPaths = """
#     query getLayerPaths($program: String!, $id: ID!) {
#       project(program: $program, id: $id){
#           tree {
#             leaves {
#               layerType
#               layerPath
#             }
#           }
#       }
#     }
#     """

#     _GQL_requestUpload = """
#     query requestUpload($id: ID!, $files: [String!], $program: String!, $projectType: String!) {
#       requestUpload(id: $id, files: $files, program: $program, projectType: $projectType){
#         id
#         uploadUrls {
#           url
#           fields
#           origPath
#         }
#       }
#     }
#     """
