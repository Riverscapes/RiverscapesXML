import argparse

def migrate_xml_file(in_path:str, out_path:str) -> str:
  """Safely translate from the old path to the new path

  Args:
      in_path (str): [description]

  Returns:
      str: [description]
  """
  return in_path + " hello"

def main():
  translate_path = ""
  print('HELLO')
  print (translate_path('I am '))
  pass



if __name__ == '__main__':
  main()
