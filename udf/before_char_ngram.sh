#! /usr/bin/env bash
psql -c "DROP TABLE IF EXISTS f_char_$1gram CASCADE;" $DBNAME

psql -c """
  CREATE TABLE f_char_$1gram (
    sentence_id bigint,
    ngram text);
""" $DBNAME