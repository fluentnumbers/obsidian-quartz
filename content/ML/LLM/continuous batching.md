---
cssclasses: 
aliases: 
permalink: LLM/continuous-batching
publish: "true"
"date:": "[[2024-11-12]]"
link: 
tags: 
parent: "[[inference optimization]]"
source: 
related: 
created: 2024/11/12
updated: 2025/05/01
---
%%
date:: [[2024-11-12]]
parent:: [[inference optimization]]
source::
related::
tags::
%%
# [[continuous batching]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- Continuous batching is possible due to advancements in dynamic scheduling algorithms, and efficient memory management techniques like [[Paged Attention|PagedAttention]];
### Disadvantages of static batching
- processes a fixed number K requests in sync
	- ==awaits until the batch is assembled in full==
- awaits for the longest output sequence to complete ([[end-of-sequence]] token) --> ==underutilized [[GPU]] resources==
- In the image below (yellow: initial tokens, blue: response tokens, red: end-of-sequence), request S3 finished early at T5, but S2 took until T8.
![[3.8.2 EN.png|700]]

### Continuous batching
- **Dynamic batch updates**: [[batch size]] and sequences in batch change dynamically, when a sequence completes, a new request can immediately take its place in the batch.
	- GPUs remain fully utilized as new sequences are continuously added to the batch.
	- New requests don't have to wait for a batch to form; they join the processing stream as soon as possible.
- In the image below:
	- After each sequence completes (red cells), a new sequence (e.g., S5, S6, S7) is immediately added to the batch.
![[3.8.3.png|700]]
## Resources
- [# How continuous batching enables 23x throughput in LLM inference while reducing p50 latency](https://www.anyscale.com/blog/continuous-batching-llm-inference)

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
