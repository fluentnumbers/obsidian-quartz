---
cssclasses: 
aliases:
  - chunking
permalink: RAG/chunking-strategy
publish: "true"
"date:": "[[2025-07-26]]"
link: 
tags: 
parent: "[[Advanced RAG techniques]]"
source: 
related: 
created: 2025/07/26
updated: 2025/08/04
---
%%
date:: [[2025-07-26]]
parent:: [[Advanced RAG techniques]]
source::
related::
tags::
%%
# [[chunking strategy]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- ==[[chunking strategy]]== can have a huge impact on [[Evaluating information retrieval|RAG performance]]. ^c77646
	- small chunks --> limited context --> incomplete answers ^789f4e
	- large chunks --> noise in data --> poor [[precision and recall|recall]]
		- general, but not-universal advice: use larger chunks for fixed-output queries (e.g. extracting a specific answer\number) and smaller chunks for expanding-output queries (e.g. summarize, list all...).
	- By symbols, sentences, semantic meaning, using dedicated model or an LLM call
	- [[semantic chunking]] by detecting where the change of topic has happened
	- Consider inference latency, number of tokens [[tokenization|embedding]] models were trained on
	- Overlapping or not?
	- Use small chunks on embedding stage and large size during the inference, by appending adjacent chunks before feeding to LLM
	- page-size chunks, because we answer the question "on which page can I find this?"
	- ==sub-chanks with links to a parent-chunk with larger context==
- hierarchical chunking gradually zooms into relevant context and improves efficiency of *clarifying questions* within a multi-turn conversation
	- multiple levels based on document metadata, sections, pages, paragraphs and sentences
	- Each chunk retains information about its metadata, hierarchical level, parent-child relationship, extracts confidence scores, etc.
- Shuffling context chunks will create randomness in outputs, which is comparable to increasing diversity of the downstream output (as an alternative to hyperparameter tuning using [[temperature|softmax temperature]]) - e.g. previously purchased items are provided in random order to make recommendation engine output more creative ^447647
	- shuffle the order of retrieved sources to prevent position bias
		- unless sources are sorted by relevance (the model assumes that the 1st chunk is the most relevant)
		- newer models with large context windows are less prone to the [[Lost in the Middle effect]] and have improved recall across the whole context window

### Chunking rankings example
![[hero_table.png|900]] from https://research.trychroma.com/evaluating-chunking

## Resources
- 

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
