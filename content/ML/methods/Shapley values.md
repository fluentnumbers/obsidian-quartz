---
permalink: ML/SHAP
cssclasses:
aliases:
  - SHAP
  - Shapley
publish: true
link:
tags:
parent: "[[explainable AI|feature importance]]"
source:
related:
  - "[[LIME]]"
  - "[[ML methods]]"
created: 2023/10/29
updated: 2025/08/20
---
%%
date:: [[2023-10-29]]
parent:: [[explainable AI|feature importance]]
related:: [[ML methods]] [[LIME]]
source::
tags::
%%
# [[Shapley values]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- [[LIME]] is less robust to small input changes
- **SHAP are needed to benchmark the model against prior knowledge and common sense**
- sharply values can only tell us how the model makes decisions, but not about how the world is functioning or which buttons we need to press to change this world
- This approach Was inherited from the game Siri and answer the questions how to distribute limited resources among players
![[Pasted image 20231029112543.png|500]]
- [[feature importance]] is prone to the order in which this and other features appeared. To calculate shapely value for one feature We need to take all combinations of features, for each one subtract Subtract the case which was just before this feature appearing to in the model, and take the average of all subtractions
	- In the example above we have three employees of a company and one to compute their Shap values that is important to the company profit. As an example for a blue employee we compute all possible combinations when he joined the company minus minus a state just before he joined the company and average it was equal weight
- As it is not possible to just remove a feature from a data set because the model was train with full future set, usually the test is feature value is substituted According to some rule and shapely value tool boxes have different strategies
![[Pasted image 20231029112248.png|500]]
- default sharply values fulfil these properties, But there are modifications where for instance researchers claim that not all feature combinations are possible or equally valuable therefore different combinations can be assigned weights up to zero to remove impossible combinations
	- to use asymmetric SHAP values one can claim that for instance some features are given prior to some others. like gender and race can should always come before income for credit score ratings for instance if you compare them
	- causal Shapley values
- application:
	- epilepsy data, classify time series into either calm state or seizure - asymmetric SHAP values are more powerful distributed and regular shapely values are just noise

## Resource
- [Shapley Values: Unlocking Intuition with Venn Diagrams | by Carson L | Medium](https://medium.com/@carson.loughridge/shapley-values-unlocking-intuition-with-venn-diagrams-86e76d8c99c5)
- [Ольга Филиппова: Causality and Shapley Values - YouTube](https://www.youtube.com/watch?v=rrreuktS0gk)
---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
