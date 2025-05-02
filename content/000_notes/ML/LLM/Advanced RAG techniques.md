---
cssclasses:
aliases: 
permalink: RAG/advanced-rag-techniques
publish: "true"
"date:": "[[2025-01-14]]"
link: 
tags: 
parent: "[[RAG]]"
source: 
related:
created: 2025/01/14
updated: 2025/05/01
---
%%
date:: [[2025-01-14]]
parent:: [[Retrieval-Augmented Generation|RAG]]
source::
related::
tags::
%%
# [[Advanced RAG techniques]]
<sub>scroll ↓ to [[#Resources]]</sub>
## Advanced improvements to RAG
- Most probably you have to chunk your context data into smaller pieces. ==Chunking strategy== can have a huge impact on RAG performance.
	- small chunks --> limited context --> incomplete answers
	- large chunks --> noise in data --> poor [[recall]]
	- By symbols, sentences, semantic meaning, using dedicated model or an LLM call
	- [[semantic chunking]] by detecting where the change of topic has happened
	- Consider inference latency, number of tokens [[tokenization|embedding]] models were trained on
	- Overlapping or not?
	- Use small chunks on embedding stage and large size during the inference, by appending adjacent chunks before feeding to LLM
- [[re-ranking]]
	- see [[Retrieval-Augmented Generation#Re-ranking]]
- [[query expansion]] and enhancement
	- Another LLM-call-module can be added to *rewrite* and expand the initial user query by adding synonyms, rephrasing, complementing with initial LLM output (without RAG context), etc.
- In addition, to **dense** embedding models, historically, there are also **sparse** representation methods. These can **and should** be used in addition to vector search, resulting in [[hybrid search]]
	 - encoding is supervised (e.g splade) or unsupervised (e.g [[BM25]], [[TF-IDF]])
	 - search accelerated with top-k retrieval algorithms like WAND, MaxScore, BM-WAND and more
 - Using hybrid search (at least full-text + vector search) is standard to RAG, but it requires combining several scores into one
	 - use weighted average
	 - take several top-results from each search module
	 - use [[Reciprocal Rank Fusion]], Mean Average Precision, NDCG, etc.
 - [[metadata filtering]] reduces the search space, hence, improves retrieval and reduces computational burden
	 - dates. freshness, source authority (for health datasets), business-relevant tags
	 - categories: use [[entity detection]] models: GliNER
	 - if there is no metadata, one can ask [[LLM]] to generate it

- Shuffling context chunks will create randomness in outputs, which is comparable to increasing diversity of the downstream output (as an alternative to hyperparameter tuning using [[temperature|softmax temperature]]) - e.g. previously purchased items are provided in random order to make recommendation engine output more creative
 - One can generate summary of documents (or questions to each chunk\document) and embed that info too
### Not RAG-specific
 - Off-the-shelf bi-encoders [[tokenization|embedding]] models) can be fine-tuned like any other model, but it is barely done on practice by anyone as there are *much lower hanging fruits*
### Other
- [AutoML tool for RAG](https://github.com/Marker-Inc-Korea/AutoRAG) - auto-configuring your RAG
 - [Contextual Retrieval \\ Anthropic](https://www.anthropic.com/news/contextual-retrieval)
 - Query Classification / Routing - save resources by pre-defining when the query doesn't need external context and can be answered directly or using chat history.
 - Multi-modal RAG, in case your queries need access to images, tables, video, etc. Then you need a multi-modal embedding model too.
 - [Self-RAG](https://arxiv.org/abs/2310.11511), Iterative RAG
 - Hierarchical Index Retrieval - first search for a relevant book, then chapter, etc.
 - [Graph-RAG](https://arxiv.org/abs/2404.16130)
 - [Chain-of-Note](https://arxiv.org/abs/2311.09210)
 - [Contextual Document Embeddings](https://arxiv.org/abs/2410.02525)

## Resources
- [GitHub - NirDiamant/RAG\_Techniques: This repository showcases various advanced techniques for Retrieval-Augmented Generation (RAG) systems](https://github.com/NirDiamant/RAG_Techniques)
- [Yet another RAG system - implementation details and lessons learned : r/LocalLLaMA](https://www.reddit.com/r/LocalLLaMA/comments/16cbimi/yet_another_rag_system_implementation_details_and/)

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
