#! /usr/bin/env bash
psql -c """
DROP TABLE IF EXISTS authors CASCADE;

CREATE TABLE authors AS 
SELECT distinct meta_authors.id as author_id, name
FROM meta_authors
WHERE EXISTS (
  SELECT * 
  FROM author_names
  WHERE author_names.name = meta_authors.name
  )
DISTRIBUTED BY (author_id);

""" $DBNAME

psql -c "

CREATE VIEW author_publication_count AS 
 SELECT publication_authors.author_id, count(*) AS count
   FROM publication_authors
  GROUP BY publication_authors.author_id;


DELETE FROM authors WHERE NOT EXISTS
  (
    SELECT * FROM author_publication_count 
    WHERE count >= 3 
    AND author_publication_count.author_id = authors.author_id
    );
" $DBNAME

# ##### -- 5639 authors, 21489 papers

# psql -c "

# CREATE VIEW author_publication_count AS 
#  SELECT publication_authors.author_id, count(*) AS count
#    FROM publication_authors
#   GROUP BY publication_authors.author_id;


# DELETE FROM authors WHERE NOT EXISTS
#   (
#     SELECT * FROM author_publication_count 
#     WHERE count >= 3 
#     AND author_publication_count.author_id = authors.author_id
#     );


# DELETE FROM publication_authors as pa1 WHERE publication_id IN
# (
#     SELECT publication_id FROM publication_authors pa2
#     WHERE NOT EXISTS (
#       SELECT * FROM authors
#       WHERE authors.author_id = pa2.author_id
#       )
#   );

# DELETE FROM authors WHERE NOT EXISTS
#   (
#     SELECT * FROM publication_authors
#     WHERE publication_authors.author_id = authors.author_id
#     );

# "

# This would reduce: (not "corpus")
# -- 4691  authors
# -- 12736 pubs
# Removed one layer outside the network...
