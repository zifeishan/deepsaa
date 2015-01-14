#! /usr/bin/env bash
psql -c "DROP TABLE IF EXISTS export_features_pub_$1 CASCADE;" $DBNAME
psql -c """
  CREATE TABLE export_features_pub_$1 (
    publication_id bigint,
    features text)
DISTRIBUTED BY (publication_id);
""" $DBNAME
