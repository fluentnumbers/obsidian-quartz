---
cssclasses: 
aliases: 
permalink: ML-CV/test-lowe
publish: true
"date:": "[[2025-06-18]]"
link: 
tags: 
parent: "[[similarity measurement]]"
source: 
related:
  - "[[image retrieval]]"
created: 2025/06/18
updated: 2025/07/31
---
%%
date:: [[2025-06-18]]
parent:: [[similarity measurement]]
source::
related:: [[image retrieval]]
tags::
%%
# [[test Lowe]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note
- simplest way to resolve a problem in [[image retrieval]] task, when ==there will always be the most similar object== in the database to the one that was inputted during inference. If so, how to decide whether this is indeed a match or not.
- the idea is that the same object is much more alike to itself then to the next most similar object (but not itself)
![[Pasted image 20250618112544.png|300]]
where $x$ is input vector, $x_1$ and $x_2$ are potential matches, closest objects from the database. This ratio is ~ 0 if $x_1$ is a correct match and it is ~0 if $x_1$ and $x_2$ are both false positives.
- ==reliability of this approach is highly dependent on the number of database entries==. The more objects are present, the better this ratio works.
## Resources
- 

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
