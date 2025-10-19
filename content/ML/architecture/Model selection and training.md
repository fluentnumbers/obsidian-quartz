---
permalink: 
cssclasses:
aliases:
publish: true
link:
tags:
parent: "[[ML system design]]"
source:
  - "[[ODS]]"
related:
created: 2024/01/20
updated: 2025/09/26
---
%%
date:: [[2023-10-29]]
parent:: [[ML system design]]
source::
tags::
%%
# [[Model selection and training]]

- good model is the one that works for you
- start with a simple model in algorithmic sense
	- easier to deploy and build MVP around to test input outputs and catch rookie mistakes
	- serves as a baseline
	- state-of-the-art solution may not work in production because there might be no ready to use libraries it may need specific data, big data or may not work at all
- remember about assumptions [[ML algorithms advantages and disadvantages]]
	- linear models: [[homoscedasticity]], detect trends, but not complex patterns
	- [[convolutional network]]: locality, invariant to linear transformations
	- [[Markov chain]]: no memory
	- [[clustering]]: metrics for locality and distance
	- [[decision tree]]:
- experiment with hyperparameters and architectures, track results, study [[loss function]]
	- [[MLflow]] + [[Optuna]], [[tensorboard]]
	- [[AutoML]]
	- find pitfalls and fix
		- overfit a simple model, check data dimensionality, visualize gradients, change [[learning rate]], let training run for longer
- compromise
	- precision vs recall
	- quality vs deploy complexity, computational resources, inference delay, costs, security against additive-noise-attacks, compliance, reliability
- join models
	 - ready to use ensembles [[boosting|gradient boosting]] and [[random forest]]
	 - stacking of weak independent algorithms (may not always be good)
	 - stacking of one weak and one strong model (linear and XGB) with different error structure
- finetune hyperparameters
	 - Auto-Pytorch, Auto-sklearn, AUTOML Book
- validation
	- against baseline, most popular class, simple heuristics, human label, state-of-the-art
	- perturbation test against noise
	- invariant test: what SHOULD NOT change the prediction (gender-->hiring decision)
	- directed expectations test: what SHOULD affect the prediction (age-->health)
	- [[Simpsons paradox]]?

# Resources
[Model Evaluation, Model Selection, and Algorithm Selection in Machine Learning](https://arxiv.org/pdf/1811.12808.pdf)
[A Recipe for Training Neural Networks](http://karpathy.github.io/2019/04/25/recipe/)
