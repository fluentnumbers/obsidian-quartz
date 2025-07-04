---
permalink: AI/RAG
cssclasses: 
aliases:
  - RAG
publish: true
"date:": "[[2024-02-28]]"
link: 
tags: 
parent: "[[LLM]]"
source: 
related:
  - "[[vector search]]"
  - "[[information retrieval]]"
created: 2024/02/28
updated: 2025/07/04
---
%%
date:: [[2024-02-28]]
parent:: [[LLM]]
source::
related:: [[vector search]] [[information retrieval]]
tags::
%%
# [[Retrieval-Augmented Generation]]

<sub>scroll ↓ to [[#Resources]]</sub>

## Contents

- [[#Note|Note]]
- [[#Vanilla RAG|Vanilla RAG]]
	- [[#Vanilla RAG#Re-ranking|Re-ranking]]
	- [[#Vanilla RAG#Full MVP vanilla RAG|Full MVP vanilla RAG]]
- [[#Evaluating information retrieval|Evaluating information retrieval]]
- [[#Challenges with RAG|Challenges with RAG]]
- [[#Advanced RAG techniques|Advanced RAG techniques]]
- [[#Other topics|Other topics]]
- [[#Resources|Resources]]


## Note
 - RAG is stitching together [[information retrieval]] and generation parts, where the latter is handled by [[LLM]]s.
- Tendency for longer context length does not undermine the importance of RAG
- [[#Evaluating information retrieval|evaluation]] is a crucial part of RAG implementation
- RAG >> [[fine-tuning]]:
	- It is easier and cheaper to keep retrieval indices up-to-date than do continuous pre-training or fine-tuning.
	- More fine-grained control over how we retrieve documents, e.g. separating different organizations' access by partitioning the retrieval indices.

> [One study](https://arxiv.org/abs/2312.05934) compared RAG against unsupervised finetuning (aka continued pretraining), evaluating both on a subset of MMLU and current events. They found that RAG consistently outperformed finetuning for knowledge encountered during training as well as entirely new knowledge. In [another paper](https://arxiv.org/abs/2401.08406), they compared RAG against supervised finetuning on an agricultural dataset. Similarly, the performance boost from RAG was greater than finetuning, especially for GPT-4 (see Table 20).

---
## Vanilla RAG
 - Simplest pipeline for **retrieval** with *bi-encoder approach*, when context documents and queries are computed entirely separately, unaware of each other.

 ![[Pasted image 20241031175813.png|900]]
^d4ee40

 - At larger scales one needs a [[vector database]] or an **index** to allow [[approximate search]] so that you don't have to compute all [[cosine similarity]] between each query and document
	 - Promoted by LLM, approximate search is based on **dense** representation of queries and documents in latent fixed vector space
		 - ==Compressing hundreds of tokens into a signal vector means losing information.==
		 - encoding is mainly supervised via [[transfer learning]] (text embedding [[encoder]]-style [[transformer]] models)
		- Vector index (IVF, PQ, HNSW, DiskANN++)
- [[vector search]] is always combined with [[keyword search]], which help handling specific terms and acronyms. Their inference computational overhead is unnoticeable, but the impact can be unbeatable for certain queries. Good old method is [[BM25]] ([[TF-IDF]])

### Re-ranking
 - To fix the disadvantage of the [[#^d4ee40|bi-encoder approach]] when documents' and queries' representations are computed **separately**, we can add another *re-ranking* stage with [[cross-encoder]] as an extra step, before calling the generator model. ^2dc17c
	 - The idea is to use a powerful, computationally expensive model to score only ==a subset== of your documents, previously retrieved by a more efficient and cheap model. It is **not computationally feasible** for each query-document pair.
	 - A typical re-ranking solution uses [open-source Cross-Encoder models from sentence transformers](https://sbert.net/examples/applications/retrieve_rerank/README.html), which take both the question and context as input and return a score from 0 to 1. Though it is also possible to use GPT4 + prompt engineering.gg
	 - Originally, cross-encoder is a binary classifier where the probability of being a positive class is taken as a similarity score. Now there are also T5-based re-rankers, RankGPT, ...
	 - generally bi-encoder is more *loose* and reranker is more *strict*
	 - [Search reranking with cross-encoders](https://cookbook.openai.com/examples/search_reranking_with_cross-encoders)
	 - [Retrieve & Re-Rank — Sentence Transformers documentation](https://www.sbert.net/examples/sentence_transformer/applications/retrieve_rerank/README.html#retrieval-bi-encoder)

### Full MVP vanilla RAG
- Full MVP *vanilla* RAG pipeline may look like this (with *combine the scores* module too)

![[Pasted image 20241031183445.png|900]]

## Evaluating information retrieval 
- See [[Evaluating information retrieval]]

---

## Challenges with RAG
- See [[tokenization#Common issues due to tokenization]]
- [[Lost in the Middle effect]] (not specific to RAG, but rather [[long context]])
- RAG retrieval capabilities are often evaluated using [[needle in a haystack]] tasks, but that is not what we usually want in real world tasks (summarization, joining of sub-parts of long documents, etc.) --> [[knowledge graphs]] may be a good improvement for this
- Database needs to be always up-to-date
- [[multi-hop question answering]] -> [[knowledge graphs]]
- Privacy or access rights can be compromised when RAG is used by various users
- Database may contain factual or outdated info (sometimes along with the correct info) --> increase data quality checks or improve model robustness, put more weight on more recent documents, filter by date
- Relevant document is missing in top-K retrievals ---> improve the embedder or re-ranker
- Relevant document was chopped during context retrieval ---> use LLM with larger context size or improve the mechanism of context retrieval
- Relevant document got into top-K, but the LLM didn't use that info for output generation --> finetune the model for the contextual data or reduce the noise level in the retrieved context
- LLM output is not following expected format ---> finetune the model, or improve the prompt
- Pooling **dilutes** long text representation: During the encoding step, each token in the query receives a representation and then there is a pooling step which is typically averaging to provide one vector for all tokens in a query (==query-sentence ---> one vector==)
- Requires [[chunking strategy|chunking]]
	- One doc ---> many chunks and vectors.
	- Retrieve docs or chunks?
- Fixed vocabulary
- temporal data
	- challenging because the model needs to keep track of order of events and consequences
	- medical\prescription records, FED speeches, economic reports
	- present chunks chronologically, explore the effect of ascending vs descending order
	- two-stage approach: let the model first extract and reorganize relevantnt info, then reason about it
	- mining reasoning chains from users to create training data
---

## Advanced RAG techniques
- See [[Advanced RAG techniques]]
> [!note]- from [[Advanced RAG techniques]]
> ![[Advanced RAG techniques#Advanced improvements to RAG]]

---

## Other topics
###### [[Inference Scaling for Long-Context Retrieval Augmented Generation]]

## Resources
- [[paper review]] [Seven Failure Points When Engineering a Retrieval Augmented Generation System - YouTube](https://www.youtube.com/watch?v=fB5gNkaINeo&t=202) or [Семь точек отказа RAG систем | Дмитрий Колодезев](https://kolodezev.ru/rag-failure-poins.html)
- [Back to Basics for RAG w/ Jo Bergum - YouTube](https://youtu.be/nc0BupOkrhI)
- [Mastering RAG: How to Select A Reranking Model - Galileo](https://galileo.ai/blog/mastering-rag-how-to-select-a-reranking-model)
- ==[Systematically improving RAG applications – Parlance](https://parlance-labs.com/education/rag/jason.html)==
- [Подбор гиперпараметров RAG-системы с помощью Optuna / Хабр](https://habr.com/ru/articles/811239/)
- A Beginner-friendly and Comprehensive Deep Dive on Vector Databases: [ArchiveBox](https://archive.thesaurus.diskstation.me/archive/1709042030.357413/index.html) from [[dailydoseofds]]
- [RAG From Scratch: Part 1 (Overview) - YouTube](https://www.youtube.com/watch?v=wd7TZ4w1mSw&list=PLfaIDFEXuae2LXbO1_PKyVJiQ23ZztA0x)
- [Local Retrieval Augmented Generation (RAG) from Scratch (step by step tutorial) - YouTube](https://www.youtube.com/watch?v=qN_2fnOPY-M): 5 hours step by step hands-on tutorial
- [Retrieval-Augmented Generation for Large Language Models: A Survey](https://arxiv.org/abs/2312.10997)

###### [[Data Talks Club]]
[[DTC - LLM Zomcamp]]
[RAG in Action: Next-Level Retrieval Augmented Generation - Leonard Püttmann - YouTube](https://www.youtube.com/watch?v=cECSVBTAGvI)
[Implement a Search Engine - Alexey Grigorev - YouTube](https://www.youtube.com/watch?v=nMrGK5QgPVE)

###### [[deeplearning.ai]]
[DLAI - Building and Evaluating Advanced RAG](https://learn.deeplearning.ai/courses/building-evaluating-advanced-rag/lesson/2/advanced-rag-pipeline)

---
###### Links to this File
```dataview
table file.tags from [[]] and !outgoing([[]])  AND -"Changelog"
```
