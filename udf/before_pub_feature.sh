#! /usr/bin/env bash
psql -c "DROP TABLE IF EXISTS f_$1 CASCADE;" $DBNAME

psql -c """
  CREATE TABLE f_$1 (
    publication_id bigint,
    fname_prefix text,
    fname text,
    fval bigint)
  DISTRIBUTED BY (publication_id);
""" $DBNAME