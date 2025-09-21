---
cssclasses: 
aliases:
  - softmax temperature
permalink: ML/temperature
publish: "true"
"date:": "[[2025-01-12]]"
link: 
tags: 
parent: "[[softmax]]"
source: 
related: 
created: 2025/01/12
updated: 2025/05/01
---
%%
date:: [[2025-01-12]]
parent:: [[softmax]]
source::
related::
tags::
%%
# [[temperature]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- parameter of the [[softmax]] function, when the base formula is modified so that the exponent is divided by a value T

![[assets/published/Untitled.png|500]]

- with T --> infinity it increases [[entropy]] and flattens the distribution
- with T--> 0: more confident predictions become even more confident, less confident become even less confident

![[Pasted image 20250112195254.png|500]]

- this property allows controlling for diversity, creativity and consistency of tokens and is widely adopted by LLM [[decoding strategy|decoding strategies]]

## Resources
-

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
