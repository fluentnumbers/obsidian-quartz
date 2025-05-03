---
cssclasses:
aliases: 
permalink: book/deep-learning-andrew-glassner
"date:": "[[2024-08-05]]"
link: 
tags:
  - 📚Book
title: Deep Learning
subtitle: A Visual Approach
author:
  - Andrew Glassner
category:
  - Computers
publisher: No Starch Press
publish: "true"
total: 1239
isbn: 1718500734 9781718500730
cover: http://books.google.com/books/content?id=NgTyDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api
status: read
rating: 9.5
parent: "[[book]]"
source: 
related:
  - "[[deep learning]]"
created: 2024/08/05
updated: 2025/05/01
---

%%
date:: [[2024-08-05]]
parent:: [[book]]
source::
related::
tags::
%%
# [[Deep Learning - Andrew Glassner]]

![[Deep Learning - Andrew Glassner.jpg|150]]

## Deep Learning

### The basics
- Interestingly, that [[deep learning]] gets its name deep from the fact how the multi-layered networks are being drawn and take several layers. It has nothing to do with some specific deep understanding or deep insight processing of the input data. But even then, most of the drawings depict the networks horizontally so they must be called wide learning then and not deep learning.
- The legend behind the word marginal, as in marginal probability, comes from books that contain tables of pre-computed probabilities and the idea is that these pre-computed probabilities were summed up row-wise or column-wise of these tables, and the result was written on the margins of the page.
- The mean value of [[normal distribution]] is the highest point of the bell curve, the most likely outcome of drawing a number from the distribution, as well as median and mode at the same time.
- Standard deviation of the normal distribution is also a number which describes the width of the bell curve. If we start at the mean and start moving symmetrically in both directions and calculate area under the curve, so once we reach 68% of the total area under the bell curve, that's our one standard deviation.
- [[bootstrapping]] provides a way to calculate confidence intervals for statistical measures such as mean or standard deviation. First we draw a sample from a population without replacement, then from this sample we draw a number of bootstraps with replacement. And if we draw distribution of the bootstrap means, so the mean of that distribution will be close to the mean of the true population. This is a consequence of the [[Central Limit Theorem]]. Then to find confidence intervals we need to look at this histogram of bootstrap means and knowing how much confidence we want to have, like 80% or 90%, 95%, we need to find the boundaries containing so many percent of our bootstrap values. and then we can claim that the mean of the initial distribution population is located within these boundaries with a confidence of 90%.

- Both [[covariance]] and [[correlation]] determine the strength of relationships between several variables. Correlation can be more useful, practical, because it doesn't depend on the size of the numbers involved. It's basically a scaled covariance. It doesn't make sense to compare two covariance because the units are not comparable. You can only say something about the sign, positive, negative, or there is no covariance, so zero.
	-  A strong positive covariance tells us that if the two variables move together and every time one of them changes by a given amount, the other one changes by a consistent predictable amount, but not necessarily the same.

- the [[frequentist]] versus the [[Bayesian]] approach. The Frequentist believes that there is a exact true value that we are trying to measure and each measurement is just an imprecise approximation of this true value. Like if we measure a mountain many times, every time we get a value, a different one and it is never the exact true value that we are actually trying to measure. The measurement which pops up the most frequently is considered the one that is most probable.
	- Now, the Bayesian person is the one who trusts every observation as an accurate measure of something, but every time we are measuring a different something, the main belief is that there is no true value waiting to be found at the end of the process. There's only a probability distribution that can be attached to something that we want to measure. So, if we measure height of a mountain, we are not trying to get one exact number, but a range of possible heights for the mountain, each described by a probability. And as we take more measurements, this range of possibilities generally becomes more narrow, but it never shrinks to a single value. So we can never state the height of the mountain as a number, but only as a range.
	- The bias rule can run in the loop each time improving our estimate of the posterior. So initially, we know the conditional probability and the evidence. In order to estimate the posterior we need to come up with a guess for the prior. After we have done that, we can calculate the posterior and now comes the trick - as we already know that the event happened, so we know the evidence and our posterior then becomes our next prior for the next loop iteration.

- During training of a deep learning algorithm, we try to find a minimum of an error which can be seen as a multidimensional surface with local minima and maxima. The problem of [[vanishing gradients]] means that we are stuck in a place where there is a gradient is equal to zero.
- [[entropy]] is a measure of uncertainty, it is the maximum when all outcomes are equally probable but it is zero when there is only one outcome or it has maximum probability. In [[deep learning]] context we often want to compare two [[probability distribution]] and for that purpose we use the quantity called [[cross-entropy]] which is a number which shows two probability distributions difference. When training a classifier we often want to compare our predicted probability distribution over a number of labels versus manually labeled probability distribution (which often only includes a single label).

- [[curse of dimensionality]]. If we have only a few data points to build a classifier, then there are many potentially good separating curves or separating boundaries. So to pick one, which is actually the best one, we need more information that is more features. So if we add more features and increase the dimensionality, the density again becomes less. So we again need more samples for choosing the right separation boundary.

- [[decision trees]] can use several techniques to evaluate split results internally. One of them is [[information gain]] which is based on the entropy concept that is comparing the [[entropy]] of the source node to the sum of the entropies to all the nodes after the split and trying to maximize this difference so that the sum of the entropies of the outcoming nodes is less than the source node. Another method is Gini impurity which is based on the idea to choose a split with the least chance of erroneous classification. So for each sample processed the decision tree calculates probability of misclassifying this sample.
- The [[random forest]] technique is an extension of [[bagging]] idea. It creates a set of different decision trees which are then used to make a [[classification]]. The idea is to make trees which are meaningfully different and not the same. To achieve this, at every node split, for every tree, we are not using a full set of features and samples to make a decision for the best split. But we randomly select a subset of features and samples so that maybe every tree becomes a bit suboptimal, but they are very different. And if there are many trees, the better result classification is achieved.

### [[deep learning]]
- The original perceptron tested the sum of all incoming inputs against the hard threshold outputting either 1 or minus 1. Contemporary neurons used in neural networks are using so-called [[activation function]] which are more complex than hard threshold and produce a floating point number. Activation functions are used to prevent an arbitrary big neural network to collapse into equivalent single perceptron, or in other words, a linear function. All activation functions provide non-linearity to the system. We need many of them because some functions can run into numerical troubles or making training process more slowly or seize it all together.
- rectified linear unit is a piecewise linear activation function. The name comes from an electronic part called a rectifier which can be used to prevent negative voltages from passing from one part of a circuit to another. The problem with the basic [[ReLU]] function appears when input changes only within the negative range and therefore the output is always zero. This is how the modification of ReLU came up such as leaky ReLU or shifted ReLU, noisy ReLU.
	- If the input is a large negative value and then it changes by a small amount it still results in a negative number and the output of basic ReLU will stay unchanged at zero. This means that the derivative is also zero and if the derivative is zero the neuron stops learning and makes it more likely that other neurons in the network will stop learning as well.
- There are smooth variations of piecewise linear functions such as softplus, exponential ReLU, swish. All of them fix the issue of a missing derivative in at least one point of the piecewise linear function. Piecewise linear functions can still be used with some mathematical patching to get the derivative for the whole range of the function.
- Another set of smooth activation functions squash infinite input range into a small range of output values. Such functions are [[sigmoid]], which is a smoothed step function, but also hyperbolic tangent function (tanh), sine wave function.
- strictly speaking [[softmax]] is not an activation function because it operates on all outputs together not on each neuron separately. In practice it is only applied to the output layer in case of multi-class classification problems. The inputs of Softmax are the scores. They indicate which classes are more or less probable for given inputs but comparing these scores is not possible. So the Softmax produces probabilities from these scores which are all sum to one and all have values somewhere in the range of from zero to one. If one score is twice as big as another score it doesn't mean that the first class is more twice as probable as the second class. It just says that class A is more likely. Softmax exaggerates the influence of the output with the largest value. Sometimes it crushes the other values making the largest one dominate the others more obviously. It has different behavior depending on whether the input values are all less than one all greater than one or mixed but the ordering of the inputs always preserved in the output probabilities.

- Batch [[gradient descent]] produces a smooth error curve because it updates weights after each training epoch, not after each sample. But if we have more samples that can fit in our computer memory, then there is paging problem that is retrieving data from storage medium that can take substantial enough time to make training impractically slow.
- Another extreme is the stochastic gradient descent, SGD, which means changing the weights after every sample. This results in a much noisier error plot, even if it's plotted per epoch and not per sample. But the training usually takes less epochs than the batch gradient descent. The number of gradient updates, though, can be bigger.
- The mini-batch gradient descent algorithm is the middle ground between the two. The number of samples inside the mini-batch is usually chosen so that the capabilities of GPU cards are used fully. The resulting error curve is less noisy than SGD and it is faster than the batch gradient descent

- [[batch normalization]] is also a regularization technique that modifies the values which come out of a layer. It shifts and scales all the outputs to a certain range, which is the most impactful for the activation function. For most functions, like ReLU, it is a range around 0. Because all outputs fit into a smaller range near 0, the system is less prone to seeing any neuron learning one specific detail and producing a huge output, which will swamp all other neurons.
- [[pooling]] or downsampling is a technique that blurs the image in order to account for imperfections and image features that we might be looking for in convolutional neural networks. Pooling is especially effective when used in between several [[convolutional network|convolution]] layers because if the first layer did not find the features it expected at places where it expected them then the pooling can help the next filter still finding those features.Pooling allows convolutions to be translationary invariant or shift invariant.

- [[variational autoencoder]] is a special type of [[autoencoder]]. It also compresses the input sequence into the latent variable space, which can then reconstruct it back to the input domain with a reasonable resemblance of input values. Though the name variational hints that the same input fed through the network several times does not always produce exactly the same result. Variational autoencoder also helps achieving three properties that we can impose on latent variables. First, we want that latent variables are gathered into one region of latent space, so that we know the ranges for random values. Second, latent variables that are produced by similar input should be clumped together in the latent space. Thirdly, we want to minimize empty regions in the latent space and make distinction between different clusters clearer.

-  [[attention]] and [[attention|self-attention]]

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
