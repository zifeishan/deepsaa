import ddext

def init():
  ddext.import_lib('nltk')

  ddext.input('document_id', 'bigint')
  ddext.input('pid', 'bigint')
  ddext.input('paragraph_id', 'bigint')
  ddext.input('paragraph', 'text')

  ddext.returns('document_id', 'bigint')
  ddext.returns('pid', 'bigint')
  ddext.returns('paragraph_id', 'bigint')
  ddext.returns('sentence', 'text')
  ddext.returns('words', 'text[]')
  # ddext.returns('lemma', 'text[]')
  # ddext.returns('pos_tags', 'text[]')
  # ddext.returns('dependencies', 'text[]')
  # ddext.returns('ner_tags', 'text[]')
  ddext.returns('sentence_offset', 'bigint')
  # ddext.returns('sentence_id', 'bigint')

def run(paragraph_id, paragraph):

  if 'counter' not in SD:
    SD['counter'] = 0
  SD['counter'] += 1
  if SD['counter'] % 10000 == 0:
    plpy.info('I have processed %d paragraphs.' % SD['counter'])

  nltk.data.path = ['/dfs/rambo/0/zifei/nltk_data']
  sentences = nltk.sent_tokenize(paragraph)

  # plpy.info('Processing %d' % paragraph_id)
  for i in range(len(sentences)):
    sent = sentences[i]
    words = nltk.word_tokenize(sent)
    yield (
      document_id,   # document_id
      pid,           # pid
      paragraph_id,  # paragraph_id
      sent,          # sentence
      words,         # words
                     # lemma
      # [p[1] for p in nltk.pos_tag(words)],  # pos_tags
                     # dependencies
                     # ner_tags
      i,             # sentence_offset
                     # sentence_id
      )