---
cssclasses: 
aliases:
  - shortcut connection
  - residual connection
permalink: DL/skip-connection
publish: "true"
"date:": "[[2024-08-13]]"
link: 
tags: 
parent: "[[neural network architecture]]"
source: 
related:
  - "[[ResNet]]"
  - "[[transformer]]"
created: 2024/08/13
updated: 2025/06/18
---
%%
date:: [[2024-08-13]]
parent:: [[neural network architecture]]
source::
related:: [[ResNet]] [[transformer]]
tags::
%%
# [[skip connection]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Contents

- [[#Note|Note]]
	- [[#Note#Reasoning|Reasoning]]
	- [[#Note#How|How]]
	- [[#Note#Result|Result]]
	- [[#Note#Advantages|Advantages]]
- [[#Resources|Resources]]

## Note
- Introduced for the original [[ResNet]]
### Reasoning
- A tensor comes in, and the layer does some processing to change that tensor. If the layer only needs to change the input by small amounts, or only in some places, then it would be wasteful to expend resources processing the parts of the tensor that don’t need to change.
- Allows training very deep networks
- Also see [[training degradation]]:
> [!NOTE]- [[training degradation]]
> ![[training degradation#Notes]]

### How
- Residual connections propagate the inputs to the output of one or more layers. This has the effect of making the optimization procedure easier to learn and also helps deal with [[vanishing gradients]] and [[exploding gradients]].
- ![[Pasted image 20240813175853.png|500]]
- The skip connection works because each layer is trying to reduce its own contribution to the final error, while participating in the network made up of all the other layers. The skip connection is part of the network, so the layer learns it doesn’t need to process the parts of the tensor that don’t change. This makes the layer’s job simpler, enabling it to be smaller and faster.
- ![[Pasted image 20240813183246.png|500]]

### Result
- there are more shorter paths, than longer paths. During [[backpropagation]] the gradients with the highest magnitude take shorter paths on average than the gradients with lower magnitude. That is, most of the training is happening through shorter paths.
	- on practice, path length our training info goes through is shorter by 2
- representations change slowly, there is less differences in parameters on two sides of each layer.
	- dropping single layers on networks with [[skip connection]] has lesser effect than on networks without those
- loss function surface becomes smoother and easier to optimize

### Advantages
- Makes layers that are smaller and faster, and it even improves the flow of gradients in backpropagation, which lets us efficiently train networks of dozens or even hundreds of layers
- weights evolve slowly --> good for interpretations
- applied in advanced architectures like [[transformer]] and [[ResNet]]-architecture family
- [[transformer]] use skip connections not just for efficiency and speed, but also because they allow the transformer to cleverly keep track of the location of each element in its input.
## Resources
- [\[1512.03385\] Deep Residual Learning for Image Recognition](https://arxiv.org/abs/1512.03385) - the main\first paper
- [ Modern Deep Learning (2023). Лекция 10. Skip Connections ](https://www.youtube.com/live/5YPRbHYB5ME?si=QNoOLn59Jykbkxax)

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
