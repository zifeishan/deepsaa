IMPORT_PATH=/dfs/madmax/0/dbritz/arxiv/out.tsv

export APP_HOME=`cd $(dirname $0)/../; pwd`
export DEEPDIVE_HOME=`cd $(dirname $0)/../../../; pwd`

# . $APP_HOME/env.sh

psql -c "

    DROP TABLE IF EXISTS err;
    CREATE TABLE err (cmdtime timestamp with time zone, relname text, filename text, linenum integer, bytenum integer, errmsg text, rawdata text, rawbytes bytea);

    CREATE TABLE document_paths (
      arxiv_id    TEXT,
      path        TEXT,
      author_names TEXT
    ) 
    DISTRIBUTED BY (arxiv_id);

" $DBNAME

cat $IMPORT_PATH | psql -c "
    COPY  document_paths
    FROM  STDIN
    LOG ERRORS INTO err SEGMENT REJECT LIMIT 1000 ROWS;
" $DBNAME

# bash $DEEPDIVE_HOME/util/fill_sequence.sh paragraphs paragraph_id

psql -c "

DROP TABLE IF EXISTS corpus;

SELECT p.id
INTO  corpus
FROM  document_paths dp,
      meta_publications p
WHERE dp.arxiv_id = p.arxiv_id;

DROP TABLE IF EXISTS publication_authors CASCADE;

CREATE TABLE publication_authors AS 
SELECT  p.*
FROM    meta_publication_authors p, corpus t 
WHERE   t.id = p.publication_id
DISTRIBUTED BY (publication_id);

" $DBNAME

# deepsaa=# select distinct author_name, id from paragraphs, meta_authors where author_name = name;
