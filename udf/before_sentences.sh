#! /usr/bin/env bash
psql -c "DROP TABLE IF EXISTS sentences CASCADE;" $DBNAME

# TODO later distributed by docid, manually fill id
psql -c """
  CREATE TABLE sentences (
    document_id bigint,
    sentence_id bigint,
    sentence text, 
    words text[],
    lemma text[],
    pos_tags text[],
    dependencies text[],
    ner_tags text[])
  DISTRIBUTED BY (document_id)
  ;
""" $DBNAME