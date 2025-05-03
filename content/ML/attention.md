---
cssclasses: 
aliases:
  - attention mechanism
  - multi-head attention
  - self-attention
permalink: LLM/attention
publish: "true"
"date:": "[[2024-08-13]]"
link: 
tags: 
parent: "[[transformer]]"
source: 
related: 
created: 2024/08/13
updated: 2025/05/01
---
%%
date:: [[2024-08-13]]
parent:: [[transformer]]
source::
related::
tags::
%%
# [[attention]]
<sub>scroll ↓ to [[#Resources]]</sub>

> [!NOTE]- ##### paint analogy
> ![[Pasted image 20240813200632.png|450]]

## Notes
- “attention” is a mechanism that enables the model to focus on relevant parts of the input sequence while generating the output.
- key insight: For a given token in the output sequence, only one or a few tokens in the input sequence are most important.
- In short, determining relationships between different words and phrases in sentences is achieved thorough these steps:
	- Create queries (**Q**), keys (**K**) and values (**V**) vectors
	- Calculate *scores* showing how much each word should *attend* to other words - by taking the dot-product of **Q** (each one) word with **K** vectors of all other words in the sequence.
	- Normalized the scores, apply [[softmax]] to the scores to obtain *attention weights*.
	- Multiply each **V** by its attention weight, sum up the results to get a context-aware representation for that word, whose **K** vector we used in the dot-product
- memory usage of [[attention|multi-head attention]] is *N<sup>2</sup>*, where *N* is the number of input vectors, because the attention matrix will be $N * N$ ^6aa152
## [[scaled dot-product attention]]
- Given that the attention function is a ==mapping== of a query **Q** and a set of key-value **K:V** pairs to an output, For an in-depth explanation, it is good to start with a simple ==lookup table== as an [[attention]] block and see which modifications are needed.

 ### look-up table as a (potential) simplistic block of transformer architecture
> [!NOTE]-
> - key-value pairs **K**:**V**
> - result **R** is such **V_i** for which **Q**=**K_i**: [[indicative function]] is in the basis of the block
> ![[Pasted image 20240813204450.png|300]]
> - **K** and **V** are some vectors calculated from our [[deep learning|neural network]] inputs or their parts like collection of pixels (in case of images) or selection of tokens (for [[NLP]])
> ![[Pasted image 20240813203421.png|500]]
> - request **Q**
> 	- ==[[receptive field]]=1 --> [[deep learning]] doesn't work==
> 	- for [[deep learning]] we want to **train** the block
> 		- we can train **V** values here
> 		- we can't train **K** and **Q**, because [[derivatives]] of the look-up table function ([[indicative function]]) is 0 by these variables
> 		- ==no learning for **Q** and **K**==
> 	- we also need this block to be receptive to small changes in input --> then the [[gradient]] flows ==too strict mechanism, not flexible==
>

- after understanding the pitfalls, we upgrade the basic look-up table to the [[scaled dot-product attention]]

### modifying [[#look-up table]] to be better suited for training --> scaled dot-product attention
> [!NOTE]-
> - let's generalize [[indicative function]] to **delta(i)** - remember the [[#paint analogy]]
> - ==this is basically the attention mechanism: weighted vectors **V**==:
> ![[Pasted image 20240813204636.png|200]]
> 	- sum of all *$\delta_i = 1$*, all *$\delta_i >= 0$*
> 	  ![[Pasted image 20240813204948.png|200]]
> - in order to train **Q** and **K**, these need to change *smoothly* and their derivative not equal to 0
> ![[Pasted image 20240813205037.png|300]]
> - instead of "if **Q** equals **K_i**, output **V_i**" lets use the logic "if **Q** is similar to **V_i**, output something similar to **V_i**". the smaller the difference, the larger weight **delta**
> ![[Pasted image 20240813205439.png|300]]
> - comparisons are made in the vector space by means of [[scalar multiplication]]
> ![[Pasted image 20240813205752.png|300]]
> - after comparing all **K** to **Q** we get a vector of weighted **deltas**
> - ==[[softmax]] satisfies all of our requirements==: sum of components is 1, each one is >=0, derivative exist and non 0, ...
> ![[Pasted image 20240813210610.png|300]]

- finally, [[scaled dot-product attention]] is sum of **V** vectors scaled by **delta** vector, which is [[softmax]] taken from all [[scalar multiplication]] between vector representations **q** and **k**, divided by *d* (dimensionality of representations, proportional to [[dispersion]])
	- ![[Pasted image 20240813212140.png|300]]
- the above is valid for ==one query **q**==, but can be expanded for multiple queries by packing **Q**, **K** and **V** into matrices:
	  - ![[Pasted image 20240813213920.png|400]]
	  	  - where all *d* are the same, *m* and *n* are _often_ the same
- Summing up, [[scaled dot-product attention]] (SPDA):
	- ![[Pasted image 20240813214212.png|400]] with row-wise [[softmax]]
- ==the SDPA block doesn't contain trainable parameters, but it may let (or not let) through non-zero gradients==

### [[attention|self-attention]]
- *self-attention* is a special case of attention where **Q**, **K** and **V** are the same.
	- this doesn't matter as they are modify by different **trainable** weight matrices **Wq**, **Wk** and **Wv** (see [[attention|multi-head attention]])
- ![[Pasted image 20240813201706.png|450]]
	- **q_i** is always the most similar to **k_i**
- another variation *Q/KV Attention* uses one source for the queries and another for the keys and values.

## Multi-head attention

- [[scaled dot-product attention]] has limitations:
	- ==no trainable parameters==
	- inflexible: it measures similarity based on ==one== fixed (derived during training) criterium, bit there are many ways of making as similarity value for 2 images or sentences. there is no one best answer. we want to have *similarity context*
	- [[scalar multiplication]] measure similarity of two vectors, but ==not two concepts, depicted by vectors==. Imagine, the case when **Q** and **K** come from different sets \ distributions - e.g. imagesand text. We would want *an adapter* to transform given **Q**and **K** into a new space where these can be better compared.
- how to make it trainable? multiply **Q** and **K** by matrices of trainable weights **W**, potentially also changing the dimensionality
	- ![[Pasted image 20240814102616.png|300]]
- how to make it flexible
	- We can score vectors along multiple criteria by simply running multiple independent attention networks simultaneously. Each network is called a head.
	- By initializing each head independently (*that is multiplying by several trainable weight matrices*), we hope that during training, each head will learn to compare the inputs according to criteria that are simultaneously useful and different from those used by the other layers. If we want, we can add additional processing to explicitly encourage different heads to attend to different aspects of the inputs.
- resulting dimensionalities and output R of [[attention|multi-head attention]]
	  - ![[Screenshot 2024-08-14 at 10-48-16 Screenshot 2024-08-14 103718.pdf.png|800]]
	  - ![[Pasted image 20240815091547.png]]
- ==when we change the number of heads *h*, the number of parameters stays the same==, As long as the input dimension stays constant. This allows tweaking a number of heads and observing which impact does it have on the results of the model.
	- ![[Pasted image 20240814114536.png|500]]

### Masked multi-head attention
- see in [[transformer#^4b9c6b|transformers]]
### Grouped Query Attention
- [What is Grouped Query Attention (GQA)? — Klu](https://klu.ai/glossary/grouped-query-attention)
## Resources
- [Механизмы внимания в Transformer - YouTube](https://www.youtube.com/watch?v=7siDicen3a4)
- [Multi-head Attention. Лекция 19. - YouTube](https://www.youtube.com/watch?v=L6IsrTV-FI8)
- [Attention Is All You Need](https://arxiv.org/abs/1706.03762)
	- [The Annotated Transformer](http://nlp.seas.harvard.edu/annotated-transformer/#prelims) annotated jupyter-notebook
- [Visualizing A Neural Machine Translation Model (Mechanics of Seq2seq Models With Attention)](https://jalammar.github.io/visualizing-neural-machine-translation-mechanics-of-seq2seq-models-with-attention/)
- [Seq2seq and Attention](https://lena-voita.github.io/nlp_course/seq2seq_and_attention.html)

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
