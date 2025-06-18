---
cssclasses: 
aliases:
  - residual networks
  - ResNext
permalink: ML-CV/residual-networks
publish: true
"date:": "[[2025-06-18]]"
link: 
tags: 
parent: "[[computer vision]]"
source: 
related: 
created: 2025/06/18
updated: 2025/06/18
---
%%
date:: [[2025-06-18]]
parent:: [[computer vision]]
source::
related::
tags::
%%
# [[ResNet]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Contents

- [[#Note|Note]]
- [[#Example: ResNet-34|Example: ResNet-34]]
- [[#Comparison of ResNet networks|Comparison of ResNet networks]]
- [[#Analysis|Analysis]]
	- [[#Analysis#Bag of Tricks|Bag of Tricks]]
- [[#Resources|Resources]]

## Note
- family of network architectures with advancing architectures ([[ResNet|ResNext]] and others) and different number of layers (ResNet-18, ResNet-34, ResNet-50, ResNet-101, and ResNet-152)
- dominated [[computer vision]] architecture before the [[vision transformer]] appeared, still remains the go-to solution when solving a standard well-known problem or prototyping
- The [original paper](https://arxiv.org/abs/1512.03385) proposed a number of groundbreaking architectural solutions such as [[skip connection]]

## Example: ResNet-34
![[Pasted image 20250618083357.png|800]]
- 4 blocks of [[convolutional network|convolution]] layers with [[skip connection]] every two layers
- First skip connection in the beginning of each block of layers creates a problem due to the increasing number of layers between blocks: when skipping a convolution output from 3x3x64 needs to be summed with 3x3x128 of the next convo after the skip connection. Such mismatches denoted with a *dashed* skip connection line.
	- One widespread solution for this is a ==1x1xR convolution with stride 2==
	- ![[Pasted image 20250618085949.png|400]]
- ==Full pre-activation== with [[ReLU]] - order of [[batch normalization]], [[activation function|activation]] and convolution (weights) which yielded best ==experimental== results.
![[Pasted image 20250618092110.png|700]]
- [[pooling layer|global average pooling]] before the last [[classification]] head reduces the number of parameters by averaging each output filter map to one number: 7x7x512 becomes just 1x512 and eliminates most of the connections to the fully-connected layer. This was another difference to the [[VGG]] architectures of the past (which had 90% of trainable parameters in fully connected layers), *affordable* in terms of quality due to the fact that much deeper ResNet networks produced higher quality output features.
- ![[Pasted image 20250618091401.png|400]]

## Comparison of ResNet networks
![[Pasted image 20250618091623.png|800]]

## Analysis
### Bag of Tricks
- [Bag of Tricks for Image Classification with Convolutional Neural Networks](https://arxiv.org/abs/1812.01187)
	- Model tweaks
	- Linear scaling learning rate
	- [[learning rate]] warm up
	- Cosine learning rate decay
	- Zero gamma
	- No bias decay
	- MixUp training
## Resources
- [Deep Residual Learning for Image Recognition](https://arxiv.org/abs/1512.03385)
- [Residual Networks Behave Like Ensembles of Relatively Shallow Networks](https://arxiv.org/abs/1605.06431)

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
