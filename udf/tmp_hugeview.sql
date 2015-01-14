        DROP VIEW IF EXISTS content_features_sent CASCADE;
        DROP VIEW IF EXISTS content_features_pub CASCADE;
        DROP VIEW IF EXISTS style_features_sent CASCADE;
        DROP VIEW IF EXISTS style_features_pub CASCADE;

        CREATE VIEW style_features_sent AS 
        (
          (SELECT sentence_id, publication_id,
                  'sen' as fname_prefix, 
                  array_agg(fname) as fname, 
                  array_agg(fval)  as fval
            FROM  f_sentence_stats
            GROUP BY publication_id, sentence_id)
          UNION ALL
          
          (SELECT sentence_id, publication_id, 
                  'c1' as fname_prefix, 
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_char_1gram 
            GROUP BY publication_id, sentence_id)

          UNION ALL
          (SELECT sentence_id, publication_id,
                  'pos2' as fname_prefix, 
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_pos_2gram
            GROUP BY publication_id, sentence_id)
          UNION ALL
          (SELECT sentence_id, publication_id,
                  'pos1' as fname_prefix, 
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_pos_1gram
            GROUP BY publication_id, sentence_id)

          UNION ALL
          (SELECT sentence_id, publication_id,
                  'stopword1' as fname_prefix,
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_stopword_1gram
            GROUP BY publication_id, sentence_id)
          UNION ALL
          (SELECT sentence_id, publication_id,
                  'funcword1' as fname_prefix,
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_funcword_1gram
            GROUP BY publication_id, sentence_id)
          UNION ALL
          (SELECT sentence_id, publication_id,
                  'funcword2' as fname_prefix,
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_funcword_2gram
            GROUP BY publication_id, sentence_id)
          UNION ALL
          (SELECT sentence_id, publication_id,
                  'nondict' as fname_prefix,
                  array_agg(fname) as fname,
                  array_agg(fval) as fval
            FROM  f_non_dict_words
            GROUP BY publication_id, sentence_id)
          UNION ALL
          (SELECT sentence_id, publication_id,
                  'punc' as fname_prefix,
                  array_agg(fname) as fname,
                  array_agg(fval) as fval
            FROM  f_punc_seq
            GROUP BY publication_id, sentence_id)

          UNION ALL
          (SELECT sentence_id, publication_id,
                  'funcword3' as fname_prefix,
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_funcword_3gram
            GROUP BY publication_id, sentence_id)
          UNION ALL
          (SELECT sentence_id, publication_id,
                  'start1' as fname_prefix,
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_sent_start_1gram
            GROUP BY publication_id, sentence_id)
          UNION ALL
          (SELECT sentence_id, publication_id,
                  'sshape' as fname_prefix,
                  array_agg(fname) as fname,
                  array_agg(fval) as fval
            FROM  f_sent_shape
            GROUP BY publication_id, sentence_id)
          UNION ALL
          (SELECT sentence_id, publication_id,
                  'trans1' as fname_prefix,
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_trans_word_1gram
            GROUP BY publication_id, sentence_id)
        );






        CREATE VIEW style_features_pub AS 
        (
          (SELECT publication_id,
                  'sen' as fname_prefix, 
                  array_agg(fname) as fname, 
                  array_agg(fval)  as fval
            FROM  f_sentence_stats
            GROUP BY publication_id)
          UNION ALL
          
          (SELECT publication_id, 
                  'c1' as fname_prefix, 
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_char_1gram 
            GROUP BY publication_id)

          UNION ALL
          (SELECT publication_id,
                  'pos2' as fname_prefix, 
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_pos_2gram
            GROUP BY publication_id)
          UNION ALL
          (SELECT publication_id,
                  'pos1' as fname_prefix, 
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_pos_1gram
            GROUP BY publication_id)

          UNION ALL
          (SELECT publication_id,
                  'stopword1' as fname_prefix,
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_stopword_1gram
            GROUP BY publication_id)
          UNION ALL
          (SELECT publication_id,
                  'funcword1' as fname_prefix,
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_funcword_1gram
            GROUP BY publication_id)
          UNION ALL
          (SELECT publication_id,
                  'funcword2' as fname_prefix,
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_funcword_2gram
            GROUP BY publication_id)
          UNION ALL
          (SELECT publication_id,
                  'nondict' as fname_prefix,
                  array_agg(fname) as fname,
                  array_agg(fval) as fval
            FROM  f_non_dict_words
            GROUP BY publication_id)
          UNION ALL
          (SELECT publication_id,
                  'punc' as fname_prefix,
                  array_agg(fname) as fname,
                  array_agg(fval) as fval
            FROM  f_punc_seq
            GROUP BY publication_id)

          UNION ALL
          (SELECT publication_id,
                  'funcword3' as fname_prefix,
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_funcword_3gram
            GROUP BY publication_id)
          UNION ALL
          (SELECT publication_id,
                  'start1' as fname_prefix,
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_sent_start_1gram
            GROUP BY publication_id)
          UNION ALL
          (SELECT publication_id,
                  'sshape' as fname_prefix,
                  array_agg(fname) as fname,
                  array_agg(fval) as fval
            FROM  f_sent_shape
            GROUP BY publication_id)
          UNION ALL
          (SELECT publication_id,
                  'trans1' as fname_prefix,
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_trans_word_1gram
            GROUP BY publication_id)
        );


        CREATE VIEW content_features_sent AS
        (
          (SELECT sentence_id, publication_id,
                  'c2' as fname_prefix, 
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_char_2gram 
            GROUP BY publication_id, sentence_id)
          UNION ALL
          (SELECT sentence_id, publication_id,
                  'c3' as fname_prefix, 
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_char_3gram 
            GROUP BY publication_id, sentence_id)

          UNION ALL
          (SELECT sentence_id, publication_id,
                  'w1' as fname_prefix, 
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_word_1gram 
            GROUP BY publication_id, sentence_id)

          UNION ALL
          (SELECT sentence_id, publication_id,
                  'w3' as fname_prefix, 
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_word_3gram
            GROUP BY publication_id, sentence_id)

        );

        CREATE VIEW content_features_pub AS
        (
          (SELECT publication_id,
                  'c2' as fname_prefix, 
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_char_2gram 
            GROUP BY publication_id)
          UNION ALL
          (SELECT publication_id,
                  'c3' as fname_prefix, 
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_char_3gram 
            GROUP BY publication_id)

          UNION ALL
          (SELECT publication_id,
                  'w1' as fname_prefix, 
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_word_1gram 
            GROUP BY publication_id)

          UNION ALL
          (SELECT publication_id,
                  'w3' as fname_prefix, 
                  array_agg(ngram) as fname,
                  array_agg(count) as fval
            FROM  f_word_3gram
            GROUP BY publication_id)

        );