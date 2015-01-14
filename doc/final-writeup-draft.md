# Features

We evaluate each of our models on two different features sets, one based on content, and one based on style. We acknowledge that that some features such as character n-grams are somewhat ambiguous in terms of their category and could also be considered content features. A more detailed description of our feature space follows.

## Content features

We use the following features that captures the content:

- word N-grams (unigrams, bigrams, and trigrams)
- Character bigrams and trigrams

## Stylistic Features

We design the following stylistic features:

- **Character unigrams**. 

- **POS tag N-grams** (unigrams and bigrams). We used Stanford Core NLP tool

- **Function word N-grams** (unigram, bigram, trigram). Function words are defined as all words other than nouns, verbs, adjectives, and adverbs (which are regarded as "content words"), indicated by their POS tags. In function word features, Numbers are unified into a placeholder `-NUMBER-` to hide content and reduce sparcity.

- **Sentence length**: number of words and characters in a sentence.
- **Average word length** in a sentence.

- **Sentence start**: we capture how a sentence is started by its first word if it is a function word. (e.g. "We", "It", "However")

- **Transition words**: we capture how transitions are made by every first word after a punctuation if it is a function word. (e.g. "However, we observe" would give the feature "we")

- **Punctuation sequence**: we concate all the punctuations in a sentence as a feature to capture punctuation habits in sentences. (e.g. ",,,,." or ",;,.")

- **Sentence shape**: We capture sentence shape by punctuations and the number of words between each two of them. If there are more than 3 words between two punctuations, we mark it as "many". (e.g. "3,M;2,M.")


