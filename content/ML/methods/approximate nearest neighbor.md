---
cssclasses:
aliases:
  - ANN
permalink: ML-methods/approximate-nearest-neighbor
publish: "true"
"date:": "[[2025-06-24]]"
link:
tags:
parent: "[[vector search]]"
source:
related:
  - "[[k-nearest neighbors|kNN]]"
created: 2025/06/24
updated: 2025/11/13
---
%%
date:: [[2025-06-24]]
parent:: [[vector search]]
source::
related:: [[k-nearest neighbors|kNN]]
tags::
%%
# [[approximate nearest neighbor]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- find “good-enough” neighbors without exhaustively checking every vector
- **exact** nearest neighbor or brute-force search is computationally expensive with practical applications with billions of indexed vectors
- Types
	- [[clustering]]-based
	- [[decision tree]]-based
	- Locality sensitive hashing
	- graph-based

## Resources
- 

---

![[base - related.base]]

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
