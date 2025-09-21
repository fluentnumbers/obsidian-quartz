---
cssclasses: 
aliases:
  - backtest overfitting
permalink: bias/selection-bias
publish: "true"
"date:": "[[2025-03-16]]"
link: https://mathinvestor.org/2018/04/the-most-important-plot-in-finance/
tags: 
parent: "[[cognitive bias]]"
source: 
related:
  - "[[statistics]]"
created: 2025/03/16
updated: 2025/05/01
---
%%
date:: [[2025-03-16]]
parent:: [[cognitive bias]]
source::
related:: [[statistics]]
tags::
%%
# [[selection bias]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Note


### Backtest overfitting
- It is trivial to generate good-looking [[technical analysis]] (TA) strategies, when you run computer simulations on data without any constraint from rigorous theory. That is how technical analysts produce thousands of examples of presumed “successes.” But of course, for each TA success, there are millions of counter-examples where the same pattern leads to a loss. So the next time someone throws you a TA chart, think about the millions of alternative charts that this person is not showing you, based on alternative model configurations. Under that light, even a Sharpe ratio as high as 5 is to be expected.
- The reason is _Backtest Overfitting_: When selection bias (picking the best result) takes place under multiple testing (running a computer program that explores many alternative configurations), the outcome is very likely to be a false discovery. Finance books, academic journals and TV financial news channels are filled with false discoveries. The retraction rate for journal articles in the finance field is essentially null, compared to thousands of papers retracted in other fields.

## Resources
- [The most important plot in finance « Mathematical Investor](https://mathinvestor.org/2018/04/the-most-important-plot-in-finance/)

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
