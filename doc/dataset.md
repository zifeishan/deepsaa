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

## Toy 3b

/dfs/madmax/0/zifei/deepsaa/toy_corpus_3/

126 papers, 
4906 paragraphs,
26885 sentences,
36 authors.

(how many real papers generated?) 36*5?

## Toy 5

Deprecated: some authors have few publications.

/dfs/madmax/0/zifei/deepsaa/toy_corpus_5/

614 papers,
149 authors,
~20k paragraphs

POS tagged by NLTK rather than Stanford.

# Toy 6

108 authors
360 publications
14027 paragraphs
78577 sentences
1433083 features


new-features $ cut -f 1 deepsaa-feature-count.tsv | sort | uniq -c

         91 c1
       4088 c2
      35615 c3
       1937 funcword1
      13193 funcword2
      25803 funcword3
          1 nondict
         45 pos1
       1583 pos2
      14595 punc
          4 sen
      27039 sshape
        314 start1
        298 stopword1
        625 trans1
      65276 w1
    1242576 w3


# Real world dataset (7)

169 authors (8 supervised, and their coauthors)

150 papers
  - There are 165 papers where at least an author in 8 giant ones
  - Among these papers 15 cannot be found in Denny's folder.
  - in arXiv, there are 8 more papers in this network that are not included, i.e. only authored by coauthors but not 8 supervised guys authors.


91036 paragraphs (treat each line as a paragraph)
183437 sentences (tokenized by NLTK)
885024 features

supervised guys (id is after deduplication):

    deepsaa_real=# select * from authors_supervised ;
     author_id |        name        |            all_ids            |                                        all_names
    -----------+--------------------+-------------------------------+-----------------------------------------------------------------------------------------
        487850 | Karrer, Brian      | {487850}                      | {"Karrer, Brian"}
        156311 | Kleinberg, Jon     | {156311,503688}               | {"Kleinberg, Jon","Kleinberg, Jon M."}
         74270 | Pentland, Alex     | {74270,335285}                | {Pentland,"Pentland, Alex"}
        343701 | Adamic, Lada       | {343701,395406,490464}        | {"Adamic, Lada","Adamic, Lada A.","Adamic, L. A."}
         69509 | Backstrom, Lars    | {69509,286810}                | {"Backstrom, L.","Backstrom, Lars"}
        215066 | Huberman, Bernardo | {215066,278592,302198,455807} | {"Huberman, Bernardo A","Huberman, Bernardo","Huberman, B. A.","Huberman, Bernardo A."}
         94129 | Ugander, Johan     | {94129}                       | {"Ugander, Johan"}
        348799 | Leskovec, Jure     | {348799,469021}               | {"Leskovec, J.","Leskovec, Jure"}
    (8 rows)


new-features $ cut -f 1 deepsaa-feature-count.tsv | sort | uniq -c

         96 c1
       4972 c2
      41041 c3
       4049 funcword1
      11406 funcword2
      15183 funcword3
          1 nondict
         44 pos1
       1173 pos2
      12163 punc
          4 sen
      17783 sshape
        392 start1
        294 stopword1
        230 trans1
      52469 w1
     723724 w3


# Real world dataset 8.1 (2 hop, not used)

588124 paragraphs

169? authors (8 supervised, and their coauthors)

1024? papers
  - There are 165 papers where at least an author in 8 giant ones
  - Among these papers 15 cannot be found in Denny's folder.
  - in arXiv, there are 8 more papers in this network that are not included, i.e. only authored by coauthors but not 8 supervised guys authors.


588124 paragraphs (treat each line as a paragraph)
? sentences (tokenized by NLTK)
? features

# Real world dataset 8 (filtered by sentence length >= 30)

100 authors (8 supervised, and their coauthors)

234 papers

206300 sentences (tokenized by NLTK)
? features
