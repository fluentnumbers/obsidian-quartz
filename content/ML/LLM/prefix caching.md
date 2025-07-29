---
cssclasses: 
aliases:
  - KV-caching
permalink: LLM/prefix-caching
publish: "true"
"date:": "[[2024-11-13]]"
link: 
tags: 
parent: "[[caching]]"
source: 
related: 
created: 2024/11/13
updated: 2025/05/01
---
%%
date:: [[2024-11-13]]
parent:: [[caching]]
source::
related::
tags::
%%
# [[prefix caching]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- *prefill* operation - Calculating the [[attention]] key and value scores (for the input we are passing to the LLM) - is one of the most compute-intensive and slowest operations in [[LLM inference]]
	- The output of the prefill are the attention key and value scores for each layer of the transformer for the entire input.
- KV-cache allows to avoid recalculating attention scores for the input on each autoregressive decode step.
- [[prefix caching]] refers to the process of ==caching the KV-cache itself== between subsequent inference requests in order to reduce the latency and costs of the pre-fill operation.
- LLM-chatbots with multi-turn conversations and large document/code uploads - are applications which naturally benefit from the prefix caching
- For it to be effective, the input structure and schema must remain prefix caching friendly: ==do not alter the prefix in subsequent requests== as this will invalidate the cache for all the tokens that follow.
	- As an example, putting a fresh timestamp at the very beginning of each request will invalidate the cache completely

![[Pasted image 20241113105347.png|1000]]
## Resources
-

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
