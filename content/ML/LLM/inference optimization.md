---
cssclasses: 
aliases:
  - accelerating inference
permalink: LLM/inference-optimization
publish: "true"
"date:": "[[2024-11-12]]"
link: 
tags: 
parent: "[[LLM inference]]"
source: 
related: 
created: 2024/11/12
updated: 2025/07/28
---
%%
date:: [[2024-11-12]]
parent:: [[LLM inference]]
source::
related::
tags::
%%
# [[inference optimization]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- use smaller, faster models
- [[caching]] ^ef1842
	- [[prefix caching]]: [[Paged Attention]], [[vAttention]]
		- Structure your prompt in the way that the most important context is all and changes and additional data appears later
	- prompt caching (also partial, in the middle)
		- [Prompt Cache: Modular Attention Reuse for Low-Latency Inference](https://arxiv.org/abs/2311.04934)
		- cache identical prompts not to call LLM provider for the same inputs twice
	- query caching
		- [GitHub - zilliztech/GPTCache: Semantic cache for LLMs. Fully integrated with LangChain and llama\_index.](https://github.com/zilliztech/GPTCache?tab=readme-ov-file)
- [[quantization]]
	- By quantizing the model to float16, int8 or int4 is important to check how much the model degrades across different tasks and languages or modalities.
- pruning
- [[knowledge distillation]]
	- Transferring knowledge from a larger to smaller model
- [[speculative decoding]]
- [[batching]]
	- [[continuous batching]]
- using different models depending on prompt complexity. Simple question sent to a local model, and complex to ChatGPT
	- [RouteLLM](https://github.com/lm-sys/RouteLLM) is a library developing a special router-model to estimate prompt complexity.
- [[Mixture-of-Experts]]
	- [Mixture of Experts Explained](https://huggingface.co/blog/moe)
- parallelism
	- data parallelism - process several documents
	- task parallelism - run independent operations at the same time
- make it *look* faster
	- show users intermediate steps
	- first provide a rough answer and take more time for refinement and improvement

## Resources
- [\[2407.12391\] LLM Inference Serving: Survey of Recent Advances and Opportunities](https://arxiv.org/abs/2407.12391)
- [Transformers Inference Optimization Toolset](https://astralord.github.io/posts/transformer-inference-optimization-toolset/)

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
