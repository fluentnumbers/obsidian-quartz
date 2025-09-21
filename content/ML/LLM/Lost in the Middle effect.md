---
cssclasses: 
aliases:
  - Lost in the Middle
  - Long-context problem
permalink: note/lost-in-the-middle-effect
publish: "true"
"date:": "[[2024-11-18]]"
link: https://arxiv.org/abs/2307.03172
tags: 
parent: "[[model evaluation]]"
source: 
related: 
created: 2024/11/18
updated: 2025/05/09
---
%%
date:: [[2024-11-18]]
parent:: [[model evaluation]]]
source::
related:: [[Retrieval-Augmented Generation|RAG]]
tags::
%%
# [[Lost in the Middle effect]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- The effect appearing within [[long context]] for LLM, when retrieving relevant info from the context is more successful, when it is stored in the beginning or in the end of the context.
- ![[Pasted image 20241118132004.png|350]]
> Figure 1: Changing the location of relevant information (in this case, the position of the passage that answers an input question)
> within the language model’s input context results in a U shaped performance curve —
> models are better at using relevant information that occurs at the very beginning (primacy bias) or end of its input context (recency bias),
> and performance degrades significantly when models must access and use information located in the middle of its input context.
## Resources
- [\[2307.03172\] Lost in the Middle: How Language Models Use Long Contexts](https://arxiv.org/abs/2307.03172)

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
