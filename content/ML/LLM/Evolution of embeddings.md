---
cssclasses: 
aliases: 
permalink: LLM/evolution-of-embeddings
publish: "true"
"date:": "[[2024-11-14]]"
link: 
tags: 
parent: "[[tokenization|embedding]]"
source: 
related: 
created: 2024/11/14
updated: 2025/05/01
---
%%
date:: [[2024-11-14]]
parent:: [[tokenization|embedding]]
source::
related::
tags::
%%
# [[Evolution of embeddings]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Contents
- [[#Note|Note]]
- [[#Evolution of embeddings|Evolution of embeddings]]
	- [[#Evolution of embeddings#Word Embeddings|Word Embeddings]]
	- [[#Evolution of embeddings#Document embeddings|Document embeddings]]
		- [[#Document embeddings#Bag-of-Words models and shallow neural networks|Bag-of-Words models and shallow neural networks]]
		- [[#Document embeddings#Deeper neural networks|Deeper neural networks]]
	- [[#Evolution of embeddings#Image & multimodal embeddings|Image & multimodal embeddings]]
	- [[#Evolution of embeddings#Structured data embeddings|Structured data embeddings]]
	- [[#Evolution of embeddings#Graph embeddings|Graph embeddings]]
- [[#Resources|Resources]]

## Note

## Evolution of embeddings
### Word Embeddings
- lightweight, **context-free** word embedding
- [[Word2Vec]]
	- operates on the principle of “the semantic meaning of a word is defined by its neighbors”, or words that frequently appear close to each other in the training corpus
	- it accounts well for local statistics of words within a certain sliding window, but it does not capture the global statistics (words in the whole corpus)
- [[GloVe]]
	- leverages both global and local statistics of words
	- Creates a co-occurrence matrix which represents the relationship between words and then uses factorization technique to learn word representations from this matrix.
- [[SWIVEL]] ( Skip-Window Vectors with Negative Sampling)

### Document embeddings
![[Pasted image 20241114131132.png|700]]
#### Bag-of-Words models and shallow neural networks
- Early embedding algorithms based on *shallow* [[Bag-of-Words]] models paradigm assumed that a document is an unordered collection of words.
	- [[Latent Semantic Analysis]] (LSA)
	- [[Latent Dirichlet Allocation]] (LDA)
	- [[TF-IDF]] models are statistical models that use the word frequency to represent the document embeddings. [[BM25]], a TF-IDF-based bag-of-words model, is still a strong baseline in today’s retrieval benchmarks
- the **word ordering** and the **semantic meanings** are ignored
- [[Doc2Vec]] use **shallow** [[deep learning|neural network]] for generating document embedding

#### Deeper neural networks
- [[BERT]] became the base model for multiple other embedding models - Sentence BERT, SimCSE, E5
	- More complex **bi-directional** deep NN
	- Massive pre-training on unlabeled data with masked language model as the objective to utilize left and right context
	- Sub-word tokenizer
	- Outputs a contextualized embedding for **every** token in the input, but the embedding of the first token, named [CLS], is used as the embedding for the whole input.
- [[T5]] with 11B parameters
- [[PaLM]] with 540B parameters
- Model families generating **multi-vector** embedding [[ColBERT]], [[XTR]]

### Image & multimodal embeddings

### Structured data embeddings

### Graph embeddings
## Resources
- [[Google 5-Day Gen AI Intensive Course]]

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
