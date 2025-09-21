---
cssclasses: 
aliases:
  - sampling strategy
  - sampling strategies
  - decoding strategies
  - sequence decoding
  - LLM sampling
permalink: LLM/decoding-strategy
publish: true
"date:": "[[2024-11-03]]"
link: 
tags: 
parent: "[[LLM inference]]"
source: 
related: 
created: 2024/11/03
updated: 2025/05/12
---
%%
date:: [[2024-11-03]]
parent:: [[LLM inference]]
source::
related::
tags::
%%
# [[decoding strategy]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Contents

- [[#Note|Note]]
- [[#Decoding strategies|Decoding strategies]]
	- [[#Decoding strategies#Constrained decoding|Constrained decoding]]
- [[#Resources|Resources]]

## Note
- Pre-final output of the LLM is a vector of probabilities from [[softmax]] layer: for each token in its [[tokenization|tokenizer's]] vocabulary. In order to show *textual* representation to a user, at each step, the system must choose **the next token**. The process is called *sampling* or *sequence decoding*.

## Decoding strategies
- [[pure sampling]] - sample according to the distribution: token with N% probability after [[softmax]] is sampled by the system with N% probability
- [[greedy sampling]] - always choose the highest probability token. This gives reproducible result, but it is more boring and also lower quality ("likelihood trap") ^42d3a3
	- in that case [[temperature|softmax temperature]] doesn't affect the result, because it will not change the argmax token
- [[beam search]] - at each step we save *k* most probable token **sequences** down to a given number of steps exploiting the idea, that taking ==NOT the most probable== token at step N, still can lead to the largest ==overall== likelihood for the whole sequence of generated tokens.
	- This allows having a wider search space, but it also increases computational burden and often results in sequences with repeating tokens.
		- To reduce the latter problem, one can use *repetition* and *frequency* fines.
	- is not used on practice for LLMs, cause gives suboptimal results
- [[temperature sampling]] - randomly pick a token while taking into account given probability distribution. Same as for [[pure sampling]], but this method is regulated by the [[temperature|softmax temperature]] parameter T.
	- When T is zero, it becomes [[#^42d3a3|Greedy decoding]].
	- When the temperature is very high, all probabilities are almost equal - then it's [[random sampling]]. ^28142e
- [[top-k sampling]] - only consider top-*K* most probable tokens, normalize their probabilities to 1, other tokens are neglected
	- the entropy of human speech (text) is dependent on which token\word we are at. There are moments when predicting the next word is trivial and there are cases, when it is very hard. ==therefore, having a constant *K* is not optimal== as we sometimes take too many and sometimes too few. This issue is resolved by [[top-p sampling]]
![[Pasted image 20250112201939.png|500]]
- [[top-p sampling]] (nucleus sampling) - instead of a fixed **number** of most probable tokens, add to the sampling set every token (in the order of probability) until the total probability exceeds the [[hyperparameters|hyperparameter]] *p* (e.g. 0.95)
	- this is currently the standard decoding strategy unless [[speculative decoding]] is used for speeding up the inference

### Constrained decoding
- 
## Resources
- [Decoding Strategies in Language Models | Rajan Ghimire](https://r4j4n.github.io/blogs/posts/text_decoding/)
- [THE CURIOUS CASE OF NEURAL TEXT DeGENERATION](https://arxiv.org/pdf/1904.09751)
- [Dummy's Guide to Modern Samplers](https://rentry.co/samplers)

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
