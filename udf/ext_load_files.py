#! /usr/bin/env python

import sys, re

### INPUT
# SELECT    m.id AS publication_id, path 
# FROM      document_paths

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

for line in sys.stdin:
  publication_id, path = line.rstrip('\n').split('\t')
  paras = open(path).readlines()
  for i in range(len(paras)):
    para = paras[i].rstrip('\n')
    print '\t'.join([str(x) for x in [
      publication_id,
      i,    # from 0
      re.sub(r'\\', r'\\\\', para),
      '\N', # name
      '\N', # arxiv id
      '\N', # paragraph_id
      ]])
  print >>sys.stderr, 'Loaded file:', publication_id
