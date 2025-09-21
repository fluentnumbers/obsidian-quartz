---
permalink:
cssclasses:
aliases:
  - gradient boosting
  - xgboost
  - XGB
  - catboost
  - lightGBM
  - XGBoost
publish: true
link:
"date:": "[[2023-08-26]]"
tags:
source:
parent: "[[ML methods]]"
related:
  - "[[decision tree]]"
  - "[[random forest]]"
created: 2024/01/20
updated: 2025/05/01
---
%%
date:: [[2023-08-26]]
parent:: [[ML methods]]
source::
tags::
%%
# [[boosting]]

## Note

### Boosting vs Bagging
- Both are ensembles of *weak* algorithms, each of which performs slightly above random
- XGB monotonic constraint allows setting requirements on feature and response relation in terms decreasing or increasing
	- For instance, in a loan approval model, you might have prior knowledge that as the income of an applicant increases, the likelihood of loan default should not increase. In this case, you'd expect the relationship between income and default probability to be monotonically decreasing. With [[XGBoost]], you can enforce this constraint.
- boosting has difficulties with datasets where features have high [[cardinality]] like many unique id numbers in some enterprise applications or else
## Resources
- [Open ML Course: Деревья и их ансамбли — Open Data Science](https://ods.ai/tracks/trees-autumn23)
- 

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
