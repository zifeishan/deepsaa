Dataset
====

## toy_corpus:

- All single-author CS publications whose author has at least 10 one-authored publications
  - 2119 papers
  - 323 authors

## medium_corpus:

- All CS publications where at least 1 author has at least 100 publications
  - 14134 papers
  - 98 authors has 100+ papers
  - 39135 authors in total, but we only care about predicting 98 top authors.

  - SQL:
    - create view top_cs_authors as select c.* from stats_author_publication_count as c, meta_cs_authors cs where c.author_id = cs.author_id and publication_count >= 100 order by publication_count desc;
    - select distinct a.publication_id as id into medium_corpus from meta_publication_authors a, top_cs_authors top where a.author_id = top.author_id;
    - select * into authors from top_cs_authors ;

### Detailed stats

75795 sentences
98 authors

Positive examples: 5837
Negative examples: 7344912
Uncertain examples: 77161

    deepsaa=# select is_true, count(*) as c 
     from sentence_author group by is_true;
     is_true |    c
    ---------+---------
     f       | 7344912
             |   77161
     t       |    5837

<!-- 

- All CS papers where all authors has at least 5 papers
  - select count(distinct publication_id) from meta_publication_authors pa, meta_cs_publications cs where pa.publication_id = cs.id and author_id in (select author_id from public.stats_author_publication_count where publication_count < 5); 
Needs recursion
-->


## Toy (fake) corpus

deepsaa=# select distinct author_name, id from sentences, meta_authors where author_name = name;
     author_name     |   id
---------------------+--------
 Adamatzky, Andrew   | 188047
 Burton, Benjamin A. | 415109
 Walsh, Toby         | 408641


 ## Toy 2

 18 authors, 20 papers. Each paper is written by 3 authors, distributed randomly.

Available at /dfs/madmax/0/zifei/deepsaa/toy_corpus_2/

      author_name       |   id
-------------------------+--------
Ambainis, Andris        | 135090
Burghardt, Jochen       | 341371
Diaby, Moustapha        | 264988
Franceschet, Massimo    | 282301
Georgatos, Konstantinos | 438629
Gunther, Neil J.        | 266551
Hayashi, Masahito       | 278118
Krotov, Denis           | 222934
Kuhn, Tobias            | 330617
Li, Ping                |  61756
O'Rourke, Joseph        |  95313
Paulson, Lawrence C.    | 154807
Petersen, Ian R.        | 444770
Stojnic, Mihailo        | 199545
Tadaki, Kohtaro         | 240005
Turney, Peter D.        | 469663
Veldhuizen, Todd L.     | 145167
Zimand, Marius          | 102511


## Toy 3


/dfs/madmax/0/zifei/deepsaa/toy_corpus_3/

114 papers, 
4902 paragraphs,
43832 sentences,
32 authors.
