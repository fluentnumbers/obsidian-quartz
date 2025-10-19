---
cssclasses:
aliases:
  - statistical test
permalink: stats/hypothesis-testing
publish: true
"date:": "[[2024-09-10]]"
link:
tags:
parent: "[[statistics]]"
source:
related:
  - "[[t-test]]"
created: 2024/09/10
updated: 2025/07/04
---
%%
date:: [[2024-09-10]]
parent:: [[statistics]]
source::
related:: [[t-test]]
tags::
%%
# [[hypothesis testing]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Definitions
- Hypotheses
	- H0: no difference between groups, they are equal; ==ALWAYS test for EQUALITY!==
	- H1: they are different
		- Not possible to prove H0, the conclusion can be either **H0 rejected (H1 is accepted)** or **H0 can't be rejected (doesn't mean H0 is true)**
- [[significance level]] $\alpha$, e,g, *0.05* or *0.001*
	- % of time MDC is found, assuming it doesn't exist; chance of wrongly rejecting H0;
	- defines the $\alpha$-risk ([[type 1 error]]): probability of wrongly rejecting H0. [[false positive rate]]
- Minimum Detectable Change (MDC) - smallest effect that can be measured, given [[significance level]] and [[effect power]].
	- For instance, one percent change in click-through rate.
- Sample sizes: how big the control and treatment group should be in order to detect the effect with given [[significance level]].
- [[p-value]]: the prob that the given sample is coming from a population assuming H0
	- If P is low --> H0 has to go! (if P is high -> H0 can't be rejected)
- $\beta$-risk ([[type 2 error]]): risk of falsely NOT rejecting H0, [[false negative rate]]
- [[effect power]] $\beta$
	- the likelihood of detecting the MDC if it is there; % of time MDC is found assuming it exists; prob of rejecting H0, that is correctly accepting the H1
	- power impact
		- power UP --> bigger distance between the sample and H0 --> H0 more easily rejectable
		- sample size UP --> power increases
		- $\alpha$-risk ($1-confidence level$) UP --> power increases
		- distance(H0-population) UP --> power increases
		- $\beta$-risk ($1-power$) UP --> power decreases
		- std of the process UP --> power decreases

## Note
- Statistical tests
	- ![[Pasted image 20240910191954.png|600]]
## Resources
- [[karpov courses]]
- [[Design for Six Sigma]]

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
