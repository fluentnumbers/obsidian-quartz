---
permalink: stats/the-reason-most-ML-quant-funds-fail
cssclasses: 
- pws-properties-otherpills
classes: 
- Admin
- Dashboard
states: 
- Done
- Doing
aliases: 
publish: "true"
"date:": "[[2024-05-12]]"
link: https://medium.com/me/stats/post/e7d6bd95ef50
tags: 
parent: "[[Highlights MoC]]"
source:
  - "[[Youtube]]"
related:
  - "[[Finances MoC]]"
  - "[[Machine Learning MoC]]"
  - "[[published]]"
  - "[[Marcos Lopez de Prado]]"
created: 2024/05/12
updated: 2025/05/01
---
%%
date:: [[2024-05-12]]
parent::
source::
related:: [[Highlights MoC|Highlights]] [[Finances MoC]] [[published]] [[Marcos Lopez de Prado]] [[Machine Learning MoC|Machine Learning]]
tags::
%%
# [[The reasons most ML quant funds fail (lecture summary)]]

> [!NOTE]- Sources
> [The 7 Reasons Most Machine Learning Funds Fail Marcos Lopez de Prado from QuantCon 2018 - YouTube](https://www.youtube.com/watch?v=BRUlSm4gdQ4)

## The Sisyphean quants
- Discretionary portfolio managers work in silos because otherwise they start influencing each other and eventually everyone's opinion aligns with the one who appeared as the most convincing among them. Separation brings the diversification benefit.
- The same approach is habitually applied to quant portfolio managers for the sake of secrecy and for the reason that everyone should come up with their own ideas and not share responsibility.
- Making quant portfolio managers to work in silos and under strict deadlines results in them either 1) coming up with a strategy supported by an overfitted backtest, or 2) implementing a widely known factor strategy with a low [[Sharp ratio]]. Both outcomes are not satisfying for fund managers and eventually the teams are dissolved, quants quit.
- Developing a successful investment strategy requires a diverse set of skills and operations: data collection and management, software development, feature analysis and research, backtesting, infrastructure,...
## The Stationarity vs Memory dilemma
- The first thing quants normally do is that they remove the trend from the signals that is try to work with changes in yields, changes in volatility or returns (being a price derivative). This eradicates memory from the signal.
- Integer differentiation is done to keep the distributions of features stable and stationary
- The optimal level of fractional differentiation can be found so that it achieves stationarity, but keeps certain information about memory of the signal
- This example shows that one can achieve the [[stationarity]] with a fraction of differentiation at level d=0.35, where the memory is preserved (correlation between the original signal and the differentiated signal is still very high ~0.99)

![[Pasted image 20240512172626.png|500]]

- Analyzing multiple historical financial [[time-series]] we can conclude that differentiation at levels above 0.5 is never required to achieve stationarity
![[Pasted image 20240512152249.png|700]]

## Inefficient sampling
- Chronological sampling at the constant rate is the default approach, but the markets do not receive information at the constant rate. This also means that we are doing a lot of redundant observations which do not bring any new information
- It is better to make samples subject to the amount of information being exchanged: in terms of trade bars, volume bars, dollar bars, entropy bars or alike. If someone possesses information about the market and starts acting upon that influencing either the buy or sell side, the algorithm should start sampling more often to capture that asymmetry in information gain

## Wrong labeling
- Literally everyone uses Fixed-Time-Horizon method with time bars to create return labels. This is a bad idea because it results in skewed non-normally distributed samples with non constant variance, etc.
- The Triple Barrier Method: label an observation based on the first barrier (out of three) it touches.
	- the two horizontal barriers are defined by profit taking and stop loss limits which are a dynamic function of estimated volatility
	- the third barrier, the Vertical One is an Exploration Limit defient and terms of number of Bars and abst since position was taken
	- if for example the price pass touches the upper horizontal barrier then the label is 1, the lower horizontal barrier the label is minus 1 and the vertical barrier the label is 0
- This is a more practical labeling method because it models as if you had an actual position on the moment of labeling and how you would act.
![[211831107-f356016b-e0d0-4709-b648-2fc9eed42e7c.jpg|400]]

## ==Meta-labeling==
- High recall and low Precision means that there are many False positives
- ==??????==

## Non IID samples
- In other domains such as biomedical machine learning we can assume independently withdrawn samples (as in one blood sample per subject). In financial ML, observations are mixed and cross correlated to each other - it is impossible to isolate the effect of one event or feature on the financial markets.
- If we can come up with a function of uniqueness for every given observation, we can weight our samples by that and drastically improve out of sample performance of our algorithms.
- Such a function should indicate how similar is the current observation to the previous one and how much of an absolute returns can be attributed to the given observation only

## Cross-Validation leakage
- Because of the serial correlation X<sub>t</sub> ~= X<sub>t+1</sub>, observations at time t and time t+1 are approximately equal, and labels derived at time t and time t+1 are also approximately equal. If data point t is put in the training set and data point t+1 is put in the testing set, the algorithm will achieve higher performance even if X is an irrelevant feature due to information leakage. In the result, the out-of-sample performance will be much worse.
- To combat this one needs to use purging and embargo operations
	- purging means removing from the training set all observations whose labels overlapping in time with ANY of the labels included in the testing set
	- embargo means removing training observations which immediately follow the testing observations.
![[Pasted image 20240512162420.png|600]]

## The backtest overfitting
- Most quantitative firms invest in false discoveries because they rely on multi-trial backtests
- Conducting a thousand trials on a completely unpredictable series (random walk) yields expected value of max Sharp ratio around 3, whereas it should be 0.
- Neither researchers or practitioners usually track the amount of experiments they conduct, so the claimed results are assumed to be achieved using a single trial
- The deflated Sharp ratio takes into account additional variables such as non-normality of the returns, the duration of the return series and the number of independent trials involved.

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
