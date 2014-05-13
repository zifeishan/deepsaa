#! /usr/bin/env bash
psql -c "DROP TABLE IF EXISTS paragraphs CASCADE;" $DBNAME

psql -c """
    CREATE TABLE paragraphs (
      document_id   BIGINT,
      pid           BIGINT, -- Relative paragraph id
      paragraph     TEXT, 
      author_name   TEXT, 
      arxiv_id      TEXT,
      paragraph_id  BIGINT -- Unique paragraph identifier
    ) 
    DISTRIBUTED BY (document_id);
""" $DBNAME