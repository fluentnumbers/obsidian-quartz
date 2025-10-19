---
cssclasses:
aliases:
  - query enhancement
  - query reformulation
  - query rephrasing
permalink: RAG/query-expansion
publish: "true"
"date:": "[[2024-12-04]]"
link:
tags:
parent: "[[Enterprise RAG patterns]]"
source:
related:
created: 2024/12/04
updated: 2025/05/12
---
%%
date:: [[2024-12-04]]
parent:: [[Enterprise RAG patterns]]
source::
related::
tags::
%%
# [[query expansion]]
<sub>scroll ↓ to [[#Resources]]</sub>
## Contents

- [[#Note|Note]]
	- [[#Note#Pattern visualization|Pattern visualization]]
	- [[#Note#Use-cases and products|Use-cases and products]]
	- [[#Note#Prompt example|Prompt example]]
- [[#Resources|Resources]]

## Note
- ask an LLM to generate one or multiple queries based on your initial query; use auto-generated queries for retrieving relevant chunks from [[vector database]] ^70c3c1
- The idea is that expanded queries are better suitable for [[information retrieval]] than the original human-written request
- Query expansion can become core component to an AI product like **SQL assistant** or **No-code UI generator**
- Can be done using a [[zero-shot learning]] prompt, but if good output query examples are available, these can be added

### Pattern visualization

> [!NOTE]- Figure
> ![[Pasted image 20250513141004.png|500]]

### Use-cases and products
- Multi-language documents in the database
- **SQL assistant:** generating standardized query language under the hood ([[SQL]], [[Cypher]])
- Specific vocabulary, terms, which user might not know
- Any other specialized info that might help the Assistant set up a better search
### Prompt example
> [!NOTE]- Prompt example
> ```
> You are an AI search assistant at {company_name}.
> You can search for any information in the database using full-text search engine.
> Information in the database is in English and {another_language}.
> Given the original user query below, generate five different search phrases in order to most efficiently search in the database. 
> By generating multiple perspectives on the user query, your goal is to help overcome limitations of the distance-based similarity search.
> Provide these alternative questions separated by newlines.
> Take into account {company_name} domain specialization
> # {company_name} domain specialization
> // Brief info about the industry and primary business targets.
> Take into account data source specialization
> # data source specialization
> // Brief info about documents, database, specific terms, anything non-standard.
> # original user query
> "{query}"
> ```

## Resources
- 

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
