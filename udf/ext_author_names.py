#! /usr/bin/env python

import ddext

# FirstName, LastName,FirstName, LastName,FirstName, LastName...
def init():
  ddext.import_lib('re')
  ddext.input('author_names', 'text')
  ddext.returns('name', 'text')
  
def run(author_names):
  tmp = re.sub(', ', '~^~', author_names.strip())
  authors = tmp.split(',')
  for author in authors:
    thisname = ', '.join(author.split('~^~'))
    # plpy.info(thisname)
    if len(thisname) > 0:
      yield (thisname,)
