#! /usr/bin/env python

import ddext

def init():
  ddext.input('sentence_id', 'bigint')
  ddext.input('publication_id', 'bigint')
  ddext.input('words', 'text[]')
  ddext.input('gram_len', 'int')

  ddext.returns('sentence_id', 'bigint')
  ddext.returns('publication_id', 'bigint')
  ddext.returns('ngram', 'text')
  ddext.returns('count', 'int')

def run(sentence_id, publication_id, words, gram_len):
  sentence_ids = [sentence_id]
  docids = [publication_id]
  ngram = {}
  for i in range(len(words) - gram_len):
    gram = ' '.join(words[i : i + gram_len])
    if gram not in ngram:
      ngram[gram] = 0
    ngram[gram] += 1
    # Optimize: cross product...
    
  return (sentence_ids, docids, ngram.keys(), ngram.values())
