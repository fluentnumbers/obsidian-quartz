---
cssclasses: 
aliases:
  - class imbalance
permalink: ML/class-disbalance
publish: "true"
"date:": "[[2025-01-02]]"
link: 
tags: 
parent: "[[Machine Learning MoC]]"
source: 
related: 
created: 2025/01/02
updated: 2025/07/28
---
%%
date:: [[2025-01-02]]
parent:: [[Machine Learning MoC]]
source::
related::
tags::
%%
# [[class disbalance]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- Can be corrected by
	- [[upsampling]]
		- including advanced methods like [[SMOTE]], although it can be seen as one of the [[data augmentation]] methods
	- [[downsampling]]
	- weights scaling
	- joining classes
- from [[ML System design course - Training datasets]]
  ![[ML System design course - Training datasets#^bbbae2|ML System design course>Class imbalance]]
## Resources
- https://alexanderdyakonov.wordpress.com/2021/05/27/imbalance/
- https://www.svds.com/tbt-learning-imbalanced-classes/

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
