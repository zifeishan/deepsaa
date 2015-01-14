DROP TABLE IF EXISTS output_sentence_author_cand CASCADE;

DROP VIEW IF EXISTS output_sentence_author_maxp CASCADE;

CREATE TABLE output_sentence_author_cand AS
SELECT *, random() as rand 
FROM sentence_author_is_true_inference 
DISTRIBUTED BY (publication_id);


CREATE VIEW output_sentence_author_maxp AS
SELECT sentence_id, 
       max(expectation) as maxp
FROM output_sentence_author_cand 
GROUP BY publication_id, sentence_id;

DROP TABLE IF EXISTS output_sentence_author CASCADE;
CREATE TABLE output_sentence_author AS 
    select cand.*
    from output_sentence_author_cand cand,
         output_sentence_author_maxp maxp
    where cand.sentence_id = maxp.sentence_id
    and   cand.expectation = maxp.maxp
  DISTRIBUTED BY (publication_id);

-- break ties
DELETE FROM output_sentence_author as w1
WHERE EXISTS
(
  SELECT *
  FROM  output_sentence_author w2
  WHERE w1.publication_id = w2.publication_id
  AND   w1.sentence_id = w2.sentence_id
  AND   w1.rand < w2.rand 
  AND   w1.expectation = w2.expectation
);


----------------------

DROP TABLE IF EXISTS output_publication_author_cand CASCADE;

CREATE TABLE output_publication_author_cand AS
SELECT *, random() as rand 
FROM publication_author_is_true_inference 
DISTRIBUTED BY (publication_id);

DROP VIEW IF EXISTS output_publication_author_maxp CASCADE;

CREATE VIEW output_publication_author_maxp AS
SELECT publication_id, 
       max(expectation) as maxp
FROM output_publication_author_cand 
GROUP BY publication_id, publication_id;

DROP TABLE IF EXISTS output_publication_author CASCADE;
CREATE TABLE output_publication_author AS 
    select cand.*
    from output_publication_author_cand cand,
         output_publication_author_maxp maxp
    where cand.publication_id = maxp.publication_id
    and   cand.expectation = maxp.maxp
  DISTRIBUTED BY (publication_id);

-- break ties
DELETE FROM output_publication_author as w1
WHERE EXISTS
(
  SELECT *
  FROM  output_publication_author w2
  WHERE w1.publication_id = w2.publication_id
  AND   w1.rand < w2.rand 
  AND   w1.expectation = w2.expectation
);

---------------------

-- Show statistics
drop view if exists tmp_sent;

create view tmp_sent as 
select is_true, count(*) as count_sentence_author 
from output_sentence_author group by is_true;

select (select count_sentence_author from tmp_sent where is_true = true) / (select sum(count_sentence_author) from tmp_sent) as ACC_sentence;

-- Show statistics
drop view if exists tmp_pub;

create view tmp_pub as
select is_true, count(*) as count_pub_author
from output_publication_author group by is_true;

select (select count_pub_author from tmp_pub where is_true = true) / (select sum(count_pub_author) from tmp_pub) as ACC_publication;
