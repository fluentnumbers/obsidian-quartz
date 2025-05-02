---
cssclasses: 
aliases: 
permalink: meta/selected-LLM-notes
publish: "true"
"date:": "[[2024-11-25]]"
link: 
tags: 
parent: "[[all kinds of lists]]"
source: 
related: 
created: 2024/11/25
updated: 2025/05/01
---
%%
date:: [[2024-11-25]]
parent:: [[all kinds of lists]]
source::
related::
tags::
%%
### [[selected LLM notes]]
#### Hot topics in LLM
[[LLM]] - basic info and the source to other notes for deeper understanding
[[LLM inference]] basics and [[inference optimization]]
[[paper review - Llama 3 Herd of Models| Paper Review - Llama 3.1 model - how is the one of the best open-source models designed?]]

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
[[Briefly about transformer’s evolution or why is softmax cool]]

#### Evaluation of LLMs

```dataview
LIST
FROM outgoing([[model evaluation]]) OR [[model evaluation]] AND -[[]]
WHERE contains(parent,[[model evaluation]])
SORT file.name ASC
```

 ---
