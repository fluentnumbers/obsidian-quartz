---
cssclasses: 
aliases: 
permalink: LLM/speculative-decoding
publish: "true"
"date:": "[[2024-11-13]]"
link: 
tags: 
parent: "[[decoding strategy|decoding strategies]]"
source: 
related: 
created: 2024/11/13
updated: 2025/05/01
---
%%
date:: [[2024-11-13]]
parent:: [[decoding strategy|decoding strategies]]
source::
related::
tags::
%%
# [[speculative decoding]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- [[LLM inference#^62c056|The second phase]] of LLM inference known as *auto-regressive decoding* is memory-bound and it is not easy to naively use additional parallel compute capacities to speed up the process.
- The main idea of [[speculative decoding]] is to use a much smaller secondary model, **drafter**, to run ahead of the main model and predict more tokens, for instance, 4 tokens ahead. This will happen more quickly as the drafter is much faster and smaller than the main model. Then the main model is used to verify the hypothesis of the drafter in parallel for each of the four steps: the first token, the first two tokens, the first three tokens, and all four tokens. In the end, the hypothesis with the maximum number of tokens is accepted.
![[Pasted image 20241113110853.png|800]]
- The main model steps are run in parallel and because we are not compute bound in decode, we can use extra compute capacity to get better decode [[latency]].
- ==This technique is completely quality neutral==, because the main model will reject any tokens that it wouldn't have predicted itself. So the only thing speculative decoding does is run ahead and present hypothesis that the main model can accept or reject in parallel.
- An important condition for this to work is that ==the drafter model should have good levels of alignment with the main model==, otherwise none of its hypotheses will be accepted by the main model. Investing in the training quality of the drafter model results in better latencies for the main model inference.
## Resources
- [\[2211.17192\] Fast Inference from Transformers via Speculative Decoding](https://arxiv.org/abs/2211.17192)

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
