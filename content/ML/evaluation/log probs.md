---
cssclasses:
aliases:
  - log probabilities
  - log_probs
permalink: LLM/log-probs
publish: true
"date:": "[[2025-08-30]]"
link:
tags:
parent: "[[LLM metric]]"
source:
related:
  - "[[entropy]]"
created: 2025/08/30
updated: 2025/08/30
---
%%
date:: [[2025-08-30]]
parent:: [[LLM metric]]
source::
related:: [[entropy]] [[Kullback-Leibler divergence 1]]
tags::
%%
# [[log probs]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- can be used for [[classification]] certainly estimation or early [[drift monitoring|data drift]] detection
- log_probs are conditional on the model’s training and the context it sees. They reflect how likely the model was to generate a token based on patterns learned from its data, not an objective probability in the real world. This makes them a useful signal of model uncertainty, but they shouldn’t be confused with actual chances of an outcome (although, generally LLMs super wide training data allows them to have sufficient accuracy on the vast majority of use cases)
- Important to remember that **Single token log probabilities are not class probabilities** because:
	- The probability distribution is over the entire vocabulary, not a single class label, so class probabilities wont sum up to 1.
	- due to [[tokenization#Common issues due to tokenization]]
	- context dependency (as above)

## Classification confidence with log_probs
- The right way to implement [[classification]] confidence evaluation with [[log probs|log_probs]]:
	- Define a fixed enum of possible class labels
	- Compute sequence log probabilities for each complete class label
		- probability of a sequence of tokens representing a class label is a product of their [[conditional probability|conditional probabilities]], given all previous tokens
			- `P(sequence)=P(t1)×P(t2∣t1)×P(t3∣t1,t2)×...×P(tn∣t1,...,tn−1)` or `logP(sequence)=logP(t1)+logP(t2∣t1)+...+logP(tn∣t1,...,tn−1)`
			- [Computing log probability of an arbitrary sequence given another sequence](https://discuss.huggingface.co/t/computing-log-probability-of-an-arbitrary-sequence-given-another-sequence/70069)
	- Renormalize these probabilities across only your defined classes
		- `P(class_i | input) = exp(log_prob_i) / sum(exp(log_prob_j) for all j in classes)`
	- Apply calibration using holdout validation data to ensure the probabilities reflect true confidence
		- [Calibrating LLM classification confidences \| Nyckel](https://www.nyckel.com/blog/calibrating-gpt-classifications/)

## Data and model drift detection
- [[accuracy]] is a step-function, by the time max log-prob token changes it is already late to detect drift
	- continuous metrics are better as they detect changes in distribution even when argmax is still the same
- [[entropy]]
	- When a model becomes less certain about its predictions, the entropy of its output distribution increases, even if the top prediction remains the same
- [[Kullback-Leibler divergence 1]]
	- Maintain a set of stable test prompts that remain consistent, run each prompt N times, calculate statistics, establish a baseline
	- Run these prompts daily through the model
	- Use token-wise KL divergence to compare today's [[softmax]] output against the baseline.
	- Flag when KL divergence exceeds threshold --> [[model drift]] is distinguished from potential [[drift monitoring|data drift]]
## Resources
- [Prompting is not a substitute for probability measurements in large language models](https://arxiv.org/abs/2305.13264)
- [Using logprobs \| OpenAI Cookbook](https://cookbook.openai.com/examples/using_logprobs)

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
