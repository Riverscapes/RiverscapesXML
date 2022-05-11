import argparse

def translate_s3_path(in_path:str) -> str:
  """Safely translate from the old path to the new path

  Args:
      in_path (str): [description]

  Returns:
      str: [description]
  """
  return in_path + " hello"


def pre_fix_paths() -> str:
  """Sometimes the old paths need to be changed first because they are broken
  We'll need to make a map of old paths to new paths before we translate them to the 
  new S3 buckets

  Returns:
      str: [description]
  """
  pass

def main():
  translate_path = ""
  print('HELLO')
  print (translate_path('I am '))
  pass



if __name__ == '__main__':
  main()
