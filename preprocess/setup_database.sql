select author_id, count(publication_id) as publication_count 
into author_publication_count from meta_publication_authors group by author_id order by publication_count desc;

create view publication_author_count as select t.id as publication_id, count(author_id) as num_authors from toy_corpus t, meta_publication_authors where t.id = publication_id group by (t.id) order by id;

select t.id as publication_id, count(author_id) as num_authors from toy_corpus t, meta_publication_authors where t.id = publication_id group by (t.id) order by id;



-- FILTERING DATASET
select distinct author_id 
into authors
from toy_corpus t, meta_publication_authors a where id = publication_id order by author_id;


DROP TABLE IF EXISTS publication_authors CASCADE;
CREATE TABLE publication_authors AS 
SELECT p.*
FROM meta_publication_authors p, toy_corpus t 
WHERE t.id = p.publication_id
DISTRIBUTED BY (publication_id);


select count(*) 
from meta_cs_authors a, stats_author_publication_count ap 
where ap.author_id = a.author_id and publication_count > 10;

-- all authors:
select distinct author_id from medium_corpus c, meta_publication_authors pa where c.id=pa.publication_id;

 create view all_cs_authors AS
 SELECT c.author_id, c.publication_count
   FROM stats_author_publication_count c, meta_cs_authors cs
  WHERE c.author_id = cs.author_id
  ORDER BY c.publication_count DESC;
  
-- see publication count of a certain CS author:
select * from all_cs_authors cs, meta_authors a where author_id = id and name='Leskovec, Jure'