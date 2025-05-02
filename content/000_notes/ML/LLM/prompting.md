---
cssclasses: 
aliases: 
permalink: LLM/prompting
publish: "true"
"date:": "[[2025-01-12]]"
link: 
tags: 
parent: "[[LLM inference]]"
source: 
related:
  - "[[reasoning]]"
created: 2025/01/12
updated: 2025/05/01
---
%%
date:: [[2025-01-12]]
parent:: [[LLM inference]]
source::
related:: [[reasoning]]
tags::
%%
# [[prompting]]
<sub>scroll ↓ to [[#Resources]]</sub>
## Contents

- [[#Note|Note]]
	- [[#Note#Examples|Examples]]
	- [[#Note#Reasoning|Reasoning]]
	- [[#Note#Other|Other]]
- [[#Resources|Resources]]

## Note

> [!NOTE]- Extensive list of prompting methods from [[#^44dbf0]]
> ![[Pasted image 20250112205026.png|800]]
### Examples

- [[zero-shot learning]]
- [[few-shot learning]]
	- append sample task-answer examples to the prompt
	- [Many-Shot In-Context Learning](https://arxiv.org/pdf/2404.11018) shows how the results are impacted if the prompt is filled with 2000+ examples. Though, consider the costs of such prompting technique and difficulty of generating a prompt itself.

### Reasoning
- [[Chain-of-Thought]] - add *let's think step by step* to your prompt
	- [Chain-of-Thought Prompting Elicits Reasoning in Large Language Models](https://arxiv.org/pdf/2201.11903)
- self-consistency + CoT - generate several different LLM outputs to the same prompt, take the most often answer
- [[Tree-of-Thought]] - iteratively generate different candidate outputs, pick the best and add them back to the tree of potential solutions
	- [Tree of Thoughts: Deliberate Problem Solving with Large Language Models](https://arxiv.org/abs/2305.10601)
- [[Graph-of-Thought]] - [Graph of Thoughts: Solving Elaborate Problems with Large Language Models](https://arxiv.org/abs/2308.09687)
- [Reasoning with Large Language Models, a Survey](https://arxiv.org/abs/2407.11511)

### Other
- [[meta prompting]]
	- ask the model to improve own answer

## Resources
- [An Empirical Categorization of Prompting Techniques for Large Language Models: A Practitioner's Guide](https://arxiv.org/abs/2402.14837)
- [A Systematic Survey of Prompt Engineering in Large Language Models: Techniques and Applications](https://arxiv.org/pdf/2402.07927) ^44dbf0

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
