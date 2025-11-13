---
permalink: stats/p-value
cssclasses:
aliases:
  - statistical significance
publish: "true"
link:
tags:
parent: "[[hypothesis testing]]"
source:
related:
  - "[[confidence interval]]"
created: 2024/01/20
updated: 2025/05/01
---
%%
date:: [[2023-10-29]]
parent:: [[hypothesis testing]]
source::
tags::
%%
# [[p-value]]
<sub>scroll ↓ to [[#Resources]]</sub>
## Note
- ==this is not a probability of either of [[hypothesis testing|hypotheses]]==
- **it is a probability of seeing such or more extreme value in case of nul-hypothesis is true**
- in [[AB test]] it is compared against **defined ahead** [[AB test#^5e2c82|significance]] $\alpha$
	- p-value < [[significance]]: evidence ==AGAINST the null-hypothesis==
	- p-value > [[significance]]: ==does NOT GIVE evidence for the null-hypothesis==

> [!WARNING] IT IS NOT POSSIBLE TO CONFIRM the null hypothesis

#### Why do we use p value of 0.05?
Because [Ronald Fisher](https://en.wikipedia.org/wiki/Ronald_Fisher) told us so:
> Fisher suggests that **researchers might consider a p value of 0.05** as a handy guide: “It is convenient to take this point as a limit in judging whether a deviation ought to be considered significant or not.” Pursue results with p values below that threshold, he advises, and do not spend time on results that fall above...

## Resources
- [Наталья Тоганова | Что такое p-value? Достаточно ли одного показателя? - YouTube](https://youtu.be/mt-KIFEEhyk)
- [[karpov courses]]



---

![[base - related.base]]

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
