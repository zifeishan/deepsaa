#! /usr/bin/env bash
psql -c "DROP TABLE IF EXISTS paragraph_sentences CASCADE;" $DBNAME

# TODO later distributed by docid, manually fill id
psql -c """
  CREATE TABLE paragraph_sentences(
    document_id  bigint,
    sentence     text,
    words        text[],
    lemma        text[],
    pos_tags     text[],
    dependencies text[],
    ner_tags     text[],
    sentence_id  bigint  -- unique identifier for paragraph_sentences
    )
    DISTRIBUTED BY (document_id);
""" $DBNAME