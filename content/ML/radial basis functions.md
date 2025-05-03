---
cssclasses:
aliases:
  - RBF
permalink: note/radial-basis-functions
publish: true
"date:": "[[2024-12-21]]"
link: 
tags: 
parent: "[[Machine Learning MoC]]"
source: 
related:
created: 2024/12/21
updated: 2025/05/01
---
%%
date:: [[2024-12-21]]
parent::
source::
related::
tags::
%%
# [[radial basis functions]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Contents

- [[#Note|Note]]
- [[#Gaussian RBF|Gaussian RBF]]
- [[#RBF-based neural networks|RBF-based neural networks]]
- [[#Resources|Resources]]

## Note
- any basis function are used to transform dataset features and amend the [[design matrix]]
- other (non-radial) basis functions examples: [[polynomial]], [[Fourier]], etc.
![[Pasted image 20241221112647.png|500]]
- *the locality principle* - the general idea of **shallow** [[Machine Learning MoC|ML]] is that training set elements located nearby and having relatively short distance between each other should have the same label and belong to the same class. Deep learning is not based on this principle, because of the huge dimentionality of input vectors.
- each [[RBF]] creates a new feature, which value is dependent on the **distance** between each sample and some *center* point
- ==RBF facilitates **non-linearity**== in predictive models
## Gaussian RBF
![[Pasted image 20241221104625.png|600]]
- reminds the [[normal distribution]] probability density function
- when $x_i==c_j$ --> $φ_j==1$
	- the more closer x is to the chosen center, the closer the RBF value is to 1
	- when distance is growing φ goes to 0
	- it doesn't have the notion of *direction*, the distance is scalar and all points on a circle are seen similarly for one RBF, that's why we need more of them
- RBF centers are usually picked up randomly and uniformly from training set samples ensuring that *clusters* with more data points get more RBF centers around

![[Pasted image 20241221111302.png|500]]

- as in the picture above with 3 RBF centers, RBF breaks linearity of the model
	- same feature vector change by $\Delta x$ for two samples $x1 -> x1 + \Delta x$ and $x2 -> x2 + \Delta x$ will not lead to the same target prediction change, given that the data points have different distances to the chosen centers
- [[hyperparameters]] are the **number of centers** and the **width** (or bandwidth)
	- the optimal number of centers is dependent on data locality: the more *clusters* there are in the data, the more center points are needed
	- generally speaking, the more centers, the less bandwidth, because ==all the [[normal distribution|Gaussians]] collectively need to *cover* complete feature space==

## RBF-based neural networks
-

## Resources
- [Radial Basis Functions: Types, Advantages, and Use Cases | HackerNoon](https://hackernoon.com/radial-basis-functions-types-advantages-and-use-cases)
- Implementation from [[AI school razinkov.ai]]: [schoolrazinkovai/linear-regression-solution-fluentnumbers](https://github.com/schoolrazinkovai/linear-regression-solution-fluentnumbers/blob/main/model/basis_function_processor.py)

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
