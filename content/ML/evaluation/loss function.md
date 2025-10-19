---
permalink: ML/loss
cssclasses: 
aliases:
  - loss
  - cost function
publish: true
link: 
tags: 
parent: "[[Machine Learning MoC]]"
source: 
related:
  - "[[Machine Learning MoC]]"
created: 2024/01/20
updated: 2025/09/27
---
%%
date:: [[2023-10-29]]
parent:: [[Machine Learning MoC]]
source::
tags::
%%
# [[loss function]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Definition
- The loss function measures how closely the model’s predictions align with the desired outcomes. It guides the optimization process, where the goal is to minimize this loss. Choosing the right loss function is crucial during model training, as it quantifies prediction errors and helps the optimization algorithm adjust the model’s parameters to improve performance. (from [[Generative AI System Design Interview - Chapter 1 - Introduction and Overview]])
- The loss function, also known as the objective or cost function, effectively defines how a model learns about the world and connections between dependent and independent variables, what it pays most attention to, what it tries to avoid and what it considers acceptable. Thus, the choice of a loss function can drastically affect your model's overall performance, even if everything else—features, target, model architecture, dataset size—remains unchanged. 
- See also [[ML metric]]
- ![[Pasted image 20231028195917.png|700]]
## Note
### Requirements
- Be globally continuous (changes in predictions lead to changes in losses).
- Be differentiable (its gradient can be calculated).

### Other
- sensibility to large errors and therefore outliers can be an advantage and disadvantage
- Not squared lost functions such as mean absolute error are more intuitive to interpret

## Examples
### Regression
- [[Mean Squared Error]]
- [[Mean Absolute Error]]
- [[Huber loss]]: A combination of MSE and MAE that provides a compromise between the advantages and disadvantages of both.
### Classification
- [[cross-entropy]] (Log-loss)
- binary [[cross-entropy]] (BCE)
- [[Hinge loss]]
- 
- [[triplet loss]]
- [[contrastive loss]]

## Resources
- [Валерий Бабушкин - Метрики и функции потерь при дизайне систем машинного обучения](https://youtu.be/vnmLq3AUza0)

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png") AND !contains(string(x), ".webp") AND !contains(string(x), ".jpeg")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
