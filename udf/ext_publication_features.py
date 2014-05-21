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
  ddext.returns('fname_prefix', 'text')
  ddext.returns('fname', 'text')
  ddext.returns('fval', 'real')
  
def run(publication_id, fname_prefix, fname, fval):
  features = {}

  # fval > thisvalue
  if 'thresholds' in SD:
    thresholds = SD['thresholds']  
  else:
    thresholds = {
      'w3' : 1.48470246595451 * 5, # too much
      'w1' : 5.8058899885636 * 3,
      'punc' : 3.00631001371742,
      'funcword2' : 3.10698730794923  * 3,
      'c3' : 14.6636493060225 * 5, # too much
      'pos2' : 18.7260174418605  * 3,
      'funcword1' : 19.7095789080791,
      'stopword1' : 22.2743925435052,
      'c2' : 65.1577991943297  * 3,
      'pos1' : 255.721997874601,
      'c1' : 733.906931818182,
      'nondict' : 3214.06140350877
    }
    SD['thresholds'] = thresholds

  # All features are addable: doc stats / Ngram
  for i in range(len(fname)):
    name = fname_prefix + '_' + fname[i]
    val = fval[i]
    if name not in features:
      features[name] = 0.0
    features[name] += val

  this_threshold = 0
  if fname_prefix in thresholds:
    this_threshold = thresholds[fname_prefix]

  for name in features:
    if features[name] > this_threshold:
      yield publication_id, fname_prefix, name, features[name]

# deepsaa=# select fname_prefix, avg(fval) as avg from f_publication group by fname_prefix order by avg limit 100;
#  fname_prefix |       avg
# --------------+------------------
#  w3           | 1.48470246595451
#  punc         | 3.00631001371742
#  funcword2    | 3.10698730794923
#  w1           |  5.8058899885636
#  c3           | 14.6636493060225
#  pos2         | 18.7260174418605
#  funcword1    | 19.7095789080791
#  stopword1    | 22.2743925435052
#  c2           | 65.1577991943297
#  pos1         | 255.721997874601
#  c1           | 733.906931818182
#  nondict      | 3214.06140350877
# (10 rows)


# deepsaa=# select fname_prefix, median(fval) as median from f_publication group by fname_prefix order by median limit 100;
#  fname_prefix | median
# --------------+--------
#  punc         |      1
#  funcword2    |      1
#  w3           |      1
#  w1           |      2
#  funcword1    |      3
#  c3           |      4
#  pos2         |      4
#  stopword1    |      5
#  c2           |      9
#  c1           |   80.5
#  pos1         |     84
#  nondict      | 3394.5