+-----------+--------------------+-----------------------------------------------------+-----------------------------------+
| Category  | Name               | Description                                         | Examples                          |
+-----------+--------------------+-----------------------------------------------------+-----------------------------------+
| Content   | Word N-grams       | unigrams, bigrams, and trigrams of all words        | ``a distance matrix'',            |
|           |                    |                                                     | ``quartet topologies embedded''   |
+-----------+--------------------+-----------------------------------------------------+-----------------------------------+
|           | Character N-grams  | bigrams and trigrams of characters                  | ``NWD'', ``Ref''                  |
+-----------+--------------------+-----------------------------------------------------+-----------------------------------+
| Stylistic | Character unigrams | unigrams of characters.                             | %, {, ~                           |
+-----------+--------------------+-----------------------------------------------------+-----------------------------------+
|           | POS tag N-grams    | unigrams and bigrams of POS tags. We used           | DT NN, PRP VBP,                   |
|           |                    | NLTK default POS tagger (Penn Treebank)             | -LRB- NN                          |
|           |                    | to obtain POS tags.                                 |                                   |
+-----------+--------------------+-----------------------------------------------------+-----------------------------------+
|           | Function word      | unigrams, bigrams, and trigrams of function         | ``under our'', ``but all the''    |
|           | N-grams            | words.                                              |                                   |
+-----------+--------------------+-----------------------------------------------------+-----------------------------------+
|           | Lengths            | Sentence length and average word length of          | 81 chars, 17 words, average       |
|           |                    | each sentence.                                      | word length=4.7                   |
+-----------+--------------------+-----------------------------------------------------+-----------------------------------+
|           | Sentence start     | we capture how a sentence is started by its         | ``We'', ``It'', ``However''       |
|           |                    | first word if it is a function word.                |                                   |
+-----------+--------------------+-----------------------------------------------------+-----------------------------------+
|           | Transition words   | we capture how transitions are made by every        | ``However, we observe''           |
|           |                    | first word after a punctuation if it is a function  | would give the feature ``we''.    |
|           |                    | word.                                               |                                   |
+-----------+--------------------+-----------------------------------------------------+-----------------------------------+
|           | Punctuation        | we concatenate all the punctuations in a            | ``.'', ``,.'', ``,;,.'', ``,().'' |
|           | sequence           | sentence as a feature to capture punctuation        |                                   |
|           |                    | habits in sentences.                                |                                   |
+-----------+--------------------+-----------------------------------------------------+-----------------------------------+
|           | Sentence shape     | we capture sentence shape by punctuations and       | ``3,M;2,M.''                      |
|           |                    | the number of words between each two of them.       |                                   |
|           |                    | If there are more than 3 words between two          |                                   |
|           |                    | punctuations, we mark it as ``many''.               |                                   |
+-----------+--------------------+-----------------------------------------------------+-----------------------------------+