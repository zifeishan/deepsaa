# Proposed Features

## Sentence Level

- Length
  - length of sentence (#chars)
  - Number of words
- Average
  - average length of words

- Number of characters, words, sentences, paragraphs, sections

- Vocabulary richness 
  - infrequent word 1gram
  + (TODO)(Yules K^3?? used in Arvind paper)

- Word shape (frequency of words with different combination of upper & lower case letters)

- word length distribution (characters per word)
- Character n-gram frequencies (all chars are interesting, letter, digit, punction, special characters), at least for n=1
- Function word frequencies (word n-gram might capture a lot of content)
- number of spelling errors
- POS tag ngrams
- Parse tree features (e.g. frequency of pair (A,B) where A is parent of B in parse tree)
- Features from dependency parse
- synonyms

## Document Level

- Length
  - length of paper (#chars / #words)
  - Number of words
- Average
  - average length of words

- Avg number of characters, words, sentences, paragraphs, sections

- Number of words used only once in the text [Could be extended to a distribution]


# Export Format to Tim

{sid: {fname: fval}}

{sid: [authors]}