---
cssclasses:
aliases:
  - vector databases
permalink: ML/vector-database
publish: true
"date:": "[[2024-08-10]]"
link:
tags:
parent: "[[vector search]]"
source:
related:
  - "[[LanceDB]]"
created: 2024/08/10
updated: 2025/10/30
---
%%
date:: [[2024-08-10]]
parent:: [[vector search]]
source::
related::
tags::
%%
# [[vector database]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- *Vector databases are not databases, but search engines*
- A vector database indexes and stores vector [[tokenization|embedding]], for fast search and optimized storage
- Provides the ability to compare multiple things (semantically) at the same time
- Helps machine learning models remember past data better, making them more useful for search, recommendations, and text generation
- Currently, all modern vector databases contain swiss-knife-level of instrument set to perform vector search, data storage, [[similarity measurement]], [[reranking]], etc.

## Vendors
- See [Vector databases \| OpenAI Cookbook](https://cookbook.openai.com/examples/vector_databases/readme)
	- [[Pinecone]]
	- [[Qdrant]]
	- [[Chroma]]
	- [[Faiss]]
	- [[LanceDB]]
	- [Milvus](https://github.com/milvus-io/milvus)
	- [[pgvector]] with [[Postgres]]
	- [[Azure]]-native
		- Azure AI search
		- Cosmos DB
		- Azure [[Databricks]] Mosaic AI Vector Search

## How to choose a vector database
- see [[#Resources]]
- support for role-based access control, [[multi-tenancy]] isolation
- having multiple embeddings per document
- algorithmic details
	- sparse algorithms beyond [[BM25]]: SPLADE
	- automatic switching between [[approximate nearest neighbor|ANN]] and brute force search
		- can also be implemented manually in code using `if n_docs<N: switch to full search`
- [[self-hosted]] version
- Costs:
	- free tier
	- 50k\500k\1m\... vectors with $d=1024$
- Performance:
	- [[latency]]
	- queries per second
- community and forward support (in case of open-source)
## Resources
- [Vector databases (1): What makes each one different? | The Data Quarry](https://thedataquarry.com/posts/vector-db-1/)
- [Vector databases (2): Understanding their internal...](https://thedataquarry.com/blog/vector-db-2/)
- [Vector databases (3): Not all indexes are created ...](https://thedataquarry.com/blog/vector-db-3/)
- [Vector databases (4): Analyzing the trade-offs • T...](https://thedataquarry.com/blog/vector-db-4/)
- [A VectorDB Doesn’t Actually Work the Way You Think It Does](https://sarthakai.substack.com/p/a-vectordb-doesnt-actually-work-the?triedRedirect=true)
- [What is a Vector Database? | A Comprehensive Vector Database Guide | Elastic](https://www.elastic.co/what-is/vector-database)
- [Vector DB Comparison](https://superlinked.com/vector-db-comparison)

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
