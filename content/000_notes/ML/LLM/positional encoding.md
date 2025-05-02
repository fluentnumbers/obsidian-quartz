---
cssclasses: 
aliases: 
permalink: LLM/positional-encoding
publish: true
"date:": "[[2024-08-22]]"
link: 
tags: 
parent: "[[transformer]]"
source: 
related: 
created: 2024/08/22
updated: 2025/05/01
---
%%
date:: [[2024-08-22]]
parent:: [[transformer]]
source::
related::
tags::
%%
# [[positional encoding]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- Adds information about the position of each token in the sequence to help the transformer understand word order, because [[attention]] is position-invariant
- see [[transformer#decoder|decoder]] architecture
- in simplest form, position encoding vectors are added to input sequences

## Rotary Position Embeddings (RoPE)
- [RoFormer: Enhanced Transformer with Rotary Position Embedding Explained - YouTube](https://www.youtube.com/watch?v=YMcwsLGU_U8)
- [RoPE (Rotary positional embeddings) explained: The positional workhorse of modern LLMs - YouTube](https://www.youtube.com/watch?v=GQPOtyITy54)
- Original Paper : [https://arxiv.org/pdf/2104.09864.pdf](https://arxiv.org/pdf/2104.09864.pdf)
- [https://blog.eleuther.ai/rotary-embeddings/](https://blog.eleuther.ai/rotary-embeddings/)
- [https://nn.labml.ai/transformers/rope/index.htmly](https://nn.labml.ai/transformers/rope/index.html#:~:text=This%20is%20an%20implementation%20of,incorporates%20explicit%20relative%20position%20dependency).
- [https://serp.ai/rotary-position-embedding/](https://serp.ai/rotary-position-embedding/)
- [https://medium.com/@andrew_johnson_4/understanding-rotary-position-embedding](https://medium.com/@andrew_johnson_4/understanding-rotary-position-embedding-a-key-concept-in-transformer-models-5275c6bda6d0)
- [https://github.com/lucidrains/rotary-embedding-torch](https://github.com/lucidrains/rotary-embedding-torch)
- [http://krasserm.github.io/2022/12/13/rotary-position-embedding/](http://krasserm.github.io/2022/12/13/rotary-position-embedding/)
## Resources

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
