#! /usr/bin/env python

import ddext

def init():
  ddext.input('sentence_id', 'bigint')
  ddext.input('publication_id', 'bigint')
  ddext.input('sentence', 'text')
  ddext.input('gram_len', 'int')

  ddext.returns('sentence_id', 'bigint')
  ddext.returns('publication_id', 'bigint')
  ddext.returns('ngram', 'text')
  ddext.returns('count', 'int')

def run(sentence_id, publication_id, sentence, gram_len):
  def IsASCII(s):
    return all(ord(c) < 128 for c in s)

  sentence_ids = [sentence_id]
  docids = [publication_id]
  ngram = {}
  for i in range(len(sentence) - gram_len):
    s = sentence[i : i + gram_len]
    if IsASCII(s):
      if s not in ngram:
        ngram[s] = 0
      ngram[s] += 1

    # sentence_ids.append(sentence_id)
    # Optimize: cross product...

  return (sentence_ids, docids, ngram.keys(), ngram.values())
