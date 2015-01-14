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

  # e.g.: 3,M,2,M,3,2;1.
  ngram = {}
  punc_indexes = [i for i in range(len(pos_tags)) if pos_tags[i][0] not in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ']

  ret = ''
  last_punc_index = -1
  for i in punc_indexes:
    # Compute how many words between each two punctuations
    num_words_between = i - last_punc_index - 1
    if num_words_between > 3:
      ret += 'M'
    elif num_words_between > 0:
      ret += str(num_words_between)
    
    ret += words[i]
    last_punc_index = i

  yield sentence_id, document_id, ret, 1
