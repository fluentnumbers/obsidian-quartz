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

### Difference of PR-curve vs ROC curve 
- [[ROC curve]] is a visualization of true positive rate (TPR) and [[false positive rate]] (FPR), whereas PR-curve tells about precision and recall 
- [Precision-Recall AUC vs ROC AUC for class imbalance problems \| Kaggle](https://www.kaggle.com/discussions/general/7517)

> the difference between ROC and precision-recall is in how each treats true negatives. Typically, if true negatives are not meaningful to the problem or negative examples just dwarf the number of positives, precision-recall is typically going to be more useful;
 
 > I think intuitively you can say that if your model needs to perform equally well on the positive class as the negative class (for example, for classifying images between cats and dogs, you would like the model to perform well on the cats as well as on the dogs. For this you would use the ROC AUC.
 > On the other hand, if you're not really interested in how the model performs on the negative class, but just want to make sure every positive prediction is correct (precision), and that you get as many of the positives predicted as positives as possible (recall), then you should choose PR AUC. For example, for detecting cancer, you don't care how many of the negative predictions are correct, you want to make sure all the positive predictions are correct, and that you don't miss any. (In fact, in this case missing a cancer would be worse then a false positive so you'd want to put more weight towards recall.)
 

## Resources
- 

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
