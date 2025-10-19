---
cssclasses:
aliases:
  - LLM metrics
permalink: LLM/llm-metric
publish: true
"date:": "[[2024-10-30]]"
link:
tags:
parent: "[[model evaluation]]"
source:
related:
  - "[[ML metric]]"
created: 2024/10/30
updated: 2025/07/31
---
%%
date:: [[2024-10-30]]
parent:: [[model evaluation]]
source::
related:: [[ML metric]]
tags::
%%
# [[LLM metric]]
<sub>scroll ↓ to [[#Resources]]</sub>


## Contents

- [[#Note|Note]]
	- [[#Note#For text|For text]]
		- [[#For text#For machine translation|For machine translation]]
		- [[#For text#For summarization|For summarization]]
		- [[#For text#For chatbots|For chatbots]]
		- [[#For text#Other, task-agnostic|Other, task-agnostic]]
	- [[#Note#For images|For images]]
	- [[#Note#Text-to-Video|Text-to-Video]]
- [[#Resources|Resources]]

## Note
### For text
#### For machine translation
- [[Levenshtein Ratio]]
- [[BERTScore]]
- [[GEMBA]]

#### For summarization
- [[ROUGE]]
- [[G-Eval]]

#### For chatbots
- [[how to evaluate LLM chatbots]]
- [[moderation]]
- answer [[relevance]]

#### Other, task-agnostic
- [[perplexity]]
- [[hallucination]]

### For images 
- FID, IS, KID, SWD, PPL, LPIPS


### Text-to-Video
- FVD, CLIPScore, FID, LPIPS, KID
## Resources
- [Key LLM Evaluation Metrics & How to Calculate Them](https://www.comet.com/site/blog/llm-evaluation-metrics-every-developer-should-know/?utm_source=substack&utm_medium=email&utm_campaign=dlw&utm_content=llm-evaluation-metrics-every-developer-should-know/)

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
