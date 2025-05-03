---
cssclasses: 
aliases:
  - accelerating inference
permalink: note/inference-optimization
publish: "true"
"date:": "[[2024-11-12]]"
link: 
tags: 
parent: "[[LLM inference]]"
source: 
related: 
created: 2024/11/12
updated: 2025/05/01
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
- [[caching]] ^ef1842
	- [[prefix caching]]: [[Paged Attention]], [[vAttention]]
	- prompt caching (also partial, in the middle)
		- [\[2311.04934\] Prompt Cache: Modular Attention Reuse for Low-Latency Inference](https://arxiv.org/abs/2311.04934)
	- query caching
		- [GitHub - zilliztech/GPTCache: Semantic cache for LLMs. Fully integrated with LangChain and llama\_index.](https://github.com/zilliztech/GPTCache?tab=readme-ov-file)
- [[quantization]]
	- By quantizing the model to float16, int8 or int4 is important to check how much the model degrades across different tasks and languages or modalities.
- [[speculative decoding]]
- [[batching]]
	- [[continuous batching]]
- using different models depending on prompt complexity. Simple question sent to a local model, and complex to ChatGPT
	- [RouteLLM](https://github.com/lm-sys/RouteLLM) is a library developing a special router-model to estimate prompt complexity.
- [[Mixture-of-Experts]]
	- [Mixture of Experts Explained](https://huggingface.co/blog/moe)

## Resources
- [\[2407.12391\] LLM Inference Serving: Survey of Recent Advances and Opportunities](https://arxiv.org/abs/2407.12391)

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
