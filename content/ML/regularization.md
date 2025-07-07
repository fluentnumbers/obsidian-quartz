---
permalink: ML/regularization
cssclasses: 
aliases:
  - regularization methods
publish: "true"
link: 
tags: 
parent: "[[Machine Learning MoC|ML]]"
source: 
related: 
created: 2024/01/20
updated: 2025/06/18
---
%%
date:: [[2023-10-29]]
parent:: [[Machine Learning MoC|ML]]
related::
source::
tags::
%%
# [[regularization]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Contents

- [[#Note|Note]]
- [[#Regularization for shallow models|Regularization for shallow models]]
	- [[#Regularization for shallow models#Methods|Methods]]
		- [[#Methods#Lasso (L1)|Lasso (L1)]]
		- [[#Methods#Ridge|Ridge]]
		- [[#Methods#ElasticNet|ElasticNet]]
- [[#Regularization for deep neural networks|Regularization for deep neural networks]]
- [[#Resources|Resources]]

## Note
- regularization is used to regulate model complexity and help fight [[overfitting]] or [[multicollinearity]]
- it leads to increasing the error on the **training set** and decreasing the error on the validation set
- there are methods, which <font color="#00b050">modify the [[loss function]]</font> and the ones, which modify data like [[data augmentation]]

## Regularization for shallow models
- [[normalization]] is required for most algorithms

### Methods
[[regularization exc.excalidraw#^group=MP9PVHo5T4IVp6sDvHxof]]
![[regularization exc.excalidraw.svg|500]]
- λ is a [[hyperparameters|hyperparameter]] and needs to be adjusted from experiments
- Minimizing the sum of two functions
#### Lasso (L1)
- [[Lasso]] (L1) - punishes non-zero coefficients --> some coefficients go to 0

#### Ridge
- [[Ridge]] (L2) - punishes large coefficients --> makes model robust to small changes in input data, well differentiable
 - Minimization task becomes a sum of the loss function and the squared weights:
![[Pasted image 20241205193004.png|500]]

- Minimizing the above yields the solution for weights **w**:
![[Pasted image 20241205194219.png|500]]

#### ElasticNet
- [[ElasticNet]] (L1+L2)

## Regularization for deep neural networks
- [[data augmentation]]
- [[dropout]]
- [[weight decay]]
- [[label smoothing]]
- [[normalization]]
	- [[batch normalization]]
	- [[layer normalization]]
	- [[weight normalization]]

## Resources
- [Знакомьтесь, линейные модели / Хабр](https://habr.com/ru/articles/278513/)
> [!NOTE]- Cheat sheet
> ![[1_KBU0hPg94w2TLa1SUgrAEg.webp|650]]
