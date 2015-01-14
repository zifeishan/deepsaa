Toy 3B
=========

exp 13

    /lfs/rambo/0/zifei/deepdive/out/2014-05-23T103413/

10:43:49 [sampler] INFO  # nvar               : 972396
10:43:49 [sampler] INFO  # nfac               : 184084704
10:43:49 [sampler] INFO  # nweight            : 821992
10:43:49 [sampler] INFO  # nedge              : 186179184

SELECT 133252
DELETE 126991
NOTICE:  table "output_publication_author_cand" does not exist, skipping
DROP TABLE
SELECT 1044
NOTICE:  view "output_publication_author_maxp" does not exist, skipping
DROP VIEW
CREATE VIEW
NOTICE:  table "output_publication_author" does not exist, skipping
DROP TABLE
SELECT 1044
DELETE 1015
NOTICE:  view "tmp_sent" does not exist, skipping
DROP VIEW
CREATE VIEW
      acc_sentence
------------------------
 0.33572911675451205878
(1 row)

NOTICE:  view "tmp_pub" does not exist, skipping
DROP VIEW
CREATE VIEW
    acc_publication
------------------------
 0.06896551724137931034
(1 row)


### sampler.sampler_args: "-l 1000 -s 1 -i 500 -a 0.1 -d 0.99" 

      acc_sentence
------------------------
 0.27471649896182718416
(1 row)

NOTICE:  view "tmp_pub" does not exist, skipping
DROP VIEW
CREATE VIEW
    acc_publication
------------------------
 0.06896551724137931034
(1 row)


### sampler.sampler_args: "-l 300 -s 1 -i 300 -a 0.5"

      acc_sentence
------------------------
 0.33972208912314326785
(1 row)

NOTICE:  view "tmp_pub" does not exist, skipping
DROP VIEW
CREATE VIEW
    acc_publication
------------------------
 0.17241379310344827586
(1 row)

### sampler.sampler_args: "-l 300 -s 1 -i 300 -a 1.0"

DROP VIEW
CREATE VIEW
      acc_sentence
------------------------
 0.30937549912154607890
(1 row)

NOTICE:  view "tmp_pub" does not exist, skipping
DROP VIEW
CREATE VIEW
    acc_publication
------------------------
 0.17241379310344827586
(1 row)