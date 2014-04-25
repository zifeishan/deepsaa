#! /usr/bin/env bash
psql -c "DROP TABLE IF EXISTS sentences CASCADE;" $DBNAME

psql -c """
  CREATE TABLE sentences (
    id bigserial primary key,
    document_id bigint,
    sentence text, 
    words text[],
    lemma text[],
    pos_tags text[],
    dependencies text[],
    ner_tags text[]);
  DISTRIBUTED BY (document_id);
""" $DBNAME