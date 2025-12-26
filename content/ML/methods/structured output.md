---
cssclasses:
aliases:
  - SO
permalink: LLM-methods/structured-output
publish: "true"
"date:": "[[2025-10-03]]"
link:
tags:
parent: "[[LLM methods]]"
source:
related:
  - "[[schema-guided reasoning]]"
created: 2025/10/03
updated: 2025/11/15
---
%%
date:: [[2025-10-03]]
parent:: [[LLM methods]]
source::
related:: [[schema-guided reasoning]]
tags::
%%
# [[structured output]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- ==it is not schema-validator, not a generation re-run to fix the schema, not a [[beam search]]==
- uses [[constrained decoding]] to mask the last layer of the model (with [[log probs|log_probs]]) in such a way that it can't select tokens which do not fit the schema provided ^5c7271
- any model should be suitable for SO, but if the model wasn't trained to follow SO, it can happen that **relevant** tokens also suitable for SO are way too far in the [[log probs]] list

## Resources
- [OpenAI DevDay 2024 \| Structured outputs for reliable applications](https://www.youtube.com/watch?v=kE4BkATIl9c)

---

![[base - related.base]]

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
