---
permalink: ML/data-labeling
cssclasses:
aliases:
  - data annotation
  - annotation
  - labeling
  - labels generation
publish: "true"
link:
tags:
parent: "[[ML application]]"
source:
related:
  - "[[Label Studio]]"
created: 2024/01/20
updated: 2025/08/24
---
%%
date:: [[2023-10-29]]
parent:: [[ML application]]
source::
related:: [[Label Studio]]
tags::
%%
# [[data labeling]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Contents
- [[#Tabular data|Tabular data]]
- [[#Image data|Image data]]
- [[#Text data|Text data]]
- [[#Video data|Video data]]
- [[#Audio data|Audio data]]
- [[#Resources|Resources]]

## Tabular data
- Use https://www.snorkel.org/ to create labeling heuristics
- [[semi-supervised learning]]: when a small part of the dataset is labeled we can generates labels for unlabeled data by leveraging a model trained on a that small set of labeled data using supervised learning. this is called [[pseudo-labeling]].
- [[unsupervised learning]] using [[clustering]] methods such as [[K-means]]
	- Metrics
		- inertia: the sum of the distance of all the points from the centroid. If all the points are close to each other, that means they are similar and it is a good cluster. We aim for a small distance for all points from the centroid.
	- Dunn's index

## Image data
- weak supervision
	- create a lot of noisy labels for each data point based on various heuristics and average them
	- for images the label can be 0 or 1 depending on whether each object of interest is present
- [[transfer learning]]
- [[focal loss]]
## Text data
- [[zero-shot learning]]
	- topic generation, summarization
- [[tokenization|embedding]] + [[clustering]] (instead of classification head)
- [Q: What makes a good custom interface for reviewing LLM outputs? – Hamel’s Blog](https://hamel.dev/blog/posts/evals-faq/what-makes-a-good-custom-interface-for-reviewing-llm-outputs.html)
## Video data
- 
## Audio data
- 
## Resources
- [Разметка данных в Label Studio при помощи GPT-4: интеграция ML Backend / Хабр](https://habr.com/ru/articles/772974/)
- [[Data Labeling in Machine Learning with Python - Vijaya Kumar Suda]]
- 

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
