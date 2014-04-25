#! /usr/bin/env python

import ddext

def init():
  ddext.input('sentence_id', 'bigint')
  ddext.input('sentence', 'text')
  ddext.input('gram_len', 'int')

  ddext.returns('sentence_id', 'bigint')
  ddext.returns('ngram', 'text')

def run(sentence_id, sentence, gram_len):
  sentence_ids = [sentence_id]
  ngram = []
  for i in range(len(sentence) - gram_len):
    ngram.append(sentence[i : i + gram_len])
    # sentence_ids.append(sentence_id)
    # Optimize: cross product...

  return (sentence_ids, ngram)
