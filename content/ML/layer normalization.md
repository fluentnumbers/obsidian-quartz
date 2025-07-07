---
cssclasses: 
aliases:
  - norm-add
  - add-norm
permalink: ML/layer-normalization
publish: "true"
"date:": "[[2024-08-14]]"
link: 
tags: 
parent: "[[regularization|regularization]]"
source: 
related:
  - "[[transformer]]"
created: 2024/08/14
updated: 2025/05/01
---
%%
date:: [[2024-08-14]]
parent:: [[regularization|regularization]]
source::
related:: [[skip connection|residual connection]]
tags::
%%
# [[layer normalization]]
<sub>scroll ↓ to [[#Resources]]</sub>
## Note
- Each layer in a [[transformer]], consisting of a multi-head attention module and a feed-forward layer, employs layer normalization and [[skip connection|residual connection]].
- belongs to [[regularization]] for [[deep learning|neural network]], which help control overfitting by keeping the values flowing through the network from getting too big or too small.
	- The layer norm step learns to adjust the values coming out of a layer so that they approximate the shape of a [[normal distribution|Gaussian]] with a mean of 0 and standard deviation of 1.
![[Pasted image 20240814122857.png|500]]
- A popular approach places the layer norm just before the addition step of a [[skip connection]]. Since these two operations always come in pairs, it’s convenient to combine them into a single operation that we call [[norm-add]].
- see also [[batch normalization]]
- requires [[weights initialization|initialization]]

## Resources
-

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
