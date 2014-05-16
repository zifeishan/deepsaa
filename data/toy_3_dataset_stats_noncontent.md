deepsaa=# select count(distinct ngram) from f_funcword_2gram;
 count
-------
  8223
(1 row)

deepsaa=# select count(distinct ngram) from f_funcword_1gram;
 count
-------
  1532
(1 row)

deepsaa=# select count(distinct fname) from f_stopwords;
 count
-------
   275
(1 row)

deepsaa=# select count(*) from f_funcword_1gram;
 count
--------
 410203
(1 row)

deepsaa=# select count(*) from f_funcword_2gram;
 count
--------
 211763
(1 row)

deepsaa=# select ngram, count(*) as count from f_funcword_2gram group by ngram order by count desc limit 100;
    ngram    | count
-------------+-------
 of the      |  7393
 , and       |  4429
 in the      |  3966
 , the       |  3612
 , we        |  3344
 to the      |  2554
 -RRB- ,     |  2482
 that the    |  2284
 and the     |  1782
 for the     |  1769
 of a        |  1738
 -RSB- ,     |  1642
 on the      |  1484

 deepsaa=# select COUNT(distinct ngram) from f_char_3gram ;
 count
-------
 17663
(1 row)

