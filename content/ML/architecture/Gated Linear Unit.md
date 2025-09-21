---
cssclasses: 
aliases:
  - GLU
permalink: ML/GLU
publish: true
"date:": "[[2024-08-20]]"
link: 
tags: 
parent: "[[activation function]]"
source: 
related: 
created: 2024/08/20
updated: 2025/05/01
---
%%
date:: [[2024-08-20]]
parent:: [[activation function]]
source::
related::
tags::
%%
# [[Gated Linear Unit]]

## Note
- Gated Linear Units [Dauphin et al., 2016] consist of the component-wise product of two linear projections, one of which is first passed through a sigmoid function. Variations on GLU are possible, using different nonlinear (or even linear) functions in place of sigmoid.
- **Gated** means that there is a component responsible for letting signal through. Most often that is achieved by multiplying a signal by a number from 0 to 1.

## SwiGLU
- used in [[paper review - Llama 3 Herd of Models]] as well as Llama 2
- is a combination of [[Gated Linear Unit|GLU]] and Swish
	- ![[Pasted image 20240904095736.png|600]]
- ![[Pasted image 20240820173816.png|400]]
- *swish* with component-wise multiplication of another feed-forward layer
	- [[sigmoid]] inside [[swish]] acts as a *gate*
  ![[Pasted image 20240820174704.png|500]]

#### Why does it work?
> We offer no explanation as to why these architectures seem to work; we attribute their success, as all else, to divine benevolence.

^200a3c
### Links
- [https://blog.paperspace.com/swish-activation-function](https://blog.paperspace.com/swish-activation-function/#:~:text=Simply%20put,%20Swish%20is%20an,Function%20Approximation%20in%20Reinforcement%20Learning%22)
- [https://medium.com/@neuralnets/swish-activation-function](https://medium.com/@neuralnets/swish-activation-function-by-google-53e1ea86f820#:~:text=Swish%20is%20a%20smooth,%20non,that%20actually%20creates%20the%20difference)
- [SwiGLU Explained | Papers With Code](https://paperswithcode.com/method/swiglu)
## Resources
- [GLU Variants Improve Transformer](https://arxiv.org/pdf/2002.05202v1)

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
