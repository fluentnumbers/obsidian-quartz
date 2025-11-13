---
cssclasses:
aliases:
  - central limit theorem
  - CLT
permalink: stats/central-limit-theorem
publish: "true"
"date:": "[[2024-09-10]]"
link:
tags:
parent: "[[statistics]]"
source:
related: "[[AB test]]"
created: 2024/09/10
updated: 2025/09/21
---
%%
date:: [[2024-09-10]]
parent:: [[statistics]]
source::
related:: [[AB test]]
tags::
%%
# [[Central Limit Theorem]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- for a set of independent values (sample) drawn from the same population (distribution) holds: the sample sum is normally distributed.
- Sample mean always follows T-distribution, independent of the underlying population distribution (and [[normal distribution]] in case the population is also normal)
	- mean(several sample means) = mean(population)
- T-distribution is used to calculate confidence intervals
- Standard error of the mean
	- SEmean = std(several sample means) = std(population)/ sqrt(sample size N)
	- -> distribution of sample averages has lower std than std(population), by sqrt(n)

## Resources
- 

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
