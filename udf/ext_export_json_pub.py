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

  ddext.input('publication_id', 'bigint')
  ddext.input('fname_prefix', 'text')
  ddext.input('fname', 'text[]')
  ddext.input('fval', 'float[]')
  
  ddext.returns('publication_id', 'bigint')
  ddext.returns('features', 'text')
  
def run(publication_id, fname_prefix, fname, fval):
  features = {}

  # All features are addable: doc stats / Ngram
  for i in range(len(fname)):
    name = fname_prefix + '_' + fname[i]
    val = fval[i]
    if name not in features:
      features[name] = 0.0
    features[name] += val

  try:
    feature_str = json.dumps(features)
    yield (publication_id, feature_str)
  except Exception as e:
    plpy.info("WARNING: CANNOT CONVERT JSON:", features)
    plpy.info(e.message)
