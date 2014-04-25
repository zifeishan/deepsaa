#! /usr/bin/env python

import ddext

def init():
  ddext.input('sentence_id', 'bigint')
  ddext.input('words', 'text[]')
  ddext.input('gram_len', 'int')

  ddext.returns('sentence_id', 'bigint')
  ddext.returns('ngram', 'text')

def run(sentence_id, words, gram_len):
  sentence_ids = [sentence_id]
  ngram = []
  for i in range(len(words) - gram_len):
    ngram.append(' '.join(words[i : i + gram_len]))
    # Optimize: cross product...
    
  return (sentence_ids, ngram)
