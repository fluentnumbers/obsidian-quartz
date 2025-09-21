---
cssclasses:
aliases: 
permalink: ML/triplet-loss
publish: true
"date:": "[[2025-06-18]]"
link: 
tags: 
parent: "[[loss function]]"
source: 
related:
  - "[[contrastive loss]]"
created: 2025/06/18
updated: 2025/07/03
---
%%
date:: [[2025-06-18]]
parent:: [[loss function]]
source::
related:: [[contrastive loss]]
tags::
%%
# [[triplet loss]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- used for [[image retrieval|object retrieval]] applications
- ensure that anchor and positive representations be closer, than anchor and negative
- ![[Pasted image 20250618152300.png|500]]
	- $[a]_+$ means $ReLU(a)$ or $max(0,a)$
		- Loss for i-th triplet can be either o or positive.
			- It will be zero when the condition is negative that is the distance between (anchor, positive) +$\alpha$ < (anchor, negative)
			- correction factor $\alpha$ makes the loss function stricter
	- triplet loss **without** the square improves stability of training
## Resources
- 

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
