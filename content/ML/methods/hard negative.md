---
cssclasses: 
aliases:
  - hard negatives
  - hard negative sampling
permalink: ML/hard-negative
publish: true
"date:": "[[2025-07-25]]"
link: 
tags: 
parent: "[[batching]]"
source: 
related:
  - "[[model training]]"
  - "[[hard positive]]"
created: 2025/07/25
updated: 2025/07/25
---
%%
date:: [[2025-07-25]]
parent:: [[batching]]
source::
related:: [[hard positive]] [[model training]]
tags::
%%
# [[hard negative]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- Each training sample consists of three objects\images\transactions\etc. - an anchor, a positive and a negative.
- The idea is to make those a **hard positive** and a **hard negative**
- This approach forces the model to learn the meaningful boundaries between similar but distinct concepts.
	- for a given anchor take positives which are far away in the embedding space ([[hard positive]]s)
	- for a given anchor take negatives which are as close as possible ([[hard negative]]s)
		- use embedding search to find the most similar object\image\transaction, but from a different class then the anchor and positive
- Actual user data is of utmost importance for creating hard negative examples: valuable negative examples come from user interactions that indicate a mismatch between what the system thought was relevant and what the user actually found useful

### Examples
if users delete part of AI-generated content (email, blog, citations), then the query and deleted part are a good [[hard negative]]
	- [[recommender systems]]
		- skipping a song is weaker than deleting it from a playlist
	- [[ecommerce]]
		- bought and returned items
	- data can also be generated [[synthetic data generation for RAG evaluation|synthetically]]
		- create examples of the same abbreviation in different contexts
- [[tokenization|embedder]] [[fine-tuning|finetuning]] with triplets and [[triplet loss]]
- [[Evaluating information retrieval]] block
	- user ignores\deletes some retrieved chunks ---> Hard Negative
- [[image retrieval|object retrieval]] such as [[face recognition]] where we train a model to maximize distance between objects from different classes, even if these objects are very similar

## Resources
- [[Systematically Improving RAG Applications]]

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
