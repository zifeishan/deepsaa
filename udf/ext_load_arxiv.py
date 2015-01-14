#! /usr/bin/env python

import sys, re, os

### INPUT
# SELECT  id AS publication_id, 
#         arxiv_id 
# FROM    meta_publications NATURAL JOIN corpus;

### OUTPUT
# CREATE TABLE paragraphs (
#   document_id   BIGINT,
#   pid           BIGINT, -- Relative paragraph id
#   paragraph     TEXT, 
#   author_name   TEXT, 
#   arxiv_id      TEXT,
#   paragraph_id  BIGINT -- Unique paragraph identifier
# ) 
# DISTRIBUTED BY (document_id);

ARXIV_DIR = '/lfs/local/0/dbritz/arxiv/pdf/'
if 'ARXIV_DIR' in os.environ:
  ARXIV_DIR = os.environ['ARXIV_DIR']

for line in sys.stdin:
  publication_id, arxiv_id = line.rstrip('\n').split('\t')
  dir1 = arxiv_id.rsplit('/', 1)[-1][:4]
  filename = re.sub('/', '',arxiv_id) + '.pdf.txt'

  fullpath = ARXIV_DIR + '/' + dir1 + '/' + filename

  if os.path.exists(fullpath):
    print >>sys.stderr, 'Reading from:', fullpath
  else:
    print >>sys.stderr, 'Cannot find path:', fullpath
    continue

  paras = [l.rstrip('\n') for l in open(fullpath).readlines()]

  for i in range(len(paras)):
    para = paras[i]
    print '\t'.join([str(x) for x in [
      publication_id,
      i,    # from 0
      re.sub(r'\\', r'\\\\', para),
      '\N', # name
      arxiv_id, # arxiv id
      '\N', # paragraph_id
      ]])
  # print >>sys.stderr, 'Loaded file:', publication_id
