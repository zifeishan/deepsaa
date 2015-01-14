#! /usr/bin/env python

import ddext
import json
from ddext import plpy

def init():
  ddext.input('sentence_id', 'bigint')
  ddext.input('publication_id', 'bigint')
  ddext.input('fname_prefix', 'text')
  ddext.input('fname', 'text[]')
  ddext.input('fval', 'real[]')
  
  ddext.returns('sentence_id', 'bigint')
  ddext.returns('publication_id', 'bigint')
  ddext.returns('fname_prefix', 'text')
  ddext.returns('fname', 'text')

def run(sentence_id, publication_id, fname_prefix, fname, fval):

  for i in range(len(fname)):
    name = fname_prefix + '_' + fname[i]
    val = fval[i]
    for times in range(int(val)):
      yield sentence_id, publication_id, fname_prefix, name
