#! /usr/bin/env bash
psql -c "DROP TABLE IF EXISTS f_sentence_stats CASCADE;" $DBNAME

# TODO later distributed by docid, manually fill id
psql -c """
  CREATE TABLE f_sentence_stats (
    sentence_id bigint,
    publication_id bigint,
    fname text,
    fval bigint)
  DISTRIBUTED BY (publication_id);
""" $DBNAME