#! /usr/bin/env bash
psql -c "DROP TABLE IF EXISTS export_features_$1 CASCADE;" $DBNAME

psql -c """
  CREATE TABLE export_features_$1 (
    sentence_id bigint,
    publication_id bigint,
    features text)
DISTRIBUTED BY (publication_id);
""" $DBNAME