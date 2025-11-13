---
cssclasses: 
aliases: 
permalink: LLM/evaluating-information-retrieval
publish: true
"date:": "[[2025-07-04]]"
link: https://fluentnumbers.medium.com/cheatsheet-for-rag-evaluation-cee0f1b039b6
tags: 
parent: "[[model evaluation]]"
source: 
related:
  - "[[Systematically Improving RAG Applications]]"
  - "[[published]]"
created: 2025/07/04
updated: 2025/08/04
---
%%
date:: [[2025-07-04]]
parent:: [[model evaluation]]
source::
related:: [[Systematically Improving RAG Applications]] [[published]]
tags::
%%
# [[Evaluating information retrieval]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Contents

- [[#Related|Related]]
- [[#Note|Note]]
- [[#Build your own relevance dataset|Build your own relevance dataset]]
		- [[#Real data|Real data]]
		- [[#Synthetic data|Synthetic data]]
- [[#Types of experiments|Types of experiments]]
	- [[#Types of experiments#System architecture decisions|System architecture decisions]]
	- [[#Types of experiments#Other|Other]]
- [[#Metrics|Metrics]]
	- [[#Metrics#Technical|Technical]]
	- [[#Metrics#Use-case defined|Use-case defined]]
- [[#Resources|Resources]]

## Related
- See general approach to evaluating LLMs: [[LLM#How to evaluate LLMs?]] and [[how to evaluate LLM chatbots]]
## Note
- end-to-end [[model evaluation]] is challenging, unless we expect a single short answer. Evaluate separately:
	- information extraction (did the system find the correct information?)
	- reasoning (Given correct information, did the system make the right conclusions?)
	- output generation (Was the final response clear and actionable?)
	- some domains are easier than others
		- coding: does the code pass tests?
	- user feedback or the way they interact with the results can be the ultimate metric
		- [[Evaluating information retrieval#^96c623|for AI-generated emails]]: do users make edits before sending?
- Implement evaluation **before** increasing the system complexity, otherwise you can't monitor performance progression.
- If your knowledge base is dynamic, ==evaluation must happen periodically==, although there are other reasons for that too.
- Separate retrieval evaluations vs generation evals and focus on the retrieval part first
	- retrieval is cheap, generation expensive
	- generation comes later in the pipeline and assumes the retrieval is correct
- when evaluating the performance of the system you have, don't forget to register what is missing
	- Inventory issues - ==Lack of data== to fulfill certain user requests. Better algorithm can't help with that ---> ==design a fallback scenario or a baseline algorithm==
	- Capability issues - Functionality gaps where a system can't perform certain types of queries or filters.
	- Examine [[false negative rate|false negatives]] of your retrieval; what should have been retrieved, but it wasn't.
- repeat your test questions multiple times and calculate answers consistency, probability of being accurate
- ==Retrieval sufficiency - evaluate if retrieved docs provide enough information to completely answer the query, not just whether they all are relevant.==
- [[Retrieval-Augmented Generation|RAG]] impact is dependent on the quality of retrieved documents, which in turn is evaluated by:
	- relevance: how good the system is at ranking relevant documents higher and irrelevant documents lower
	- information density: if two documents are equally relevant, we should prefer one that’s more concise and has fewer extraneous details
		- apparently,[built-in Google PDF processing encodes each page with a fixed number of tokens](https://www.perplexity.ai/search/find-any-articles-reverse-engi-Paw70fpKSCKI9jAVxb6xvg) --> ==retrieval from a dense page will be worse, because of higher data compression==
	- level of detail:
- Group your [[model evaluation|evaluation]] set queries by difficulty into N groups (e.g. 5x20) and only start evaluating the next group once you reach the desired accuracy or recall on simpler questions. ^0824a6
- Know what you improve ^86c765
	- Prioritize high volume, low satisfaction result queries
	- Collect user feedback in real time with simplest methods To identify emerging issues and query trends.
	- query classification and [[clustering]]
		- Use [[few-shot learning|few-shot ]] classifiers, segment queries into categories or put labels such as time sensitive, financial, multi-step.
		- 
- [[#Build your own relevance dataset]]
	- ==Better data is better than better models==
	- public [[benchmark]] like [MTEB](https://huggingface.co/spaces/mteb/leaderboard) rarely are as relevant as specific-application dataset
		- too generic, even when specialized on a topic
		- too clean, correct
		- Data may have been seen by the embedding model during pre-training
- [[hypothesis testing|statistical validation]] of potential improvements to quantify confidence in performance differences and avoid investing in unreliable improvements.
	- create a `@dataclass` `ExperimentConfig`, functions to sample from available data and calculate metrics
	- [[bootstraping]] on N samples with various RAG configurations and calculate [[confidence interval]]
		- plot Recall@k for different K for pairs of `ExperimentConfig`
			- if confidence intervals are too large - increase N
			- if confidence intervals for two different configurations overlap - *it is possible* that the difference in performance was due to chance
	- [[t-test]] is another way to tell if the difference in the means of the two configurations is due to chance
		- use distribution of the means from bootstraping, not means themselves
		- high [[p-value]] and low t-statistics points to ==NO statistical significance==
- if you have [[Advanced RAG techniques#^c819e0|a number of tools for various search-use-cases]] (somewhat similar to [[intent recognition]]) evaluate them independently
	- ask the model to make a plan which tools to use, track plan acceptance rates by the users
- [[LLM-as-a-judge]]
## Build your own relevance dataset
#### Real data
- If available, sample user queries and their outputs from a production RAG and put time to rank the results yourself or with the help of LLM
	- fancy way - use tracing tools like [[Langsmith]], Log Fire
	- simply save user\session info, queries-answer pairs, retrieved chunks to [[Postgres]]
- collect unstructured feedback (comments, issue reports)
	- hierarchical [[clustering]] to identify patterns and create a taxonomy of categories
#### Synthetic data
- If there is no existing system, use LLM to generate queries for your content. See [[synthetic data generation for RAG evaluation]]

#### Evaluation datasets \ benchmarks
- [TREC](https://pages.nist.gov/trec-browser/)
- [BEIR](https://github.com/beir-cellar/beir)
- [MS Marco](https://github.com/microsoft/MSMARCO-Passage-Ranking)
## Types of experiments
- ==Prioritize experiments based on potential impact and resources==, log everything and present in tidy format
### System architecture decisions
- different [[tokenization|embedding]] models by size, dimensionality, developer, ...
	- `text-embeddings-3-small` vs `large`
- [[chunking strategy]]
- test how the [[reranking|reranker]] performance changes depending on the N chunks we pass in
	- composite scoring function of several sources
	- [[chunking strategy#^447647|shuffling vs no-shuffling]]
- [[hybrid search]] vs [[vector search]]-only
- [[Advanced RAG techniques#^9d73c5|formatting]] of your documents (markdown, yaml, json, xml)

### Other
- [[invariance testing]]
	- the system's output shouldn't change due to
		- rephrasing
		- shorter\longer queries, abbreviations, punctuation, grammar mistakes
		- change of irrelevant details (names, genders, etc.)
- Experiment with the [[top-k sampling]] with [[cosine similarity]] and top N with [[reranker]] to see how to get better [[precision and recall|recall]] where N << K
- compare [[latency]] trade-offs
- Head (frequent) queries vs tail queries
## Metrics
[[LLM metric]]
### Technical
- [[precision and recall|recall@k]]: include everything that is relevant, High recall means effective usage of relevant information.
	- Most current models are very good at recall because they are optimized for [[needle in a haystack]] tests., But the sensitivity to irrelevant information is less well optimized, therefore don't forget about the precision
- [[precision and recall|precision@k]]: do not include anything irrelevant, High precision means fewer noisy documents.
- [[Normalized Discounted Cumulative Gain]]@k:
	- [NDCG: What It Is and Where To Use It? AI Essential Lessons](https://arize.com/blog-course/ndcg/)
- [[Mean Reciprocal Rank]]
- Coverage 
	- Measures whether the retrieve documents collectively address all subtopics or facets of the user query.
	- Important for complex or multi-[[intent recognition]], [[multi-hop question answering]]
	- Evaluate by embedding-based diversity metrics
		- Cluster analysis of retrieved embeddings versus subtopic embeddings
- Indexing quality
	- Are the indexes used for retrieval complete and fresh?
	- Evaluated by index age, corpus-to-index freshness ratio, document ingestion success rate.
- LGTM@10
- Monitor the average [[cosine similarity]] of your queries over time. A sudden change might signal a shift in user behavior or data. For instance, in a [[recommender systems]] many new users attracted by a **seasonal promotion** may be unable to afford regular (expensive) goods, bought by regular customers.

### Industrial
- end-user-engagement: click, add, dwell
- human-involved evaluation, but not end-users:
	- for instance, AI system generates emails to prospective buyers with several price options, conditional discounts and other upselling tricks. Prior sending these emails reviewed by sales people. If they make corrections\edits to the email, we consider that smth went wrong in model reasoning and analyze the pitfall. ^96c623
- satisfaction feedback
- conversion, retention, engagement
- ratio of FAQ requests forwarded to a live agent
- Revenue
- Multi-objective ranking, not just optimizing relevance.

## Resources
- [Evaluating the Effectiveness of LLM-Evaluators (aka LLM-as-Judge)](https://eugeneyan.com/writing/llm-evaluators/)
- [Mastering RAG: 8 Scenarios To Evaluate Before Going To Production - Galileo](https://galileo.ai/blog/mastering-rag-8-scenarios-to-test-before-going-to-production)
- [RAGChecker: A Fine-grained Framework For Diagnosing RAG](https://github.com/amazon-science/RAGChecker)
- [Cheat at Search Essentials: Evaluation, NDCG, and pals](https://maven.com/p/8b3be4/cheat-at-search-essentials-evaluation-ndcg-and-pals)
---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
