---
cssclasses: 
aliases: 
permalink: RAG/inference-scaling-for-long-context
publish: "true"
"date:": "[[2024-11-18]]"
link: https://arxiv.org/abs/2410.04343
tags: 
parent: "[[Advanced RAG techniques]]]"
source: 
related:
  - "[[long context]]"
  - "[[paper review]]"
created: 2024/11/18
updated: 2025/05/01
---
%%
date:: [[2024-11-18]]
parent:: [[Advanced RAG techniques]]
source::
related:: [[long context]] [[paper review]]
tags::
%%
# [[Inference Scaling for Long-Context Retrieval Augmented Generation]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- investigate how performance scales with increasing magnitude of the inference compute?
- they consider 2 advanced [[Retrieval-Augmented Generation|RAG]] modifications
	- ==Demonstration RAG== (DRAG) combines RAG with few-shot examples; its inference compute scales with both number of documents and number of queries
	- ==Iterative Demonstration-Based RAG (IterDRAG)==
		- Decomposes the query into simpler sub-queries.
		- For each sub-query, performs retrieval and uses fetched context to generate intermediate answers.
		- After all sub-queries are resolved, the retrieved context, sub-queries, and their answers are combined to synthesize the final answer.

![[Pasted image 20241101104319.png|800]]

## Resources
- [\[2410.04343\] Inference Scaling for Long-Context Retrieval Augmented Generation](https://arxiv.org/abs/2410.04343)

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
