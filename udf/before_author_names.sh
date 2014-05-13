#! /usr/bin/env bash
psql -c "DROP TABLE IF EXISTS author_names CASCADE;" $DBNAME

psql -c """
  CREATE TABLE author_names(
    name text
    )
    DISTRIBUTED BY (name);
""" $DBNAME