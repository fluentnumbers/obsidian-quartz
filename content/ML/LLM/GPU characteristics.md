---
cssclasses:
aliases: 
permalink: note/gpu-characteristics
publish: "true"
"date:": "[[2024-11-09]]"
link: 
tags: 
parent: "[[GPU]]"
source: 
related:
  - "[[hardware]]"
created: 2024/11/09
updated: 2025/05/01
---
%%
date:: [[2024-11-09]]
parent::
source::
related::
tags::
%%
# [[GPU characteristics]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- **Peak FLOPs**: indicates the maximum number of floating-point operations a GPU can perform per second when all its compute engines are fully utilized.. The value depends on the precision of the model's weight (e.g. 32, 16 or 8 bits).
- **GPU memory size**: the total amount of memory available on the GPU. It is where LLMs store all their data.
- **GPU memory bandwidth**: the maximum speed at which data can be transferred (read or write) between the compute engine (or CUDA cores) and the GPU memory
![[1,3,6,5.png|500]]
- Nvidia A100 has 312 TFLOPS for FP16 or 19.5 TFLOPS for FP32
## Resources
- 

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
