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
updated: 2025/05/01
---
%%
date:: [[2024-09-09]]
parent::
source::
related::
tags::
%%
# [[precision and recall]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
### Precision
- High fraction of TP within what the model labels as positive class: $\frac{TP}{TP+FP}$
- *bank wants to give a loan ONLY to those who **certainly** will return it, even if this number is small and excludes some people who also will return the money *

### Recall
- Powerful "coverage" of the positive class: $\frac{TP}{TP+FN}$
- same as [[true positive rate]]
- *bank wants to find all clients who will return the loan, indifferent to those who won't be able to return it*

## Resources
- 

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
