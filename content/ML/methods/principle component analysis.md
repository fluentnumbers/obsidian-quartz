---
cssclasses:
aliases:
  - PCA
  - Principle Component Analysis
permalink: linalg/principle-component-analysis
publish: "true"
"date:": "[[2024-09-09]]"
link:
tags:
parent: "[[feature selection]]"
source:
related:
  - "[[T-SNE]]"
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
# [[principle component analysis]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- new features are linear combinations of existing ones with some weights
- weights are selected so that the [[dispersion]] of a new feature is maximized
	- sum of weights are 1, otherwise we can always increase the dispersion by proportional increase of weights
- if we want to get *m* new features, we maximize the dispersion of all *m* new features
	- all weights for each one of *m* new features are different
- prior to [[principle component analysis|PCA]] the dataset needs to be normalized per feature: subtract the average
	- this allows to compute the optimization formula without subtracting the mean
- geometrical interpretation: we project the dataset on a new hypersurface
	- ![[SmartSelect_20240909_170728_MX Player Pro.jpg|800]]

> [!NOTE]- Cheat sheet
> ![[1_LTP0rpo9DZEcx0N_oapizQ.webp|650]]

##### Robust PCA
- There is also a very cool extension “robust PCA” algorithm capable of splitting data into signal / noise, ..but it’s still unclear why it works so well, from a theoretical perspective.
- [numerical-linear-algebra/nbs/3. Background Removal with Robust PCA.ipynb at master · fastai/numerical-linear-algebra · GitHub](https://github.com/fastai/numerical-linear-algebra/blob/master/nbs/3.%20Background%20Removal%20with%20Robust%20PCA.ipynb)
## Resources
-

---

![[base - related.base]]

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
