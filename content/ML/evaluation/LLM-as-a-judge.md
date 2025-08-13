---
cssclasses: 
aliases: 
permalink: LLM/llm-as-a-judge
publish: "true"
"date:": "[[2024-11-08]]"
link: 
tags: 
parent: "[[model evaluation]]"
source: 
related:
  - "[[LLM]]"
created: 2024/11/08
updated: 2025/07/15
---
%%
date:: [[2024-11-08]]
parent:: [[model evaluation]]
source::
related:: [[LLM]]
tags::
%%
# [[LLM-as-a-judge]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- A reference-free metric that takes human out of the loop and increases model development iterations
- Examples
	- Pairwise comparison
		- Given the question and the two different responses, decide which response is better based on its relevance, healthfulness, and level of detail. If both responses are equally good, return tie, otherwise return response 1 or response 2.
	- Evaluation by criteria (reference-free)
		- Evaluate the following response for conciseness. A concise response is clear and direct without unnecessary words. Return either concise or verbose.
	- Evaluation by criteria (reference-based)
		- Given the conversation response below, assess if the user request was resolved. If the issue was addressed and the user confirmed it or showed satisfaction, return the label resolved. Otherwise, return not resolved.
- To create a judge, start with a labeled dataset, design a clear evaluation prompt, and iteratively refine it to align the model’s outputs with your golden dataset (small, but human-labeled).
- Build the judge using the same model you are using in your application. After you have the judge working, replace it with a smaller/cheaper model and iterate.
- After building the judge, integrate it into your application and use it to evaluate a percentage of the outputs to detect drift and track any trends over time.

### Advantages
- High quality evaluations closely matching human judgment.
- Simple to set up because they don't need reference answers.
- Flexible, it is possible to evaluate everything (==if you know what exactly==)
- Scalable, it is possible to handle multiple evaluations very fast.
- Easy to adjust as criteria change.
- Domain experts can participate in prompt creation.
### Disadvantages
- probabilistic, so slightly different prompts can lead to different outputs.
- May suffer from self-bias, first position bias, or verbosity bias.
- require detailed definitions of what constitutes "good" or "bad" performance
- ==may not detect novel problems, emerging problem patterns outside their evaluation criteria==
- Privacy risks if using third-party LLM.
- Costs, more expensive than rule-based evaluations, very expensive at scale for complex tasks

## Services
- [GitHub - braintrustdata/autoevals: AutoEvals is a tool for quickly and easily evaluating AI model ou...](https://github.com/braintrustdata/autoevals)
- [[Ragas]]
## Resources
- [Using LLM-as-a-judge 🧑‍⚖️ for an automated and versatile evaluation - Hugging Face Open-Source AI Cookbook](https://huggingface.co/learn/cookbook/en/llm_judge)
- [\[2306.05685\] Judging LLM-as-a-Judge with MT-Bench and Chatbot Arena](https://arxiv.org/abs/2306.05685)
- [Using LLMs for Evaluation](https://cameronrwolfe.substack.com/p/llm-as-a-judge )
- [Creating a LLM-as-a-Judge That Drives Business Results](https://hamel.dev/blog/posts/llm-judge/)

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
