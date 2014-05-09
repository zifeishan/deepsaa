1816 sentences
528 authors
253 papers



P/N Examples:

deepsaa=# select is_true, count(*) from publication_author group by is_true;
 is_true | count
---------+--------
         |    902
 f       | 132665
 t       |     17


 deepsaa=# select is_true, count(*) from sentence_author group by is_true;
 is_true | count
---------+--------
         |   6875
 f       | 951883
 t       |     90


 deepsaa=# select fname, median(fval) as median from f_doc_stats group by fname;
      fname      |    median
-----------------+---------------
 num_chars_title |            58
 num_chars       |          1111
 avg_word_length | 6.22772277228
 num_words       |           155
(4 rows)

deepsaa=# select count(*) from dd_graph_variables;
 count
--------
 133584
(1 row)

deepsaa=# select count(*) from dd_graph_factors;
  count
----------
 17891280
(1 row)

deepsaa=# select count(*) from dd_graph_weights;
 count
-------
   362
(1 row)