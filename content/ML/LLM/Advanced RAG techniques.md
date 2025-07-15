---
cssclasses: 
aliases: 
permalink: RAG/advanced-rag-techniques
publish: "true"
"date:": "[[2025-01-14]]"
link: 
tags: 
parent: "[[Retrieval-Augmented Generation|RAG]]"
source: 
related:
  - "[[how to evaluate LLM chatbots]]"
  - "[[Enterprise RAG patterns]]"
created: 2025/01/14
updated: 2025/07/13
---
%%
date:: [[2025-01-14]]
parent:: [[Retrieval-Augmented Generation|RAG]]
source::
related:: [[how to evaluate LLM chatbots]] [[Enterprise RAG patterns]]
tags::
%%
# [[Advanced RAG techniques]]
<sub>scroll ↓ to [[#Resources]]</sub>
## Advanced improvements to RAG

> [!NOTE] Note
> RAG intertwines with the general topic of [[model evaluation]], and adjacent to such things as [[synthetic data generation for RAG evaluation]] and [[Retrieval-Augmented Generation#Challenges with RAG|Challenges with RAG]]

- ==[[chunking strategy]]== can have a huge impact on [[Evaluating information retrieval|RAG performance]]. ^c77646
	- small chunks --> limited context --> incomplete answers ^789f4e
	- large chunks --> noise in data --> poor [[precision and recall|recall]]
	- By symbols, sentences, semantic meaning, using dedicated model or an LLM call
	- [[semantic chunking]] by detecting where the change of topic has happened
	- Consider inference latency, number of tokens [[tokenization|embedding]] models were trained on
	- Overlapping or not?
	- Use small chunks on embedding stage and large size during the inference, by appending adjacent chunks before feeding to LLM
	- page-size chunks, because we answer the question "on which page can I find this?"
- [[fine-tuning]] to make models output citations\ref
	- Start with small batches, measure performance, and increase data volume until you reach your desired accuracy level.
	- shuffle the order of retrieved sources to prevent position bias ^447647
		- unless sources are sorted by relevance (the model assumes that the 1st chunk is the most relevant)
		- newer models with large context windows are less prone to the [[Lost in the Middle effect]] and have improved recall across the whole context window
- [[reranker]]
	- see [[Retrieval-Augmented Generation#Re-ranking]]
	- minimize using of *manual boosting* (e.g. boost recent content or specific keywords)
- separate indices for document categories
	- extract specific data structures for each type
	- see [[#^c819e0|below]]
- [[query expansion]] and enhancement
	- Another LLM-call-module can be added to *rewrite* and expand the initial user query by adding synonyms, rephrasing, complementing with initial LLM output (without RAG context), etc.
	- if costs are not an issue, multiple *copies* of the same query can be processed for higher confidence (e.g. [[intent recognition]])
- In addition, to **dense** embedding models, historically, there are also **sparse** representation methods. These can **and should** be used in addition to vector search, resulting in [[hybrid search]] ^f44082
	 - encoding is supervised (e.g splade) or unsupervised (e.g [[BM25]], [[TF-IDF]])
	 - search accelerated with top-k retrieval algorithms like WAND, MaxScore, BM-WAND and more
 - Using [[hybrid search]] (at least full-text + vector search) is standard to RAG, but it requires combining several scores into one ^6fd281
	 - use weighted average
	 - take several top-results from each search module
	 - use [[Reciprocal Rank Fusion]], [[mean average precision]], NDCG, etc.
 - [[metadata filtering]] reduces the search space, hence, improves retrieval and reduces computational burden
	 - dates. [[Retrieval-Augmented Generation#^82cf5f|freshness\timestamps]], source authority (for health datasets), business-relevant tags
	 - categories: use [[named entity recognition]] models: GliNER
	 - if there is no metadata, one can ask [[LLM]] to generate it,
	 - less beneficial if your index is small or query types are limited
- Shuffling context chunks will create randomness in outputs, which is comparable to increasing diversity of the downstream output (as an alternative to hyperparameter tuning using [[temperature|softmax temperature]]) - e.g. previously purchased items are provided in random order to make recommendation engine output more creative
 - One can [[synthetic data generation for RAG evaluation#^ea0ca7|generate summary of documents]] (or questions to each chunk\document) and embed that info too
 - create *search tools* specialized for your use-cases, rather than search for *data types*. The question is not *whether I am searching for semantic or structured data?*, but *which tool would be the best to use for this specific search?* ^c819e0
	- Generic document search that searches everything, Contact search for finding people, Request for Information search that takes specific RFI codes.
	- Evaluate the *tool selection* capability separately
	-  Make the model *write a plan of all the tools it might want to use* for a given query. Possibly present the plan for users approval, creates valuable training data based on acceptance rates.
	- The naming of tools significantly impacts how models use them. Naming it *grep* or else can affect the efficiency.
 - formatting ^9d73c5
	- [Does Prompt Formatting Have Any Impact on LLM Performance?](https://arxiv.org/html/2411.10541v1)
		- check which format (markdown, json, xml) works best for your application. there are also [discussions about token-efficiency](https://community.openai.com/t/markdown-is-15-more-token-efficient-than-json/841742)
		- spaces between tokens in markdown tables (like "| data |" instead of "|data|") affects how the model processes the information.
	- [The Impact of Document Formats on Embedding Performance and RAG Effectiveness in Tax Law Application](https://www.robertodiasduarte.com.br/the-impact-of-document-formats-on-embedding-performance-and-rag-effectiveness-in-tax-law-applications/#Conclusion_Navigating_Format_Choices_for_Optimal_Tax_Law_RAG)
- add citations to avoid [[hallucination]] in critical domains
	- create source\chunk ids and use them as tags in metadata, possibly include first\last 3 words. Then [[fine-tuning]] the model
	- ==validate the existence of citations==, possibly validate semantic relevance of the content
- multi-agent vs single-agent systems
	- communication overhead if agents are NOT read-only, need to align who modifies what
	- if all read-only, for instance, in search of personality info - one may search professional sources, one about personal life, another smth else
	- benefit of multi-agents - token efficiency, Especially if there are more tokens than one agent can consume in the context
		-  The performance just increases with the amount of tokens each sub-agent is able to consume. If you have 10 sub-agents, you can use more tokens, and your research quality is better
- See also [[Inference Scaling for Long-Context Retrieval Augmented Generation]]

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
- [[AI Engineering - Chip Huyen]]

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
