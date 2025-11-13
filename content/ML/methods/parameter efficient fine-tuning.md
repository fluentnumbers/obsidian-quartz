---
cssclasses:
aliases:
- PEFT
permalink: ML/peft
publish: true
"date:": "[[2025-10-25]]"
link:
tags:
parent: "[[fine-tuning|finetuning]]"
source:
related:
created: 2025/10/25
updated: 2025/10/25
---
%%
date:: [[2025-10-25]]
parent:: [[fine-tuning]]
source::
related::
tags::
%%
# [[parameter efficient fine-tuning]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Contents

- [[#Note|Note]]
	- [[#Note#Adapters|Adapters]]
	- [[#Note#LoRA|LoRA]]
	- [[#Note#Prompt Tuning|Prompt Tuning]]
	- [[#Note#Activation scalers|Activation scalers]]
	- [[#Note#bias-only|bias-only]]
	- [[#Note#Sparse weight deltas|Sparse weight deltas]]
- [[#Resources|Resources]]

## Note
- ![[Pasted image 20251025212815.png|700]]
from [Scaling Down to Scale Up: A Guide to Parameter-Efficient Fine-Tuning](https://arxiv.org/abs/2303.15647)
## Methods

### Adapters
- Add a small trainable module inside each transformer layer. These are separate from the layers, unlike in [[LoRA]]
![[Pasted image 20251025211316.png|500]]
from [Parameter-Efficient Transfer Learning for NLP](https://arxiv.org/abs/1902.00751)
### LoRA
![[LoRA#Note]]

### Prompt Tuning
- Learn extra embeddings, virtual tokens, instead of inserting new subnetworks.

### Activation scalers
- Add three scaling vectors per layer
### bias-only
- Fine-tune existing bias terms. No new parameters are inserted.

### Sparse weight deltas
- Learn a sparse mask of weight differences on top of the frozen weights.

## Resources
- [Parameter-Efficient Transfer Learning for NLP](https://arxiv.org/abs/1902.00751)
- [PEFT](https://huggingface.co/docs/peft/en/index)
- [[Learn by Doing. Become an AI Engineer]]

---

![[base - related.base]]

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
