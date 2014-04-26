#! /usr/bin/env python

import ddext

# select id, datestamp, title, description from corpus natural join meta_publications

def init():
  ddext.input('publication_id', 'bigint')
  ddext.input('datestamp', 'text')
  ddext.input('title', 'text')
  ddext.input('fulltext', 'text')
  
  ddext.returns('publication_id', 'bigint')
  ddext.returns('fname', 'text')
  ddext.returns('fval', 'float')

def run(publication_id, datestamp, title, fulltext):
  ids = [publication_id]
  fname = []
  fval = []
  # TODO not working perfectly...
  words = fulltext.split(' ');
  fname.append('num_chars')
  fval.append(len(fulltext))
  fname.append('num_words')
  fval.append(len(words))
  fname.append('num_chars_title')
  fval.append(len(title))

  fname.append('avg_word_length')
  avg_wl = sum([len(w) for w in words]) / float(len(words))
  fval.append(avg_wl)

  return (ids, fname, fval)
