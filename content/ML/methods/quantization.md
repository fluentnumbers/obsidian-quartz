---
cssclasses:
aliases:
  - model quantization
permalink: note/quantization
publish: "true"
"date:": "[[2024-09-07]]"
link: 
tags: 
parent: "[[inference optimization]]"
source: 
related: "[[LoRA]]"
created: 2024/09/07
updated: 2025/05/05
---
%%
date:: [[2024-09-07]]
parent:: [[inference optimization]]
source::
related:: [[LoRA]]
tags::
%%
# [[quantization]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- Quantization is the process of decreasing the numerical precision in which weights and activations are stored, transferred and operated upon. The default representation of weights and activations is usually 32 bits floating numbers, with quantization we can drop the precision to 8 or even 4 bit integers, effectively "scaling down" the granularity and mapping a larger original range of values to a smaller set of discreet levels.
- In the figure, the original *float7* (purple dots) are mapped to **the closest** *float5* value (green dots) after quantization resulting in lower granularity. This approximation process reduces the number of unique values the model uses, compressing the model while retaining a reasonable level of accuracy.
![[3.10.3.png|600]]
- In cases where quantization might introduce a quality regression, that regression can be small compared to the performance gain, therefore allowing for an effective quality vs [[latency]]/[[throughput]] tradeoff.
- can be either applied as an inference-only operation ([[#Post-training quantization (PTQ)]]), or it can be incorporated into the training - referred to as [[#Quantization-aware training (QAT)]].
	- QAT is generally considered to be a more resilient approach as the model is able to recover some of the quantisation-related quality losses during training
- For the best cost-quality trade-offs, one can tweak quantization strategy by selecting different precisions for weights and activations, and also the granularity in which the quantization is applied to tensors, such as channel or group-wise.
	- [\[2310.04836\] Dual Grained Quantization: Efficient Fine-Grained Quantization for LLM](https://arxiv.org/abs/2310.04836)
- ![[Pasted image 20240907120154.png|700]]

## Activation-aware Weights Quantization (AWQ)
- 
## Post-training quantization (PTQ)
- 
## Quantization-aware training (QAT)
- 
## Resources
- [Webinar: "Quantization: unlocking scalability for LLMs" - YouTube](https://www.youtube.com/watch?v=qx6p9thgEno)
- [Егор Швецов | Model compression -Introduction intro Quantization - YouTube](https://www.youtube.com/watch?v=L4liz40QRTk)
- [Quantization](https://huggingface.co/docs/optimum/en/concept_guides/quantization)
- [r/LocalLLaMA - For those who don't know what different model formats (GGUF, GPTQ, AWQ, EXL2, etc.) mean](https://www.reddit.com/r/LocalLLaMA/comments/1ayd4xr/for_those_who_dont_know_what_different_model/)

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
