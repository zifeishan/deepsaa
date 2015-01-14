#! /usr/bin/env bash
psql -c "DROP TABLE IF EXISTS f_doc_stats CASCADE;" $DBNAME

# TODO later distributed by docid, manually fill id
psql -c """
  CREATE TABLE f_doc_stats (
    publication_id bigint,
    fname text,
    fval real)
DISTRIBUTED BY (publication_id);
""" $DBNAME