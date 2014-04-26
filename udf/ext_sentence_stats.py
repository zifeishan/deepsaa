#! /usr/bin/env python

import ddext

# CREATE TABLE f_sentence_stats (
#     sentence_id bigint,
#     fname text,
#     fval bigint);

def init():
  ddext.input('sentence_id', 'bigint')
  ddext.input('publication_id', 'bigint')
  ddext.input('sentence', 'text')
  ddext.input('words', 'text[]')
  
  ddext.returns('sentence_id', 'bigint')
  ddext.returns('publication_id', 'bigint')
  ddext.returns('fname', 'text')
  ddext.returns('fval', 'bigint')

def run(sentence_id, publication_id, sentence, words):
  sentence_ids = [sentence_id]
  docids = [publication_id]
  fname = []
  fval = []
  fname.append('num_chars')
  fval.append(len(sentence))
  fname.append('num_words')
  fval.append(len(words))
    
  return (sentence_ids, docids, fname, fval)
