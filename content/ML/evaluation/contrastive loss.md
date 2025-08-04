---
cssclasses: 
aliases: 
permalink: ML/contrastive-loss
publish: true
"date:": "[[2025-06-18]]"
link: 
tags: 
parent: 
source: 
related:
  - "[[triplet loss]]"
created: 2025/06/18
updated: 2025/06/18
---
%%
date:: [[2025-06-18]]
parent:: [[loss function]]
source::
related:: [[triplet loss]]
tags::
%%
# [[contrastive loss]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- used for [[image retrieval|object retrieval]] applications
- an outdated loss (from 2006) still used in academic papers to show that model improvement is achieved by the algorithm and not a better loss
- asking the model to make such representations of input objects $X_1$ and $X_2$ that
	- if same class: as close together as possible
	- if different class: at least $m$ units apart in their embedding space
- ![[Pasted image 20250618150218.png|600]]
	- $X_1$ and $X_2$ are input objects (images)
	- $G_w(X_1)$ is their vector representation after passing through the neural network
	- $D_w(X_1,X_2)$ is the distance between vector representations
	- $L(W)$ is the aggregate loss over $P$ pairs of ($X_1$, $X_2$) and algorithm parameters $W$ and label $Y$ (0 if $X_1$ and $X_2$ belong to the same class, 1 otherwise)
		- $L(W,Y,X_1,X_2)$ for each pair consists of two parts, but one of them is always 0 because of either Y=0 or 1-Y=0
	- when Y=0 (same class)
		- $L(W,Y,X_1,X_2)=1/2\times D_w^2$
			- we want to minimize the loss, that is we want that objects from the same class closer to each other
			- the model will try to update the gradients for each pair of $X_1$, $X_2$ until their representations do not equal (this will never become true)
	- when Y=1 (different classes)
		- $L(W,Y,X_1,X_2) = 1/2\times max(0,m-D_w)^2$
			- we want that objects of different classes to be at least $m$ units away from each other
			- as long as the $D_w$ is $m$ the model weights for this pair of $X_1$, $X_2$ are not updated (model is satisfied)

## Resources
- [Dimensionality Reduction by Learning an Invariant Mapping](https://www.researchgate.net/publication/4246277_Dimensionality_Reduction_by_Learning_an_Invariant_Mapping)

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
