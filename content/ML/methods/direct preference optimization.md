---
cssclasses: 
aliases:
  - DPO
  - Direct Preference Optimization
  - прямая оптимизация предпочтения
permalink: LLM/direct-preference-optimization
publish: true
"date:": "[[2024-08-31]]"
link: 
tags: 
parent: "[[model training]]"
source: 
related:
  - "[[LLM]]"
created: 2024/08/31
updated: 2025/05/01
---
%%
date:: [[2024-08-31]]
parent:: [[model training]]
source::
related:: [[LLM]]
tags::
%%
# [[direct preference optimization]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
 - part of the [[post-training]] approach as in [[paper review - Llama 3 Herd of Models#^8e9af4]]
### Comparison to [[Reinforcement Learning from Human Feedback|RLHF]]
- alternative to [[Reinforcement Learning from Human Feedback|RLHF]] for model [[alignment]]
- because the RLHF can be seen as unstable and complex procedure requiring fitting a [[reward model]] to collected *relative* human preferences data and then [[fine-tuning]] the large *self-supervised* LM using [[reinforcement learning]] to maximize the estimated reward without drifting too far from the original model
![[Pasted image 20241028094159.png|850]]

### the idea behind the DPO
- ==instead of== creating a *proxy* [[reward model]], generating new outputs, scoring them and, finally, maximizing the probability of generating high-scored outputs ==DPO allows fine-tuning a LM directly on human preference data using [[backpropagation]]==
	- Uses some math to suggest an internal reward model that doesn't take into account human preferences. It turns out to be very simple and it roughly says: "_A continuation yy is better for a prompt xx if yy is more likely to be generated from xx by the LLM_".
	- It then takes the `(prompt, preferred_continuation, rejected_continuation)` dataset and trains the LLM on it in a simple supervised way to ensure that, roughly speaking, the preferred continuation is more likely to be generated from the prompt than the rejected one*.

## Resources
- [Direct Preference Optimization: Your Language Model is Secretly a Reward Model](https://arxiv.org/pdf/2305.18290) ^64ec23

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
