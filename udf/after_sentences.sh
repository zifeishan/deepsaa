#! /usr/bin/env bash

${DEEPDIVE_HOME}/util/fill_sequence.sh paragraph_sentences sentence_id

psql -c """
  ALTER TABLE     paragraph_sentences
  RENAME COLUMN   document_id
  TO              paragraph_id;

  DROP TABLE IF EXISTS sentences;

  CREATE TABLE sentences AS
  SELECT  p.document_id, p.pid, ps.*
  FROM    paragraph_sentences ps, 
          paragraphs p
  WHERE   ps.paragraph_id = p.paragraph_id
  DISTRIBUTED BY (document_id);

""" $DBNAME

