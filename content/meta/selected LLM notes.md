---
cssclasses: 
aliases: 
permalink: meta/selected-LLM-notes
publish: "true"
"date:": "[[2024-11-25]]"
link: 
tags: 
parent: "[[meta]]"
source: 
related: "[[LLM]]"
created: 2024/11/25
updated: 2025/10/25
---
%%
date:: [[2024-11-25]]
parent:: [[meta]]
source::
related:: [[LLM]]
tags::
%%
###### [[selected LLM notes]]

- [[Evaluating information retrieval]]
- [[synthetic data generation for RAG evaluation]]
- [[Advanced RAG techniques]]
- [[Enterprise RAG patterns]]
- [[what can go wrong with LLMs]]
- [[how to evaluate LLM chatbots]]
- [[Briefly about transformer’s evolution or why is softmax cool]]
- [[paper review - Llama 3 Herd of Models| Paper Review - Llama 3.1 model - how is the one of the best open-source models designed?]]
- [[Generative AI System Design Interview - Ali Aminian (Computer scientist) Hao Sheng (Researcher in computational mathematics)]]
	- [[Generative AI System Design Interview - Chapter 1 - Introduction and Overview]]

%%
[[LLM]] - basic info and the source to other notes for deeper understanding
[[LLM inference]] basics and [[inference optimization]]

[[tokenization|Tokenizers, embedding models - corner stone of each LLM task]] and [[byte pair encoding|Byte Pair Encoding]] as one of popular tokenization ideas
[[scaling laws| Scaling Laws]] - how to distribute compute budget efficiently between dataset size and number of trainable parameters?

[[Reinforcement Learning from Human Feedback|RLHF]] - how reinforcement learning finally found its application
[[reward model| Reward Modeling]] - how it is used for RLHF and LLM fine-tuning?
[[direct preference optimization|Direct Preference Optimization]] - is it a more stable and cheap alternative to RLHF?

[[Retrieval-Augmented Generation|What is RAG?]] How does it work and how to maximize its impact?

#### Deep Learning architecture blocks
[[transformer|Transformer architecture]] and how each of the following blocks fit together
[[attention|Attention, self-attention. multi-headed attention]]
[[skip connection|Skip connection]]
[[batch normalization|Batch normalization]]
[[layer normalization|Layer normalization]]
[[dropout|Dropout]]
[[Gated Linear Unit]]

#### Evaluation of LLMs

```dataview
LIST
FROM outgoing([[model evaluation]]) OR [[model evaluation]] AND -[[]]
WHERE contains(parent,[[model evaluation]])
SORT file.name ASC
```
%%

 ---
