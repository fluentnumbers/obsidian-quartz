---
cssclasses: 
aliases: 
permalink: ML/softmax
publish: "true"
"date:": "[[2025-01-12]]"
link: 
tags: 
parent: "[[activation function]]"
source: 
related: 
created: 2025/01/12
updated: 2025/05/01
---
%%
date:: [[2025-01-12]]
parent:: [[activation function]]
source::
related::
tags::
%%
# [[softmax]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- normalized exponential function, converts a vector of K real numbers into a probability distribution of K possible outcomes
- used in multi-class classification problems (including [[next token prediction]] tasks) as a generalization of [[logistic regression]], see [[logistic regression#^027f8a]]

### Formula
![[Pasted image 20250112194036.png|500]]
- $\vec z$ of input elements [$z_0...z_K$]
- Output of softmax is always a positive number regardless of the input sign
- dividing the exponent by a parameter [[temperature]] T allows for controlling [[entropy]] and affecting the output distribution
## Resources
-

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
