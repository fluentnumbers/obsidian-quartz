---
permalink: ML/tabular-data-imputation-transformer
cssclasses: 
aliases: 
publish: "true"
"date:": "[[2024-06-13]]"
link: https://arxiv.org/pdf/2407.11540v1
tags: 
parent: "[[data imputation]]"
source: 
related:
  - "[[transformer]]"
  - "[[SAMCo]]"
  - "[[paper review]]"
created: 2024/06/13
updated: 2025/05/29
---
%%
date:: [[2024-06-13]]
parent:: [[data imputation]]
source::
related:: [[transformer]] [[SAMCo]] [[paper review]]
tags::
%%
# [[Not Another Imputation Method]]
<sub>scroll ↓ to [[#Resources]]</sub>
## Contents

- [[#Note|Note]]
- [[#Architecture|Architecture]]
	- [[#Architecture#Feature embedding|Feature embedding]]
	- [[#Architecture#Masked self-attention|Masked self-attention]]
	- [[#Architecture#Transformer-encoder|Transformer-encoder]]
		- [[#Transformer-encoder#Encoder|Encoder]]
		- [[#Transformer-encoder#Regularization|Regularization]]
- [[#Resources|Resources]]

## Note
- [[transformer#^e8ddc3|encoder-only]] architecture with multi-headed attention that skips masked (missing) values
- ==does not explicitly impute the data== as a preprocessing step, but **implicitly handles missing values** for the purpose of [[classification]] task.
	- missing features are embedded as zero vectors (padding index)
	- Masked attention ensures these missing features do not influence the outcome
	- the encoder output is based only on non-missing data
	- classification is made using this partial information without ever filling in the missing values

## Architecture
### Feature embedding
- First, that is feature embedding, where each categorical numerical feature is encoded using trainable lookup tables. For categorical values, these lookup tables have exactly the number of rows equal to how many possible categories are for this feature. So the lookup table is feature specific. For numerical values, table is not feature specific and only has two roles to encode existing value and missing value. These [[tokenization|embedding]] are then computed using the formulas
	- categorical value embedding = feature bias (trainable, not category-, but feature-specific) + look-up-table row corresponding to that ==category== (the table is trainable and feature-specific for the reason of different categories per feature)
	![[Pasted image 20250529173507.png|450]]
	- numerical value embedding = feature bias (trainable) + feature value x one of the two rows (missing\existing) in the *feature-specific look-up-table*
	![[Pasted image 20250529173252.png|500]]
- All acquired embedded representations are concatenated together into a matrix $n \times d_e$, with $n$ - the number of features and $d_e$ is an embedding dimension. The matrix is passed into transformer encoder.

### Masked self-attention
- The traditional transformer calculates the query, key and value matrices through linear transformation of the input matrix $e$, mapping the embedding into a smaller space And the number of heads $h$.
- Normally, then[[attention#Masked multi-head attention|masked self-attention]] is applied for excluding future tokens (causal masking) or last (padding) tokens.
![[Pasted image 20250529181414.png|450]]
with $Q \times K^T$ being an attention matrix and $M$ - a mask.
- Traditional approach (masking columns corresponding to missing features) to design $M$ does not completely exclude the effect of missing values, because these can appear as keys, values, but also queries.
- Therefore, $M$ is applied twice:
![[Pasted image 20250529190129.png|450]]
	- added to the attention scores matrix $Q \times K^T$ ==masking columns== corresponding to missing features).
	- added as the transpose MTMT (==masking rows== corresponding to missing features)
- 
### Transformer-encoder
#### Encoder
- encoder layers - 6
- embedding dimension $d_e$ - 6
- attention heads - 3
- [[feed-forward layer]] size - 1000 neurons
- [[cross-entropy]] loss,
- 

#### Regularization
- 

## Resources
- [NAIM: A Transformer-based Model for Missing Values in Tabular Datasets](https://arxiv.org/pdf/2407.11540v1)
	- [GitHub - cosbidev/NAIM: Official implementation for the paper](https://github.com/cosbidev/naim)

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
