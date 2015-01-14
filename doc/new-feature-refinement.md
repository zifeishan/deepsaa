# New features

ext_funcword_3gram


  "ext_sentence_stats" (style)
   num_chars
   num_upper_chars
   num_upper_words
   num_words

  "ext_stopwords"
  - 

  "ext_funcword_1gram"
  - 12332 function words
  - TODO: filter only "words"! Too many numbers
  (X TODO: do not convert everything to lower case)

X * TODO: how you start a sentence (1st word/ngram of sentence)
    - Only a style feature (function word)

  (* disambiguated word (word+POS): )
  (Future: dependency path)

  * a clean cut between C/S features

  "ext_funcword_2gram"
  - style

  "ext_non_dict_words"
  - TODO: lowercase? punct? numbers? ...

  "ext_punc_seq"
  - style


  "ext_char_1gram"
  - style + content

  "ext_char_2gram"
  - content

  "ext_char_3gram"
  - content

X + TODO: sentence shape: 
      - (XXX,XX;XXX.)
      - XXX,M,XX,M,XXX,XX;X.
      - 3,M,2,M,3,2;1.

X + TODO: transition words:
      - first word after each punctuation if it is a function word


  "ext_word_1gram"
  - content

  "ext_word_3gram"
  - content

  "ext_pos_1gram"
  - style

  "ext_pos_2gram"
  - style

  Question: should we lower case anything?
  - not for now

  Question: people names?
  - not for now


  - how often do author last names occur?


  the NCP plot                      |  130

   publication_id |                                  array_agg                                  | count
  ----------------+-----------------------------------------------------------------------------+-------
           855935 | {"Dasgupta, Anirban","Lang, Kevin J.","Leskovec, J.","Mahoney, Michael W."} |   124
            48480 | {"Lang, Kevin J.","Leskovec, J.","Mahoney, Michael W."}                     |     6
  (2 rows)

  + GENERATE DATASET: 
      - style, all, content

X + TODO: add a feature: "ext_funcword_3gram"

  * Future: how many papers do we need to train a robust model for an author?

  ## About Tim's script
  1. use different -temp
  2. run_all 
  3. run_em
  NOTE: > some_out

  (pypy + numpy?)

  + TODO: filtering by "minimum document frequency of 2"!!

X + Replace numbers by "-NUMBER-"

  + Last names of `authors`: 
      - put it: 
      1. as a SINGLE dataset 
      2. into content & all