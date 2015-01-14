#! /usr/bin/env python

# #### Content words POS list

# NN* (nouns)
# JJ* (adjs)
# RB* (adverbs)
# VB* (verbs)


import ddext

def init():
  ddext.input('sentence_id', 'bigint')
  ddext.input('document_id', 'bigint')
  ddext.input('words', 'text[]')
  ddext.input('pos_tags', 'text[]')
  ddext.input('gram_len', 'int')

  ddext.returns('sentence_id', 'bigint')
  ddext.returns('publication_id', 'bigint')
  ddext.returns('ngram', 'text')
  ddext.returns('count', 'int')


def run(sentence_id, document_id, words, pos_tags, gram_len):
  ngram = {}
  content_pos_prefixes = ['NN', 'JJ', 'VB', 'RB']
  punc_indexes = [i for i in range(len(pos_tags)) if pos_tags[i][0] not in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ']

  function_word_indexes = [i for i in range(len(pos_tags)) if pos_tags[i][:2] not in content_pos_prefixes]
  set_indexes = set(function_word_indexes)

  # extract each word after punctuation if it is a punction word

  for i in punc_indexes:
    gramrange = range(i+1, i+1+gram_len)
    if i + gram_len + 1 >= len(words): continue

    if any([j in punc_indexes for j in gramrange]): continue 
    # transition words should not be punctuations

    if set_indexes.issuperset(gramrange):
      # All words are function words
      gram_arr = []
      for j in gramrange:
        if pos_tags[j] == 'CD':  # cardinal number
          gram_arr.append('-NUMBER-')
        else:
          gram_arr.append(words[j])

      gram = ' '.join(gram_arr)
      # gram = ' '.join(words[i : i + gram_len])

      if gram not in ngram:
        ngram[gram] = 0
      ngram[gram] += 1
      # Optimize: cross product...
    
  return [(sentence_id, document_id, gram, ngram[gram]) for gram in ngram]

