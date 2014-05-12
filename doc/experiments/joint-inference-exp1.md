Exp 1
====

/lfs/madmax/0/zifei/deepdive/out/2014-05-12T024205/

f_pub_sent_author
f_same_para_same_author
fs_sent_stats
fs_char_1gram
fs_char_2gram
fs_word_1gram
fs_word_3gram
fs_pos_1gram
fs_pos_2gram
fs_dep_1gram


deepsaa=# select count(*) from f_pub_sent_author_query_user ;
  count
----------
 44883968
(1 row)


deepsaa=# select count(*) from dd_graph_weights;
  count
----------
 10370210
(1 row)


large tables
 schemaname |                relname                 |  reltuples
------------+----------------------------------------+-------------
 public     | dd_graph_weights                       | 1.03823e+07
 public     | dd_inference_result_weights            | 1.03788e+07
 public     | f_char_2gram                           | 3.69814e+06
 public     | meta_publication_authors               | 3.27955e+06
 public     | meta_publication_subjects              | 1.56709e+06
 public     | sentence_author                        | 1.40707e+06
 public     | f_char_1gram                           | 1.14654e+06
 public     | f_word_3gram                           |  1.0864e+06
 gp_toolkit | __gp_log_segment_ext                   |       1e+06
 gp_toolkit | __gp_log_master_ext                    |       1e+06
 gp_toolkit | gp_disk_free                           |       1e+06
 gp_toolkit | __gp_localid                           |       1e+06
 gp_toolkit | __gp_masterid                          |       1e+06
 public     | f_word_1gram                           |      959407
 public     | meta_publications                      |      932655
 public     | f_pos_2gram                            |      877415
 public     | meta_authors                           |      560670
 public     | stats_author_publication_count         |      555962
 public     | dd_graph_factors                       |      527681
 public     | dd_graph_edges                         |      527020


 TODO: add constraint: one paper have at most 3 authors...

 

# Most useful weights:


## POS

    id    | initial_value | is_fixed |                      description                       |      weight
----------+---------------+----------+--------------------------------------------------------+------------------
  1882785 |             0 | f        | f_same_para_same_author-                               |  67.941804012633
        0 |            10 | t        | f_pub_sent_author-                                     |  9.9671939423702
  1426579 |             0 | f        | fs_word_1gram-61756--                                  |  6.4315775398589
  1753909 |             0 | f        | fs_word_1gram-61756-between                            | 5.57402809243992
  1845540 |             0 | f        | fs_pos_2gram-61756-DT NN                               | 5.51280532194272
  1841312 |             0 | f        | fs_pos_2gram-61756-JJ NN                               | 5.51280532194272
  1473373 |             0 | f        | fs_word_1gram-61756-,                                  | 5.51280532194272
  1841225 |             0 | f        | fs_pos_2gram-61756-DT JJ                               | 5.51280532194272
  1415532 |             0 | f        | fs_word_1gram-61756-small                              |  5.1455500645079
  1324577 |             0 | f        | fs_word_1gram-61756-of                                 | 5.08381834645198
  1603408 |             0 | f        | fs_word_1gram-61756-the                                | 5.08381834645198
 10370197 |             0 | f        | fs_sent_stats-61756-num_words                          | 5.02268003595278
  1884163 |             0 | f        | fs_char_1gram-61756-                                   | 5.02268003595278
  1266269 |             0 | f        | fs_word_1gram-93660-approaches                         | 4.90159598191185
  1880989 |             0 | f        | fs_pos_2gram-61756-IN DT                               | 4.65517141452574
  1658686 |             0 | f        | fs_word_1gram-93660-of                                 |  4.4114706959219
  1680033 |             0 | f        | fs_word_1gram-61756-and                                | 4.28774725309672
  1617032 |             0 | f        | fs_word_1gram-61756-that                               | 4.28774725309672
  1651557 |             0 | f        | fs_word_1gram-61756-a                                  | 4.28774725309672
  1882334 |             0 | f        | fs_pos_2gram-61756-IN JJ                               |   4.226268899033
  1875376 |             0 | f        | fs_pos_2gram-61756-NNS -LRB-                           |   4.226268899033
    32578 |             0 | f        | fs_char_2gram-61756-s                                  |   4.226268899033
     5109 |             0 | f        | fs_pos_1gram-61756-WDT1                                |   4.226268899033
  1850726 |             0 | f        | fs_pos_2gram-61756-JJ NNS                              |   4.226268899033
  1884664 |             0 | f        | fs_char_1gram-61756-s                                  |   4.226268899033
    28467 |             0 | f        | fs_char_2gram-61756-ti                                 |   4.226268899033
     3567 |             0 | f        | fs_pos_1gram-93660-NNS2                                | 3.92129639250161
  1846037 |             0 | f        | fs_pos_2gram-61756-CC DT                               | 3.85884473760396
  1257995 |             0 | f        | fs_word_1gram-61756-connections                        | 3.85884473760396
  1288001 |             0 | f        | fs_word_1gram-61756-subgraph                           | 3.85884473760396
    14997 |             0 | f        | fs_pos_1gram-61756-:1                                  | 3.85884473760396
     2610 |             0 | f        | fs_pos_1gram-61756-JJ6                                 | 3.85884473760396
  1706394 |             0 | f        | fs_word_1gram-61756-rich-club                          | 3.85884473760396
     6199 |             0 | f        | fs_pos_1gram-61756--LRB-1                              | 3.85884473760396
  1698021 |             0 | f        | fs_word_1gram-61756-In                                 | 3.85884473760396
    12360 |             0 | f        | fs_pos_1gram-61756-FW1                                 | 3.85884473760396
  1877954 |             0 | f        | fs_pos_2gram-61756-: JJ                                | 3.79779087110096
  1296844 |             0 | f        | fs_word_1gram-61756--LRB-                              | 3.79762196710677
  1884254 |             0 | f        | fs_char_1gram-61756-e                                  | 3.79762196710677


## NEG

   id    | initial_value | is_fixed |           description           |      weight
----------+---------------+----------+---------------------------------+-------------------
  1740493 |             0 | f        | fs_word_1gram-61756-1           | -3.12416531874008
    25565 |             0 | f        | fs_char_2gram-61756- 3          |  -2.2665314113231
  1881220 |             0 | f        | fs_pos_2gram-61756--RRB- NN     |  -2.2665314113231
    33228 |             0 | f        | fs_char_2gram-61756- 1          |  -2.2665314113231
  1324409 |             0 | f        | fs_word_1gram-61756-:           |  -2.2665314113231
  1783084 |             0 | f        | fs_word_1gram-61756-2           |  -2.2665314113231
  1843302 |             0 | f        | fs_pos_2gram-167940--RRB- NN    | -1.89923548321104
  1681389 |             0 | f        | fs_word_1gram-167940-1          | -1.89918646578069
  1460432 |             0 | f        | fs_word_1gram-394820-1          |  -1.8379698224623
    25870 |             0 | f        | fs_char_2gram-61756-3           | -1.83788447939687
  1494604 |             0 | f        | fs_word_1gram-61756--RSB-       | -1.77640612533316
  1341594 |             0 | f        | fs_word_1gram-61756-14          | -1.77640612533316
  1558497 |             0 | f        | fs_word_1gram-61756-to          | -1.77640612533316
  1884490 |             0 | f        | fs_char_1gram-61756-B           | -1.77640612533316
  1487579 |             0 | f        | fs_word_1gram-61756-for         | -1.77640612533316
  1857758 |             0 | f        | fs_pos_2gram-61756--RRB- JJ     | -1.77640612533316
  1519324 |             0 | f        | fs_word_1gram-61756-18          | -1.77640612533316
  1421109 |             0 | f        | fs_word_1gram-61756-10          | -1.77640612533316
    29636 |             0 | f        | fs_char_2gram-61756-ar          | -1.77640612533316


# Exp1:

  id   | initial_value | is_fixed |            description             |      weight
--------+---------------+----------+------------------------------------+------------------
 632835 |             0 | f        | f_same_para_same_author-           | 79.6065348697754
 224661 |             0 | f        | fs_word_1gram-40360-,              | 42.4961686778766
 340081 |             0 | f        | fs_word_1gram-40360-of             | 35.6994481335997
 149303 |             0 | f        | fs_word_1gram-40360-the            | 35.6910359370118
  58754 |             0 | f        | fs_word_1gram-40360-to             | 32.2974490459865
 556352 |             0 | f        | fs_word_1gram-40360-a              | 32.2893454028533
 171762 |             0 | f        | fs_word_1gram-394820-of            | 29.0917145839662
 605774 |             0 | f        | fs_word_1gram-394820-the           | 28.2416701305487
 581905 |             0 | f        | fs_word_1gram-394820-that          | 28.2395950714692
  17395 |             0 | f        | fs_word_1gram-394820-to            | 27.3842094488476
 396496 |             0 | f        | fs_word_1gram-61756-the            | 27.1891350204709
 357555 |             0 | f        | fs_word_1gram-93660-the            |  26.283378774688
 188671 |             0 | f        | fs_word_1gram-40360-in             | 25.5013336025227
 218927 |             0 | f        | fs_word_1gram-61756--              | 25.5013336025227
 265884 |             0 | f        | fs_word_1gram-61756-,              | 25.4955771711204
 294956 |             0 | f        | fs_word_1gram-394820-a             |  24.841492316879
   5641 |             0 | f        | fs_word_1gram-394820-,             | 23.8408706461072
 116904 |             0 | f        | fs_word_1gram-61756-of             | 23.7705496053613
 443534 |             0 | f        | fs_word_1gram-93660-1              | 23.0448689419112

    id   | initial_value | is_fixed |              description              |       weight
--------+---------------+----------+---------------------------------------+---------------------
      1 |             0 | f        | f_pub_author_constraint-              |   -13519.9729071904
 632834 |           -10 | t        | f_sent_author_constraint-             |   -9.99827429126678
 569804 |             0 | f        | fs_word_1gram-93660-32                |  -0.143434702351631
 246346 |             0 | f        | fs_word_1gram-93660-∈                 |  -0.143434702351631
 246492 |             0 | f        | fs_word_1gram-93660-then              |  -0.143434702351631
 342511 |             0 | f        | fs_word_1gram-93660-16                |  -0.143434702351631
 195389 |             0 | f        | fs_word_1gram-93660-max               |  -0.143434702351631
 264888 |             0 | f        | fs_word_1gram-93660-15                |  -0.143434702351631
 405236 |             0 | f        | fs_word_1gram-93660-24                |  -0.143434702351631
 589345 |             0 | f        | fs_word_1gram-93660-27                |  -0.143434702351631
 260521 |             0 | f        | fs_word_1gram-93660-=                 |  -0.143434702351631
 496612 |             0 | f        | fs_word_1gram-93660--RCB-             |  -0.143434702351631
 383258 |             0 | f        | fs_word_1gram-93660->                 |  -0.143434702351631
 361866 |             0 | f        | fs_word_1gram-93660-25                |  -0.143434702351631
 436378 |             0 | f        | fs_word_1gram-93660-30                |  -0.143434702351631
 327248 |             0 | f        | fs_word_1gram-93660-31                |  -0.143434702351631
  89325 |             0 | f        | fs_word_1gram-93660-17                |  -0.143434702351631
 102470 |             0 | f        | fs_word_1gram-93660-23                |  -0.143434702351631
 238027 |             0 | f        | fs_word_1gram-93660--LCB-             |  -0.143434702351631