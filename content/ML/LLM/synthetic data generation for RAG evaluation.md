---
cssclasses:
aliases: 
permalink: LLM/synthethic-data-generation-for-rag
publish: true
"date:": "[[2025-07-03]]"
link: 
tags: 
parent: "[[Retrieval-Augmented Generation|RAG]]"
source: 
related:
  - "[[model evaluation]]"
  - "[[synthetic data]]"
created: 2025/07/03
updated: 2025/07/15
---
%%
date:: [[2025-07-03]]
parent:: [[Retrieval-Augmented Generation|RAG]]
source::
related:: [[model evaluation]] [[synthetic data]]
tags::
%%
# [[synthetic data generation for RAG evaluation]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Contents

- [[#Note|Note]]
- [[#Steps|Steps]]
- [[#Resources|Resources]]

## Note
- treat this as dynamic dataset, not static. As the system improves, [[Evaluating information retrieval#^0824a6|evaluation data must become more advanced]]
- in some places it is implicitly assumed that we generate data for an [[Enterprise RAG patterns|enterprise]] [[chatbot]] application, but approach is similar across use-cases
## Steps
- Chunk filtering
	- pre-filter the documents\chunks based on relevance for users (probability of being queried)
	- Use context, tags, metadata, date ranges
	- Aligned [[LLM-as-a-judge]] approach
		- manually label small part of documents as relevant or irrelevant
		- Iterate on [[LLM-as-a-judge]] criteria to align with labeled data perfectly
		- Label the rest of the data
- [[contextual chunk rewriting]] (optional)
	- ==expensive if is run on every chunk==
	- identify chunks which require additional context such as tables, images, short notes ...
- **Iterative** generation of examples
	- generate (questions from documents \ user queries \ transactions \ etc.)
		- use [[few-shot learning]] and context to create *realistic* queries, both by content and formulation\format
		- *what is the purpose of X in Y* is too clean and easy to search, rather than *X is not working*, which is more likely to be asked by a user
	- review and validate
		- by domain experts
		- by calculating metrics such as [[precision and recall|recall@1,3,5]] or [[Mean Reciprocal Rank|MRR@1,3,5]]
		- by users in production
		- compare validation metrics across *batches* of newly generated data or against the original hand-labeled data. Generated data should be as challenging.
	- generate more examples, by adding the most challenging samples from already generated and validated batch
		- ==randomly sampling from ever growing set of good examples is better than generating all needed samples in one go==
	- repeat until you have a large enough test or [[fine-tuning]] set for your goals
- Ranking generation from questions and chunks
	- Create a good prompt for [[LLM-as-a-judge]] to achieve automatic ranking at the same level as your own manual way
 - summarization of ingested documents (optional) ^ea0ca7
	 - cost-efficiency drops for modern models with large context windows
	 - consider a separate *search summaries* tool and use summarized chunks as supplement to raw data
	 - design summarization prompts with use-case needs in mind
		 - good for financial reports, if numbers are crucial make sure the model retains\sums up them
		 - multi-media content without text captions

## Resources
- [[Systematically Improving RAG Applications#Week 2 Tutorials online]]
- [Evaluating the Effectiveness of LLM-Evaluators (aka LLM-as-Judge)](https://eugeneyan.com/writing/llm-evaluators/)
- 

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
