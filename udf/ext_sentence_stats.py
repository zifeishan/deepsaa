#! /usr/bin/env python

import ddext

# CREATE TABLE f_sentence_stats (
#     sentence_id bigint,
#     fname text,
#     fval bigint);

def init():
  ddext.input('sentence_id', 'bigint')
  ddext.input('document_id', 'bigint')
  ddext.input('sentence', 'text')
  ddext.input('words', 'text[]')
  
  ddext.returns('sentence_id', 'bigint')
  ddext.returns('publication_id', 'bigint')
  ddext.returns('fname', 'text')
  ddext.returns('fval', 'bigint')

def run(sentence_id, document_id, sentence, words):
  yield sentence_id, document_id, 'num_chars', len(sentence)
  yield sentence_id, document_id, 'num_words', len(words)
