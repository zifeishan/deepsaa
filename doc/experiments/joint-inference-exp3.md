# exp3

(this has WRONG factors on near_sent_constraint and f_pub_author_constraint)

deepsaa=# select * from dd_inference_result_variables_mapped_weights order by weight asc limit 30;
   id   | initial_value | is_fixed |           description            |      weight
--------+---------------+----------+----------------------------------+-------------------
      0 |             0 | f        | f_pub_author_constraint-         | -2551.85037140907
 569282 |             0 | f        | fs_word_1gram-309978-of          |  -37.437611345517
 383896 |             0 | f        | fs_word_1gram-309978-is          |  -20.795316810492
 172894 |             0 | f        | fs_word_1gram-309978-A           | -19.8137409243126
 559119 |             0 | f        | fs_word_1gram-93660-that         | -17.6259661702705
 254667 |             0 | f        | fs_word_1gram-309978--           | -17.4419707192513
 344010 |             0 | f        | fs_word_1gram-309978-,           | -17.0600442400986
 295744 |             0 | f        | fs_word_1gram-309978-3           | -16.3961505886104
 286184 |             0 | f        | fs_word_1gram-309978--LRB-       | -15.3105938154044
 275286 |             0 | f        | fs_word_1gram-309978--RRB-       | -14.8465195048051
 198933 |             0 | f        | fs_word_1gram-469663-finite      | -14.4086442034152
 356669 |             0 | f        | fs_word_1gram-93660-the          | -13.6997240742047
 601107 |             0 | f        | fs_word_1gram-93660-we           | -12.9448742110612
 278261 |             0 | f        | fs_word_1gram-274406-,           | -12.8742488843376
 121599 |             0 | f        | fs_word_1gram-274406-an          | -12.7909839837537
  29413 |             0 | f        | fs_word_1gram-274406-that        |  -12.760322269336
 185611 |             0 | f        | fs_word_1gram-534916-which       | -12.7192815409357
 210440 |             0 | f        | fs_word_1gram-307248-are         | -12.2320003334757
 202550 |             0 | f        | fs_word_1gram-93660-and          | -12.1189423801897
 488327 |             0 | f        | fs_word_1gram-469663-empty       | -12.0399899688278
 265267 |             0 | f        | fs_word_1gram-469663-only        | -11.8759555760016
 148120 |             0 | f        | fs_word_1gram-307248-the         | -11.8560103734555
 426618 |             0 | f        | fs_word_1gram-93660-have         |  -11.700734925604
 621591 |             0 | f        | fs_word_1gram-61756-4            | -11.5817158192932
 279253 |             0 | f        | fs_word_1gram-309978-that        | -11.5031810341445
 480369 |             0 | f        | fs_word_1gram-469663-infinite    | -11.2426910112956
 180061 |             0 | f        | fs_word_1gram-309978-also        | -10.9346226104786
 264130 |             0 | f        | fs_word_1gram-309978-generations |  -10.917390031456
 323721 |             0 | f        | fs_word_1gram-534916-scheme      | -10.8897597686015
 529084 |             0 | f        | fs_word_1gram-469663-over        | -10.8366367334885

deepsaa=# select * from dd_inference_result_variables_mapped_weights order by weight desc limit 30;
   id   | initial_value | is_fixed |            description            |      weight
--------+---------------+----------+-----------------------------------+------------------
 330346 |             0 | f        | fs_word_1gram-309978-protocol     | 165.685704448987
 367735 |             0 | f        | fs_word_1gram-534916-Abstract     | 66.5887932165211
  58001 |             0 | f        | fs_word_1gram-93660-modular       | 62.6688479951137
 263909 |             0 | f        | fs_word_1gram-307248-Abstract     | 62.0089316611712
 629409 |             0 | f        | fs_word_1gram-93660-composite     | 46.8388469429228
  81799 |             0 | f        | fs_word_1gram-469663-word         | 44.4304756009625
 382381 |             0 | f        | fs_word_1gram-469663-argued       | 41.4839523800477
 151052 |             0 | f        | fs_word_1gram-93660-combinatorial | 41.3937804266044
 568360 |             0 | f        | fs_word_1gram-469663-cognition    | 40.2324799005215
 202706 |             0 | f        | fs_word_1gram-469663-analogy      | 40.2256262567597
 480928 |             0 | f        | fs_word_1gram-61756-projections   | 39.1497241230811
 425162 |             0 | f        | fs_word_1gram-50394-circuits      | 37.0201662197416
 151297 |             0 | f        | fs_word_1gram-274406-systolic     | 36.9551391456132
 256596 |             0 | f        | fs_word_1gram-469663-words        | 36.4282534172646
 346673 |             0 | f        | fs_word_1gram-274406-arrays       | 35.9776414652468
  37586 |             0 | f        | fs_word_1gram-534916---           | 35.3503991870972
 168515 |             0 | f        | fs_word_1gram-274406-survey       | 35.0391534215512
 445675 |             0 | f        | fs_word_1gram-50394-Contents      |  34.880024059409
 120783 |             0 | f        | fs_word_1gram-507376-Wadge        | 34.5410007774145
 492741 |             0 | f        | fs_word_1gram-50394-asynchronous  |  33.870766100148
 423393 |             0 | f        | fs_word_1gram-93660-systems       | 33.6113881447319
  33149 |             0 | f        | fs_word_1gram-61756-distances     | 33.0444764501499
 160995 |             0 | f        | fs_word_1gram-469663-core         | 32.8961491645295
 340069 |             0 | f        | fs_word_1gram-534916-coding       | 32.2690927351082
 509777 |             0 | f        | fs_word_1gram-534916-codeword     |  31.614995790016
 247671 |             0 | f        | fs_word_1gram-93660-design        | 31.3722873177093
 578145 |             0 | f        | fs_word_1gram-394820---           | 31.2294693540446
 301579 |             0 | f        | fs_word_1gram-469663-nouns        | 31.1527686404371
  18908 |             0 | f        | fs_word_1gram-469663-adjectives   | 31.1527686404371
  91040 |             0 | f        | fs_word_1gram-469663-verbs        | 31.1527686404371


