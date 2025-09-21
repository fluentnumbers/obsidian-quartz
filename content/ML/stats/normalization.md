---
cssclasses: 
aliases: 
permalink: ML/normalization
publish: "true"
"date:": "[[2024-12-06]]"
link: 
tags: 
parent: "[[data preprocessing]]"
source: 
related:
  - "[[standartization]]"
created: 2024/12/06
updated: 2025/05/01
---
%%
date:: [[2024-12-06]]
parent:: [[data preprocessing]]
source::
related:: [[standartization]]
tags::
%%
# [[normalization]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- Transforms x by scaling each feature to a range [a, b]

![[Pasted image 20241206093401.png|500]]

- it is possible that the [[test set]] will contain samples outside the chosen range. These are out-of-sample cases, for which the algorithm will likely work poorly, but there is nothing conceptually wrong about this.
## Resources
-

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
