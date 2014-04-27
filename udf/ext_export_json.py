#! /usr/bin/env python

import ddext
import json
from ddext import plpy

#   CREATE TABLE export_feature (
#     sentence_id bigint,
#     publication_id bigint,
#     features text)
# DISTRIBUTED BY (publication_id);

def init():
  
  ddext.import_lib('json')

  ddext.input('sentence_id', 'bigint')
  ddext.input('publication_id', 'bigint')
  ddext.input('fname_prefix', 'text')
  ddext.input('fnames', 'text[]')
  ddext.input('fvals', 'float[]')
  
  ddext.returns('sentence_id', 'bigint')
  ddext.returns('publication_id', 'bigint')
  ddext.returns('features', 'text')
  
def run(sentence_id, publication_id, fname_prefix, fnames, fvals):
  features = {}
  for i in range(len(fnames)):
    name = fname_prefix + '_' + fnames[i]
    val = fvals[i]
    features[name] = val

  try:
    feature_str = json.dumps(features)
    return ([sentence_id], [publication_id], [feature_str])
  except:
    plpy.info("WARNING: CANNOT CONVERT JSON:", features)
