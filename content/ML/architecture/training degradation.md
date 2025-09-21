---
cssclasses: 
aliases: 
permalink: ML/training-degradation
publish: "true"
"date:": "[[2024-08-13]]"
link: 
tags: 
parent: "[[deep learning|neural network]]"
source: 
related: "[[neural network architecture]]"
created: 2024/08/13
updated: 2025/07/31
---
%%
date:: [[2024-08-13]]
parent:: [[deep learning]]
source::
related:: [[neural network architecture]]
tags::
%%
# [[training degradation]]

## Notes
- Authors of [Deep Residual Learning for Image Recognition](https://arxiv.org/abs/1512.03385) noticed that deeper networks not always give better testing (but also training) accuracy. why is that?
	  ![[Pasted image 20240813180447.png|500]]
- ==can be an [[overfitting]] issue?==
	- ==No==, because then the training set error would be lower for the larger network.
- 56-layered network could have 36 "empty" layers not doing anything and then 20 extra layers which would do the job, but that's not happening with "plain" networks
- to prevent [[training degradation]] the authors proposed to use the [[skip connection]] method

## Resources
-

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
