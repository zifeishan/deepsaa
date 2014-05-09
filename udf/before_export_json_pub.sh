#! /usr/bin/env bash
psql -c "DROP TABLE IF EXISTS export_features_pub CASCADE;" $DBNAME

psql -c """
  CREATE TABLE export_features_pub (
    publication_id bigint,
    features text)
DISTRIBUTED BY (publication_id);
""" $DBNAME