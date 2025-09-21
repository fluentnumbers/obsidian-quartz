---
cssclasses: 
aliases:
  - PPL
permalink: note/perplexity
publish: "true"
"date:": "[[2024-08-15]]"
link: 
tags: 
parent: "[[LLM metric]]"
source: 
related:
  - "[[BLEU]]"
  - "[[ROUGE]]"
created: 2024/08/15
updated: 2025/05/01
---
%%
date:: [[2024-08-15]]
parent:: [[LLM metric]]
source::
related:: [[BLEU]] [[ROUGE]]
tags::
%%
# [[perplexity]]
<sub>scroll ↓ to [[#Resources]]</sub>
## Note
- Intrinsic [[LLM]] evaluation method: a geometric average of the inverse probability of words predicted by the model.
- Intuitively, perplexity means *to be surprised*. We measure how much the model is surprised by seeing new data. **The lower the perplexity, the better the training is**.
- Another common measure is the [[cross-entropy]], which is the Logarithm (base 2) of perplexity.
- As a thumb rule, a reduction of 10-20% in perplexity is noteworthy.
## Resources
-

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
