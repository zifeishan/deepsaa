IMPORT_DIR=/dfs/madmax/0/dbritz/arxiv/out/

export APP_HOME=`cd $(dirname $0)/../; pwd`
export DEEPDIVE_HOME=`cd $(dirname $0)/../../../; pwd`

. $APP_HOME/env.sh

psql -c """

    DROP TABLE IF EXISTS err;
    CREATE TABLE err (cmdtime timestamp with time zone, relname text, filename text, linenum integer, bytenum integer, errmsg text, rawdata text, rawbytes bytea);

    DROP TABLE IF EXISTS paragraphs CASCADE;

    CREATE TABLE paragraphs (
      document_id  BIGINT,
      pid    BIGINT,          -- Relative paragraph id
      paragraph        TEXT, 
      author_name     TEXT, 
      arxiv_id        TEXT,
      paragraph_id     BIGINT -- Unique paragraph identifier
    ) 
DISTRIBUTED BY (document_id);

""" $DBNAME

cat $IMPORT_DIR/*.csv | psql -c """
    COPY  paragraphs(document_id, pid, paragraph, author_name, arxiv_id)
    
    FROM  STDIN CSV
    LOG ERRORS INTO err SEGMENT REJECT LIMIT 1000 ROWS;
""" $DBNAME

bash $DEEPDIVE_HOME/util/fill_sequence.sh paragraphs paragraph_id

psql -c """
DROP TABLE IF EXISTS publication_authors CASCADE;

CREATE TABLE publication_authors AS 
SELECT distinct document_id AS publication_id, 
      meta_authors.id AS author_id 
FROM paragraphs, meta_authors 
WHERE author_name = name
DISTRIBUTED BY (publication_id);

DROP TABLE IF EXISTS authors CASCADE;

CREATE TABLE authors AS 
SELECT distinct(author_id) 
FROM publication_authors;


DROP TABLE IF EXISTS corpus;
SELECT distinct document_id AS id INTO corpus 
FROM paragraphs;



""" $DBNAME


# deepsaa=# select distinct author_name, id from paragraphs, meta_authors where author_name = name;
#      author_name     |   id
# ---------------------+--------
#  Adamatzky, Andrew   | 188047
#  Burton, Benjamin A. | 415109
#  Walsh, Toby         | 408641