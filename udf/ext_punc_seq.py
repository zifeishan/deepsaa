#! /usr/bin/env python

# #### Punc POS list
# Anything not starting with [A-Z]

import ddext

def init():
  ddext.input('sentence_id', 'bigint')
  ddext.input('document_id', 'bigint')
  ddext.input('words', 'text[]')
  ddext.input('pos_tags', 'text[]')

  ddext.returns('sentence_id', 'bigint')
  ddext.returns('publication_id', 'bigint')
  ddext.returns('fname', 'text')
  ddext.returns('fval', 'int')

def run(sentence_id, document_id, words, pos_tags):
  ngram = {}
  punc_indexes = [i for i in range(len(pos_tags)) if pos_tags[i][0] not in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ']
  
  yield sentence_id, document_id, ''.join([words[i] for i in punc_indexes]), 1
