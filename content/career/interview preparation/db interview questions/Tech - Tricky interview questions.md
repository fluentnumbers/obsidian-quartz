---
cssclasses:
aliases: 
- tricky interview questions
permalink: career/tricky-interview-questions
publish: true
"date:": "[[2025-11-13]]"
link:
tags: 
parent: "[[Interview questions]]"
source: 
related: 
- "[[all kinds of lists]]"
created: 2025/11/13
updated: 2025/11/13
---
%%
date:: [[2025-11-13]]
parent:: [[Interview questions]]
source::
related:: [[all kinds of lists]]
tags::
%%
# [[Tech - Tricky interview questions]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Contents

- [[#LLM|LLM]]
	- [[#LLM#RAG, Retrieval, Vector search|RAG, Retrieval, Vector search]]
	- [[#LLM#Other|Other]]
- [[#Machine Learning|Machine Learning]]
- [[#Resources|Resources]]

## LLM
### RAG, Retrieval, Vector search
- our [[Retrieval-Augmented Generation|RAG]] system is struggling with search [[latency]]. What can we do?
	- [[tokenization|embedding]] dimensionality
		- [[quantization|quantize]] all vectors in the index to *float16* or *int8*
		- Fit a projection (e.g. [[PCA]]) on a reasonable sample (100k vectors) and apply to the rest. Don't forget to normalize the results.
		- ==Do not arbitrary reduce dimensionality== by taking the first half. Vectors aren't ordered by importance and taking only top N will **unpredictably** affect the performance. [some databases allow you to choose search dimension at run-time](https://clickhouse.com/blog/qbit-vector-search)
	- aggressively pre-fiter candidate documents
	- [[vector database]] parameters
		- Tweak [[approximate nearest neighbor|ANN]] parameters
- why [[vector search]] over tabular data does not work out-of the-box?
	- LLMs are not good with numbers: [[tokenization#Common issues due to tokenization]]
	- Large tables' do not fit into one chunk and their columns labels are *too far away* from row labels (if any)
- how to implement [[multi-tenancy]] in [[Retrieval-Augmented Generation|RAG]] so that various user groups have access to different sets of documents
	- Fast work-around: [[metadata filtering]] and\or associate each chunk with a user who uploaded the doc
	- [r/Rag - Reddit](https://www.reddit.com/r/Rag/comments/1n21nq1/scaling_rag_application_to_production_multitenant/)
	- [Implement multitenancy using namespaces - Pinecone Docs](https://docs.pinecone.io/guides/index-data/implement-multitenancy)
### Other
- why can an LLM respond differently to the same input? And if the [[temperature]] parameter is set to 0?
	- NB!: LLMs are [[autoregressive]] that is one altered output token will change all subsequent generations.
	- non-determinism on vendor's side
		- the underlying model version has changed on the side of the host, cache altered, different set of GPUs used for inference
	- *fundamental* issues with batches and GPU calculations
		- floating-point non-associativity, batch invariance
	- [Thinking Machines: Defeating Nondeterminism in LLM Inference](https://thinkingmachines.ai/blog/defeating-nondeterminism-in-llm-inference/#batch-invariance-and-determinism)
- how does [[structured output]] [[structured output#^5c7271|work under the hood]]?
- why does increasing the [[temperature]] parameter may lead to increased [[latency]]?
	- flatter [[log probs]] distribution increases token count (until the end-of-sequence token is selected)
	- worse [[speculative decoding]] yield. draft-verify methods accept less draft tokens
	- output length difference hurts [[continuous batching]] efficiency
- I want to have a certainty metric for a [[classification]] task solved by an LLM. What approaches are there?
	- constrained decoding to output only a label, take the [[log probs]] and convert to probabilities
	- self-consistency voting: sample the model n times and use *max vote share*, *margin between top1 and top2* or *[[entropy]]* as confidence
	- use [[tokenization|embedding]] model to encode *x* and train a classic classifier ([[logistic regression]]) on that, this will give direct probabilities
	- ~~ask an LLM to self-report confidence~~ (bad choice)
	- if not talking about LLMs, then:
		- [[bootstraping]] to asses [[confidence interval]] around predicted probabilities
		- use an ensemble of multiple models, variance among their prediction is an indicator of uncertainty
		- [[Bayesian|Bayesian methods]] to quantify uncertainty by treating model parameters as distributions rather than point estimates
- how to demonstrate LLM system performance to [[stakeholder management|stakeholders]]?
	- technical and business metrics for [[Evaluating information retrieval#Metrics]]
	- demos
		- [[chatbot]] demo where users are presented with two responses based on their query: one response presents info from FAQ **exactly** as it is in the docs (no summarization, no generative action used), another response - information after the GenAI block. Ask users to vote on the best option to subjectively estimate the quality of GenAI and to understand ==whether users need a chatbot or a search-bot==.
		- show users your [[Retrieval-Augmented Generation|RAG]] system and Gemini\ChatGPT side-by-side, answering the exact same questions. Understandably, bare-bone LLM doesn't have access to internal documentation and. therefore, the comparison is not technically fair, but it may create a positive impression for non-technical stakeholders. If I also cache the demo-prompts, than the custom system will also look lightning-fast.
- how to estimate the cost of the genAI [[Project Management|project]] vs potential economical benefits?
- why [[decoder]]-only? What are the benefits? Why good [[tokenization|embedding]] models are not decoder-only?

## Machine Learning
- why not making [[decision tree]] of higher depths level?
	- leads to [[overfitting]]. we want to keep dispersion of each tree in the ensemble low, therefore usually the depth is 5-6
- what happens if we remove the first or the last tree from [[random forest]] and from [[boosting|xgboost]]?
	- base algorithms in random Forest are independent so removing any of them will not affect the outcome much. For xgboost on the contrary base algorithms are sequential and that is removing the first one will have large effects, but deleting the last one will not have much effect
- your [[precision and recall|precision]] is high and recall small and your client wants the opposite. how to do that in a very fast manner?
	- lower the decision threshold
## Resources
- 

---

![[base - related.base]]

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
