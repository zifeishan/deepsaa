deepsaa
=======

DeepDive Application for authorship Attribution

TODO
----

- Balance negative examples
- adopt multinomial variables
- evaluation based on Tim's holdout & reuse script


feature engineering
====

X - Word shape (frequency of words with different combination of upper & lower case letters)
? - word length distribution (characters per word)
X - Function word frequencies (word n-gram might capture a lot of content)
X - number of spelling errors
? - Parse tree features (e.g. frequency of pair (A,B) where A is parent of B in parse tree)
! - synonyms

! - punctuation

## Content words VS Function words

[Explained here](http://www.towson.edu/ows/ptsspch.htm): 

### Content words

Content words are words that have meaning.  They are words we would look up in a dictionary, such as "lamp," "computer," "drove."  New content words are constantly added to the English language; old content words constantly leave the language as they become obsolete.  Therefore, we refer to content words as an "open" class.

Also see [Wikipedia](http://en.wikipedia.org/wiki/Content_word).

#### Content words POS list

NN* (nouns)
JJ* (adjs)
RB* (adverbs)
VB* (verbs)

### Function words
   
Function words are words that exist to explain or create grammatical or structural relationships into which the content words may fit.  Words like "of," "the," "to," they have little meaning on their own.  They are much fewer in number and generally do not change as English adds and omits content words.  Therefore, we refer to function words as a "closed" class.
       
Pronouns, prepositions, conjunctions, determiners, qualifiers/intensifiers, and interrogatives are some function parts of speech.


----

Features
  - Length
  - Number of characters, words, sentences, paragraphs, sections
  - How many words per sentence etc
  - Vocabulary richness (Yules K^3?? used in Arvind paper)
  - Number of words used only once in the text [Could be extended to a distribution]
! - Word shape (frequency of words with different combination of upper & lower case letters)
! - word length distribution (characters per word)
  - Character n-gram frequencies (all chars are interesting, letter, digit, punction, special characters), at least for n=1
! - Function word frequencies (word n-gram might capture a lot of content)
! - number of spelling errors
  - POS tag ngrams
! - Parse tree features (e.g. frequency of pair (A,B) where A is parent of B in parse tree)
  - Features from dependency parse
! - synonyms



TODOs
====

- Vocabulary richness (Yules K^3?? used in Arvind paper)