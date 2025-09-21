---
cssclasses: 
aliases:
  - MRR
permalink: ML/metrics/mean-reciprocal-rank
publish: true
"date:": "[[2024-10-30]]"
link: 
tags: 
parent: "[[LLM metric]]"
source: 
related:
  - "[[Retrieval-Augmented Generation|RAG]]"
created: 2024/10/30
updated: 2025/08/04
---
%%
date:: [[2024-10-30]]
parent:: [[LLM metric]]
source::
related:: [[Retrieval-Augmented Generation|RAG]]
tags::
%%
# [[Mean Reciprocal Rank]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- evaluates how well a system places the first relevant result in a ranked list
	- at which position is the first *relevant* hit?
- Highlights the importance of quickly surfacing at least one relevant document, with an emphasis on the efficiency of relevance delivery. ==Matters a lot when there are only a few items we can show to the user at any given time.==
- [The best business example I can give of MRR is thinking about something like a "play next" button. If you're building Spotify, you probably don't really care if one of the next 50 songs might be a banger. If the songs in the queue are not good, users will likely churn. The same applies to YouTube rankings.](https://jxnl.co/writing/2024/02/05/when-to-lgtm-at-k/#mean-reciprocal-rank-mrr-k)
## Resources
-

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
