#! /usr/bin/env python

import ddext

# CREATE TABLE f_sentence_stats (
#     sentence_id bigint,
#     fname text,
#     fval bigint);

def init():
  ddext.input('sentence_id', 'bigint')
  ddext.input('document_id', 'bigint')
  ddext.input('words', 'text[]')
  
  ddext.returns('sentence_id', 'bigint')
  ddext.returns('publication_id', 'bigint')
  ddext.returns('fname', 'text')
  ddext.returns('fval', 'int')

def run(sentence_id, document_id, words):

  if 'dict_en' in SD:
    dict_en = SD['dict_en']
  else:
    DICT_FILE = '/usr/share/dict/words'
    dict_en = set([l.strip() for l in open(DICT_FILE).readlines()])
    SD['dict_en'] = dict_en

  def DictValid(word):
    return word in dict_en

  errors = [x for x in words if not DictValid(x)]
  if len(errors) > 0:
    yield sentence_id, document_id, 'num_spell_errors', len(errors)
