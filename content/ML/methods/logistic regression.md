---
cssclasses: 
aliases: 
permalink: ML/logistic-regression
publish: "true"
"date:": "[[2025-01-02]]"
link: 
tags: 
parent: "[[classification]]"
source: 
related:
  - "[[softmax]]"
  - "[[regression]]"
created: 2025/01/02
updated: 2025/05/01
---
%%
date:: [[2025-01-02]]
parent:: [[classification]]
source::
related:: [[softmax]] [[regression]]
tags::
%%
# [[logistic regression]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Contents

- [[#Note|Note]]
- [[#Intuition and connection to linear regression|Intuition and connection to linear regression]]
- [[#Derivation of the cross-entropy loss function|Derivation of the cross-entropy loss function]] ^24e9ff
- [[#Cross-entropy minimization|Cross-entropy minimization]]
- [[#Resources|Resources]]

## Note
- Logistic regression is a **linear** model that solves a [[classification]] problem using the [[softmax]] function, which outputs discrete probability values for each class (not a class label itself)
- In such view, even the modern neural networks can be seen as sophisticated algorithms generating advanced characteristics to which logistic regression is then applied as one of the last layers.
- Being a linear model, it allows [[explainable AI|interpretability]]
	- weights matrix W of the model reveals which characteristics of input $\vec x$ are decisive for each class attribution

## Intuition and connection to linear regression
- One can see the task of [[classification]] into K classes as K linear [[regression]] Z_i to Z_k where each one is **predicting the probability of belonging to the i-th class**.
![[Pasted image 20250102121410.png|500]]
![[Pasted image 20250102121651.png|500]]
![[Pasted image 20250102122008.png|500]]
- The challenge is two-fold:
	- how to make regression predict the probability?
	- if the selected [[loss function]] (see derivation [[#Derivation of the cross-entropy loss function|below]]) is boolean-output (specific class label), its partial derivatives will be 0 as the output class is not changing when the input vectors are changed by infinitely small values (like [[gradient descent]] would need). Therefore, we don't want it to output classes directly.
- if we can find a *wrapping* function $f$ such that $f(\vec Z)$ is a confidence\probability value which is the input of the loss function
	- the 1st issue is solved by design
	- The loss function is now dependent not on the class itself, but on the probability of that class, which in turn can change due to infinitely small change in input values. --> Partial [[derivatives]] are not 0.

![[Pasted image 20250102123030.png|500]]

- Which characteristic should the function f possess to satisfy our needs?
	- all components $f_i$ are non-negative
	- all components $f_i$ are summed to 1
	- if $z_i > z_j$ then $f_i(\vec z) > f_j(\vec z)$
	- Partial derivatives of any component by any of the learnable parameters not equal to 0: $\frac{df_i}{dw_{kl}} \not= 0$

 ![[Pasted image 20250102123608.png|500]]
 - Such a function satisfying all requirements exists and it's called [[softmax]] ^027f8a

![[Pasted image 20250102123908.png|500]]
- As a result, the logistic regression algorithm is nothing else than $y(\vec x, \theta) = softmax(W \vec x + \vec b)$, where $\theta$ is our set of trainable parameters $W\vec b$
	- $y_i$ states the algorithm's opinion about the probability that the object described by $\vec x$ belongs to class $i$

## Derivation of the cross-entropy loss function
- Our algorithm is $y(\vec x, \theta) = softmax(W \vec x + \vec b)$
- Referring to the [[maximum likelihood]] principle, we want that the reality we actually observe is perceived as highly likely by our algorithm and something we don't observe in reality also has low probability according to the algorithm
- Ideally, we want to train the algorithm in such a way that ==for each== $\vec x_i$ in our dataset there is a corresponding class label $t_i$.
	- For one particular $\vec x_i$ the probability of this happening is $y_{t_i}(\vec x_i,\theta)$
	- For this to happen for all dataset objects (assuming all objects are independently sampled) this is a joint probability

![[Pasted image 20250102130317.png|500]]
- This joint probability we want to maximize. We can already take -log() of the expression and minimize it, but, conventionally, some further modifications are made to come to the [[#^d51a92|cross-entropy]] function.

![[Pasted image 20250102132258.png|500]]

- The modification uses the insight that class label $t_i$ is essentially a vector $\vec t_i$ consisting of a single 1 and the rest 0 ([one hot encoding])

![[Pasted image 20250102130822.png|500]]
- With this vector in place, the previous can be rewritten: Iterating over <font color="#548dd4">all components of the one hot encoded vector</font>, we multiply <font color="#76923c">all softmax outputs</font> <font color="#e36c09">to the power of the corresponding component of one hot encoding vector</font>.

![[Pasted image 20250102130938.png|500]]
- All one hot encoding components but one are 0. Anything to the power of 0 is 1, therefore in the multiplication above all but one components are 1. That only non-1 component corresponds to the correct class yielding:

![[Pasted image 20250102131900.png|500]]
- this formulation for $y_{t_i}$ can be fed back into the max likelihood formula above:

![[Pasted image 20250102132432.png|500]]
- Further, for easier optimization, *summation* is preferred to *multiplication*, so we take a $log()$ of that with the minus sign (to make it a minimization task for traditions sake).
- In the result we derived the [[cross-entropy]] [[loss function]] suitable for [[classification]] tasks: ^d51a92

![[Pasted image 20250102133311.png|500]]

- [[class disbalance]] has negative effect, because the cross-entropy formula contains iteration over every training sample from 1 to N. Overrepresented class will have a larger impact on the loss function value and the algorithm will prioritize correct classification of that one

## Cross-entropy minimization
- Unlike for linear regression where it was possible to solve the system of equations directly, here it's not possible to do without the iterative [[gradient descent]].
	- don't forget data [[normalization]] to the range from -1 to 1

## Resources
- [Логистическая регрессия. Лекция 8. - YouTube](https://www.youtube.com/watch?v=Zfbo9TFfEgQ&list=PL6-BrcpR2C5Q1ivGTQcglILJG6odT2oCY&index=8)

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
