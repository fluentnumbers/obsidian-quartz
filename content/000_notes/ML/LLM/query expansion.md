---
cssclasses:
aliases:
  - query enhancement
permalink: LLM/query-expansion
publish: "true"
"date:": "[[2024-12-04]]"
link: 
tags: 
parent: "[[Retrieval-Augmented Generation|RAG]]"
source: 
related:
created: 2024/12/04
updated: 2025/05/01
---
%%
date:: [[2024-12-04]]
parent:: [[Retrieval-Augmented Generation|RAG]]
source::
related::
tags::
%%
# [[query expansion]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- use an LLM to generate multiple queries based on your initial query; use all of them for [[information retrieval|retrieving]] relevant chunks from [[vector database]]
- can be done using a [[zero-shot learning]] prompt
> You are an AI language modet assistant. Your task is to generate five different versions of the given user question to database. By generating multiple perspectives on the user question, your goal is to help overcome some of the limitations of the distance-based similarity search.
> Provide these alternative questions seperated by newlines.
> Originat question: {question} retrieve relevant documents from a vector the user question, your goat is to help distance-based similarity search. newlines .

## Resources
- 

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
