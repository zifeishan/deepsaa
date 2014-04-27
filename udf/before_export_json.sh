#! /usr/bin/env bash
psql -c "DROP TABLE IF EXISTS export_features CASCADE;" $DBNAME

psql -c """
  CREATE TABLE export_features (
    sentence_id bigint,
    publication_id bigint,
    features text)
DISTRIBUTED BY (publication_id);
""" $DBNAME