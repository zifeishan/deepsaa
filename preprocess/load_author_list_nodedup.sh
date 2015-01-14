# export APP_HOME=`cd $(dirname $0)../; pwd`
# . env.sh

# psql -c """
#     DROP TABLE IF EXISTS supervised_author_names CASCADE;
#     CREATE TABLE supervised_author_names(id bigint, name text);
#     COPY  supervised_author_names(name)
#     FROM  STDIN;
# """ $DBNAME <$APP_HOME/data/stanford-faculty-list.txt

if [ $# != 1 ]; then
  echo "Usage: $0 filelist.tsv"
  echo "e.g.: $0 ../data/social-network-author-list.txt"
  exit
fi

export APP_HOME=`cd $(dirname $0)../; pwd`
. env.sh

export PGDATABASE=$DBNAME

# No deduplication
cut -f 1 $1 | psql -c "
    DROP TABLE IF EXISTS supervised_author_names CASCADE;
    CREATE TABLE supervised_author_names(name text, name_dedup text);
    COPY  supervised_author_names(name)
    FROM  STDIN;
" $DBNAME

# Extract all authors
psql -c "

UPDATE supervised_author_names 
SET name_dedup = name;

DROP TABLE IF EXISTS authors_supervised;

CREATE TABLE authors_supervised AS 
SELECT min(id) as author_id, 
      name_dedup as name, 
      array_agg(id order by id) as all_ids, 
      array_agg(name order by id) as all_names
FROM  meta_authors natural join supervised_author_names
GROUP BY name_dedup;

DROP TABLE IF EXISTS author_id_dedup;

CREATE TABLE author_id_dedup AS 
SELECT id as id_before_dedup, author_id as id_after_dedup
FROM (meta_authors natural join supervised_author_names) as t,
      authors_supervised
WHERE t.name_dedup = authors_supervised.name;
"

# Extract all papers from these authors
psql -c "
DROP TABLE IF EXISTS corpus;

CREATE TABLE corpus AS
SELECT distinct publication_id as id
FROM  meta_publication_authors pa,
      author_id_dedup a
WHERE author_id = id_before_dedup;"

# Extract all papers from these authors_supervised
psql -c "
DROP TABLE IF EXISTS publication_authors;

CREATE TABLE publication_authors AS
SELECT c.id as publication_id, author_id
FROM  meta_publication_authors pa,
      corpus c
WHERE pa.publication_id = c.id;
"
# Then dodeduplication
psql -c "
UPDATE publication_authors AS pa
SET author_id = id_after_dedup
FROM author_id_dedup
WHERE id_before_dedup = author_id;
"

# Finally got all author set including their coauthors
psql -c "
DROP TABLE IF EXISTS authors;

CREATE TABLE authors AS 
SELECT DISTINCT author_id, name
FROM publication_authors, meta_authors
WHERE id = author_id;
"


# Here's what we do to REDUCE AUTHORS:
psql -c "
DROP VIEW IF EXISTS author_numpapers;
        
CREATE VIEW author_numpapers AS
SELECT author_id, count(*) FROM publication_authors
GROUP BY author_id;

DELETE FROM authors AS a
WHERE author_id IN 
(SELECT author_id FROM author_numpapers 
  WHERE a.author_id = author_numpapers.author_id
  AND   count < 3);

"

# psql -c "
# SELECT arxiv_id FROM meta_publications p NATURAL JOIN corpus;
# "

# # Populate the table by getting all papers inside this network
# psql -c "
# CREATE TABLE exclude_publications AS 
# SELECT distinct publication_id 
# FROM meta_publication_authors pa
# WHERE NOT EXISTS (    -- there exists an author (row) not in author set
#   SELECT * FROM authors a
#   WHERE pa.author_id = a.author_id
#   )
# "

# SELECT * FROM meta_publications p
# WHERE NOT EXISTS (
#   SELECT * FROM exclude_publications ep
#   WHERE ep.publication_id = p.id
#   )
# AND NOT EXIST .... TODO