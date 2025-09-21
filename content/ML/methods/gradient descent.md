---
cssclasses: 
aliases: 
permalink: ML/gradient-descent
publish: "true"
"date:": "[[2025-01-02]]"
link: 
tags: 
parent: "[[ML methods]]"
source: 
related: 
created: 2025/01/02
updated: 2025/05/01
---
%%
date:: [[2025-01-02]]
parent:: [[ML methods]]
source::
related::
tags::
%%
# [[gradient descent]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- Data [[normalization]] positively affects the convergence speed of the algorithm because of the more *rounded* shape of the function surface we optimize

## Steps of the algorithm
1. [[weights initialization|Initialize]] trainable parameters $\theta_0 = (W, \vec b)$
2. Compute the gradient of the [[loss function]] $\Delta E_{\theta_0}$
3. Update $\theta$: $\theta_{n+1} = \theta_n - \gamma \Delta E_{\theta_n}$ where $\gamma$ is the [[learning rate]] [[hyperparameters]] ^3de4d4
4. Decide if it is time to stop or continue
	- Stopping decision can be done
		- because of limited computational budget, number of iterations or time allowed
		- if the value of selected [[ML metric]] on the [[validation set]] has stabilized and not changing much
5. if continue, go to step [[#^3de4d4|3]]
## Resources
-

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
