---
cssclasses:
aliases:
  - precision
  - recall
  - true positive rate
permalink: ML/precision-and-recall
publish: "true"
"date:": "[[2024-09-09]]"
link: 
tags: 
parent: "[[ML metric]]"
source: 
related:
  - "[[F-score]]"
created: 2024/09/09
updated: 2025/07/03
---
%%
date:: [[2024-09-09]]
parent:: [[ML metric]]
source::
related:: [[F-score]]
tags::
%%
# [[precision and recall]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
### Precision
- High fraction of TP within what the model labels as positive class: $\frac{TP}{TP+FP}$
- *bank wants to give a loan ONLY to those who **certainly** will return it, even if this number is small and excludes some people who also will return the money *
- ==low precision = wasting resources (processing irrelevant content)==

### Recall
- Powerful "coverage" of the positive class: $\frac{TP}{TP+FN}$
- same as [[true positive rate]]
- *bank wants to find all clients who will return the loan, indifferent to those who won't be able to return it*
- ==low recall = missing important information==
---

- See also Precision@k and Recall@k at different cut-off points K
	- for [[image retrieval|object retrieval]]: [[image retrieval#Metrics]]
	- for [[Retrieval-Augmented Generation#Evaluating information retrieval|retrieval evaluation]]
- ==In practice it is good to track evolution of metrics for various $k$: 1, 10, 50, 1000....==
## Resources
- 

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
