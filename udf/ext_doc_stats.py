#! /usr/bin/env python

import ddext

# select id, datestamp, title, description from corpus natural join meta_publications

def init():
  ddext.input('publication_id', 'bigint')
  ddext.input('datestamp', 'text')
  ddext.input('title', 'text')
  # ddext.input('fulltext', 'text')
  ddext.input('sentences', 'text[]')
  
  ddext.returns('publication_id', 'bigint')
  ddext.returns('fname', 'text')
  ddext.returns('fval', 'real')

def run(publication_id, datestamp, title, fulltext):
  fname = []
  fval = []
  # TODO not working perfectly...
  # words = fulltext.split(' ');

  fulltext = ''
  for s in sentences: fulltext += s
  words = fulltext.split(' ');
  fname.append('num_chars')
  fval.append(sum([len(w) for w in words]))
  fname.append('num_words')
  fval.append(len(words))
  if title:
    fname.append('num_chars_title')
    fval.append(len(title))

  fname.append('avg_word_length')
  avg_wl = sum([len(w) for w in words]) / float(len(words))
  fval.append(avg_wl)

  for i in range(len(fname)):
    yield publication_id, fname[i], fval[i]
