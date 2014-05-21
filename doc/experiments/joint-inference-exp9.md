/lfs/rambo/0/zifei/deepdive/out/2014-05-21T005913/

01:03:15 [sampler] INFO  # n_learning_epoch   : 300
01:03:15 [sampler] INFO  # n_samples/l. epoch : 1
01:03:15 [sampler] INFO  # n_inference_epoch  : 300
01:03:15 [sampler] INFO  # stepsize           : 0.1
01:03:15 [sampler] INFO  # decay              : 0.95
01:03:15 [sampler] INFO  ################################################
01:03:15 [sampler] INFO  # nvar               : 1406272
01:03:15 [sampler] INFO  # nfac               : 34285920
01:03:15 [sampler] INFO  # nweight            : 749251
01:03:15 [sampler] INFO  # nedge              : 35801632
01:03:15 [sampler] INFO  


$ sh run-evaluation.sh

SELECT 124
DELETE 78
 is_true | count_sentence_author
---------+-----------------------
 t       |                  5317
 f       |                 12335
(2 rows)

(30%)

 is_true | count_pub_author
---------+------------------
 t       |               36
 f       |               10
(2 rows)

(78%)


deepsaa (master) $ cat /lfs/rambo/0/zifei/deepdive/out/2014-05-21T005913/calibration/sentence_author.is_true.tsv
0.00    0.10    561187  14109   547078
0.10    0.20    1603    1499    104
0.20    0.30    773     748     25
0.30    0.40    423     418     5
0.40    0.50    236     236     0
0.50    0.60    190     190     0
0.60    0.70    122     122     0
0.70    0.80    98      98      0
0.80    0.90    107     107     0
0.90    1.00    125     125     0

deepsaa (master) $ cat /lfs/rambo/0/zifei/deepdive/out/2014-05-21T005913/calibration/publication_author.is_true.tsv
0.00    0.10    1270    16      1254
0.10    0.20    11      3       8
0.20    0.30    10      1       9
0.30    0.40    8       3       5
0.40    0.50    3       0       3
0.50    0.60    4       3       1
0.60    0.70    8       4       4
0.70    0.80    6       3       3
0.80    0.90    10      4       6
0.90    1.00    142     99      43



Lack of positive features.

If removed doc-level features, acc of doc will drop to ~40%.

# Exp10

deepsaa (master) $ cat /lfs/rambo/0/zifei/deepdive/out/2014-05-21T014152/calibration/sentence_author.is_true.tsv
0.00    0.10    554191  7061    547130
0.10    0.20    488     467     21
0.20    0.30    459     450     9
0.30    0.40    490     477     13
0.40    0.50    431     416     15
0.50    0.60    329     328     1
0.60    0.70    588     585     3
0.70    0.80    1009    1008    1
0.80    0.90    1291    1288    3
0.90    1.00    5588    5572    16

deepsaa (master) $ cat /lfs/rambo/0/zifei/deepdive/out/2014-05-21T014152/calibration/publication_author.is_true.tsv
0.00    0.10    1433    98      1335
0.10    0.20    2       2       0
0.20    0.30    2       2       0
0.30    0.40    3       3       0
0.40    0.50    4       4       0
0.50    0.60    2       2       0
0.60    0.70    2       2       0
0.70    0.80    4       4       0
0.80    0.90    5       5       0
0.90    1.00    15      14      1

Seems that publications are tend to be too negative...


      acc_sentence
------------------------
 0.64542261500113301609
(1 row)

NOTICE:  view "tmp_pub" does not exist, skipping
DROP VIEW
CREATE VIEW
    acc_publication
------------------------
 0.58695652173913043478
(1 row)


## If removed sparse words:

      acc_sentence
------------------------
 0.62956038975753455699
(1 row)

NOTICE:  view "tmp_pub" does not exist, skipping
DROP VIEW
CREATE VIEW
    acc_publication
------------------------
 0.56521739130434782609
(1 row)



### exp11: With accumulate-style (frequency rather than set) features:

deepsaa (master) $ cat /lfs/rambo/0/zifei/deepdive/out/2014-05-21T023211/calibration/sentence_author.is_true.tsv
0.00    0.10    553421  6464    546957
0.10    0.20    466     396     70
0.20    0.30    306     258     48
0.30    0.40    332     313     19
0.40    0.50    354     347     7
0.50    0.60    575     562     13
0.60    0.70    619     609     10
0.70    0.80    485     472     13
0.80    0.90    988     971     17
0.90    1.00    7318    7260    58

deepsaa (master) $ cat /lfs/rambo/0/zifei/deepdive/out/2014-05-21T023211/calibration/publication_author.is_true.tsv
0.00    0.10    1430    96      1334
0.10    0.20    1       1       0
0.20    0.30    0       0       0
0.30    0.40    3       3       0
0.40    0.50    2       2       0
0.50    0.60    2       2       0
0.60    0.70    4       4       0
0.70    0.80    2       2       0
0.80    0.90    6       6       0
0.90    1.00    22      20      2

      acc_sentence
------------------------
 0.67488103331067301156
(1 row)

NOTICE:  view "tmp_pub" does not exist, skipping
DROP VIEW
CREATE VIEW
    acc_publication
------------------------
 0.60869565217391304348
(1 row)




