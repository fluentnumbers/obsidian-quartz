---
cssclasses: 
aliases:
  - reward modeling
permalink: LLM/reward-model
publish: "true"
"date:": "[[2024-09-04]]"
link: 
tags: 
parent: "[[Reinforcement Learning from Human Feedback|RLHF]]"
source: 
related:
  - "[[paper review - Llama 3 Herd of Models]]"
created: 2024/09/04
updated: 2025/06/30
---
%%
date:: [[2024-09-04]]
parent:: [[Reinforcement Learning from Human Feedback|RLHF]]
source::
related::
tags::
%%
# [[reward model]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- [[reward model]] is the result of training on top of the pre-trained [[LLM]] checkpoint
	- for any pair *(instruction, result)* predict a **number** (Reward Score) denoting *how good is the result for this instruction* - assigns a numerical score to model outputs based on their alignment with human preferences and values. The higher the score, the higher is the estimated degree of alignment.
- use human-annotated data with several **ranked** responses for each given instruction, for instance: $edited > chosen > rejected$
	- in practice, there can be up to 9 ranked responses, some of which can be excluded if too hard to rank.
	- $edited$ response can be optionally added by human annotators to improve one of the existing responses
- having such a model, we can select the best result from several options or use it for [[Reinforcement Learning from Human Feedback|RLHF]]

## How to obtain a reward model
### Architecture
- alter the [[transformer]] architecture by substituting the fully-connected layer with a **single neuron**, which output will be a number from $-\inf$ to $+\inf$ - our *Reward Score (RS)* $r$
- this is done only for the last output token in sequence, where all output tokens are already known.
- ![[Pasted image 20240903154326.png|250]]

### Preference Data
- Human preference data: several result candidates for each input instruction, ranked, but their rank is not quantified exactly.
- Additionally, labelers were allowed to **edit** one of the candidate results to make it the best among the three
- ![[Pasted image 20240903154530.png|400]]

### Preference model
- several models exist, the one explained here is the *[[Bradley-Terry model]]*
- it claims: the probability that user prefers result *y2* to result *y1* is equal to $\frac {r_2} {(r_2 - r_1}$ where $r_i$ is the reward and $r_i = \exp^{r(y_i)}$ where $r$ is the output of that [[#^bb0308|single neuron]]
- this $r_i$ definition ensures it takes a value from $0$ to $+\inf$
- after math transformations we get that $Prob(y2>y1) = sigmoid(r(y2) - r(y1))$ which is from 0 to 1
- ![[Pasted image 20240903155939.png|500]]
- given preference with ranked results (that is we know that $Prob(y1>y2)=1$) and knowing from the the above that this probability is $\sigma(r(y_1)-r(y_2))$ we can **maximize** this value while training the model with single neuron
- in practice we **minimize** the negative log of that. The optimum of this function is in 0 and it is reached only if $r(y_1) >> r(y_2)$. So we train the model to have the good response to have much higher score than the bad response, irrespectively of their absolute values.
- ![[Pasted image 20240903162346.png|500]]
- Train a reward model using checkpoint of a pre-trained model and preference data
- ![[Pasted image 20240903170021.png|300]]

## Resources
- [Reward Models - by Cameron R. Wolfe, Ph.D.](https://cameronrwolfe.substack.com/p/reward-models)

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
