---
permalink: LLM/LLM
cssclasses: 
aliases:
  - large language models
  - NLP
  - generative AI
publish: "true"
link: 
tags: 
source: 
related:
  - "[[transformer]]"
parent: "[[deep learning]]"
created: 2024/01/20
updated: 2025/05/01
---

%%
date:: [[2023-07-16]]
parent:: [[deep learning]]
source::
related: [[transformer]]
tags::
%%
# [[LLM]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Contents

- [[#Note|Note]]
- [[#LLM training stages|LLM training stages]]
- [[#How to evaluate LLMs?|How to evaluate LLMs?]]
- [[#How to improve LLMs without fine-tuning?|How to improve LLMs without fine-tuning?]]
	- [[#How to improve LLMs without fine-tuning?#Prompting|Prompting]]
	- [[#How to improve LLMs without fine-tuning?#Choose the best sampling strategy|Choose the best sampling strategy]]
	- [[#How to improve LLMs without fine-tuning?#Answer validation|Answer validation]]
- [[#Resources|Resources]]

## Note
- post-2022 GPT-like Large Language Models architecturally are based on the ideas from [Attention is all you need](https://arxiv.org/abs/1706.03762) paper with slight modifications within modules like [[layer normalization]] and [[positional encoding]]. See more about the original [[transformer|Transformer]].
- Read the paper review about the [[paper review - Llama 3 Herd of Models|Llama 3.1 model by Meta]] to see example of the modern LLM implementation
- Some nice visual explanatory links:
	- [Generative AI exists because of the transformer](https://ig.ft.com/generative-ai/)
	- [Visualizing A Neural Machine Translation Model (Mechanics of Seq2seq Models With Attention)](https://jalammar.github.io/visualizing-neural-machine-translation-mechanics-of-seq2seq-models-with-attention/)

> [!NOTE]- How are LLMs different from other models?
> - Emergent capabilities: unlike in regular models, for LLMs there is a sharp bump in *model size* vs *performance*. [[diminishing returns]] issue start appearing later, after the huge increase. It wasn't designed, therefore "LLM is not an invention, but a discovery".
> - [[zero-shot learning]] performance
> - gets better at all tasks at once
> - training is **VERY** expensive
> - evaluation data contamination
> - idealogical biases in the models
> - ==TODO: agentic reasoning==

## LLM training stages
> [!NOTE]- How are LLMs trained?
> - There are several stages of [[model training]]
> 	- *pre-training*:
> 		- super-large text datasets (trillions of tokens) are used for **unsupervised** learning, namely [[next token prediction]] task
> 		- in the result, the network can *only* continue given sequence, but because of that it now knows *the language structure* and its *statistics*
> 		- the pre-training costs up to millions $
> 	- *post-training*: includes supervised finetuning, [[alignment]], etc.
> 		- [[supervised finetuning]]: using high-quality relatively small **annotated** dataset, train the model to do a particular task well
> 			- instruction finetuning: improve the model ability to follow instructions, the essential skill of any chat-model
> 			- domain finetuning: extend the pre-training with a specific domain-dataset, which can also be not-labeled (then it is, again, [[next token prediction]] training)
> 		- [[Reinforcement Learning from Human Feedback]] or RLHF with several actual implementations - [[PPO]], [[direct preference optimization|DPO]]
> 	- Other methods:
> 		- Finetune only the last fully connected layer of the model as in classical deep-learning
> 		- Add small amounts of new trainable parameters (*adapters*) into existing network architecture, keep other weights frozen - [[LoRA]] [[QLoRA]]
> 		-

>
> ![[gpt-assistant-training-pipeline.jpeg|800]]
>
> ### Libraries for finetuning
> - [Hugging Face Transformers](https://huggingface.co/docs/transformers/en/training) - the most popular and widely applicable
> - [Torchtune](https://github.com/pytorch/torchtune) - [[PyTorch]]-native
> - [Lingua](https://github.com/facebookresearch/lingua) by Meta

## How to evaluate LLMs?
[[model evaluation]] often is done using multiple metrics and approaches, depending on the task, labels and resources
![[Pasted image 20230716162301.png|700]]
> [!NOTE]- Basic ML metrics
> - [[loss function]], [[perplexity]] - parameters which can be monitored directly during the training stage, on a training and validation sets. These allow to judge about the training dynamics and relatively compare different models, but it's hard to interpret these numbers in application to a concrete business use-case the model is intended for.
> - Accuracy, [[precision and recall|precision and recall]], ROC-AUC, etc. - Good choices for (binary) classification tasks and [[named entity recognition]].
> - [[BLEU]], [[ROUGE]], [[METEOR]] - all these metrics compare two texts quantifying tokens' overlap in some way. Texts can be semantically similar, but be formulated using completely different vocabulary, which means that these metrics aren't good for the tasks where the model is not expected to output exact text. This disadvantage is partially solved by more complicated metrics like BertScore which use another, smaller LLM under the hood.

> [!NOTE]- Comparison and high-level requirements
> - The model quality can be rated using a scale (1 to 5), either in overall or by a specific criterium: Language proficiency, reasoning, knowledge, planning, durability, robustness, biases, creativity, safety, helpfulness, trustworthiness, completeness, politeness, etc.
> - For each of the selected metrics, there should be a well-described definitions of what each score means in each category.
> - Scoring itself can be done:
> 	- using human labelers, experts or regular person who select the best output or ranks all of them.
> 		- This is expensive, [[https://arxiv.org/abs/2309.16349|subjective]], slow and doesn't scale.
> 	- [[LLM-as-a-judge]] - a regular or a specifically trained LLM scores and makes comparisons of outputs.
> 		- The problem of this approach is that it works worse on complicated tasks. LLMs [[https://arxiv.org/abs/2404.13076|can have preferences due to irrelevant, internal criteria]]
> 		- here is a guide on how to create LLM-judges: [Creating a LLM-as-a-Judge That Drives Business Results – Hamel's Blog](https://hamel.dev/blog/posts/llm-judge/)
> 		- It is also prone to ==verbosity bias, self-bias, position bias==
> 		> ![[Pasted image 20230716162426.png|800]]

> [!NOTE]- Business metrics
> - It is best to check the effect of any ML model on a real business process that you want to improve. For instance, it can be money or time efficiency, user satisfaction scores, etc. [[AB test]] is an essential tool here.
> - It can also happen that business metrics are improving but the model output is not satisfying, for instance because of improper output format.

> [!NOTE]- Task-specific non-business metrics
> Output format correctness and robustness (json)
> Hallucinations, toxicity - important for medical and judicial applications: [[https://arxiv.org/abs/2310.18344|ChainPoll]], GPTScore, SelfCheckGPT.
> Robustness to noise, typos, factual errors, short\long context
> Ability to admit "not knowing" the answer, insufficient input information

###### Links
- [What We’ve Learned From A Year of Building with LLMs – Applied LLMs](https://applied-llms.org/#evaluation-monitoring)
- [Ragas](https://docs.ragas.io/en/stable/#frequently-asked-questions): Ragas is a library that provides tools to supercharge the evaluation of Large Language Model (LLM) applications

## How to improve LLMs without fine-tuning?
### Prompting
- [[prompting]] is the most popular, cheap and fast method of improving LLM output quality.
- [[reasoning]] often falls below prompting, but is so effective and developed into multitudes of methods and combinations
	- see [[prompting#Reasoning]]

### Choose the best sampling strategy
- Under the hood, LLM outputs probability distribution over the whole token vocabulary. [[decoding strategy|sampling strategy]] defines how to pick one of all probably tokens.

### Answer validation
- Impose requirements on the answer format and validate its consistency and robustness.
- [GitHub - dottxt-ai/outlines: Structured Text Generation](https://github.com/dottxt-ai/outlines)

## Resources
- [How to tune LLM models within the context of your business? | Maksud Ibrahimov](https://ibragimov.org/2023/07/25/llm-tuning.html)
- [Open-Source Text Generation & LLM Ecosystem at Hugging Face](https://huggingface.co/blog/os-llms)
- [All You Need to Know to Build Your First LLM App | by Dominik Polzer | Jun, 2023 | Towards Data Science](https://archive.li/iyv4W)
- [MLStack.Cafe - Kill Your Next Machine Learning, Data Science & Python Interview. Find your next ML Job.](https://www.mlstack.cafe/blog/large-language-models-llms-interview-questions)
- [NLP for Supervised Learning - A Brief Survey](https://eugeneyan.com/writing/nlp-supervised-learning-survey/)
- [Some Intuition on Attention and the Transformer](https://eugeneyan.com/writing/attention/)
- [The Map Of Transformers. A broad overview of Transformers… | by Soran Ghaderi | Towards Data Science](https://towardsdatascience.com/the-map-of-transformers-e14952226398)
- [Emerging Architectures for LLM Applications | Andreessen Horowitz](https://a16z.com/emerging-architectures-for-llm-applications/)
- [What are Large Language Models? - by Etienne Bernard](https://newsletter.theaiedge.io/p/what-are-large-language-models)
- [How Large Language Models Work - YouTube](https://www.youtube.com/watch?v=5sLYAQS9sWQ)

> [!NOTE]- whitepaper by Google: Foundational Large Language Models & Text Generation
> ![[whitepaper_Foundational Large Language models & text generation.pdf]]

---
###### Links to this File
```dataview
table file.tags from [[]] and !outgoing([[]])  AND -"Changelog"
```
