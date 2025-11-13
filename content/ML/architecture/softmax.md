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
related: "[[Briefly about transformer’s evolution or why is softmax cool]]"
created: 2025/01/12
updated: 2025/11/13
---
%%
date:: [[2025-01-12]]
parent:: [[activation function]]
source::
related:: [[Briefly about transformer’s evolution or why is softmax cool]]
tags::
%%
# [[softmax]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- normalized exponential function, converts a vector of K real numbers into a probability distribution of K possible outcomes
- used in multi-class classification problems (including [[next token prediction]] tasks) as a generalization of [[logistic regression]], see [[logistic regression#^027f8a]]

### Formula
![[Pasted image 20250112194036.png|300]]
- $\vec z$ of input elements [$z_0...z_K$]
- Output of softmax is always a positive number regardless of the input sign
- ==not invariant under scaling==: $softmax(C\times y)$ is not equal to $C\times softmax(y)$
- [[temperature]] scaling: dividing the exponent by a parameter [[temperature]] T allows for controlling [[entropy]] and affecting the output distribution - making it more uniform (large T) or sharp, confident (low T).
- ==See also [[Briefly about transformer’s evolution or why is softmax cool]]==
## Resources
- 
---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
