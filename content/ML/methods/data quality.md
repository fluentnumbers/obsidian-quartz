---
cssclasses:
aliases:
permalink: ML/data-quality
publish: "true"
"date:": "[[2024-10-31]]"
link:
tags:
parent: "[[Machine Learning MoC|Machine Learning]]"
source:
related:
  - "[[JD - IMC - Data Quality Engineer]]"
created: 2024/10/31
updated: 2025/10/25
---
%%
date:: [[2024-10-31]]
parent:: [[Machine Learning MoC|Machine Learning]]
source::
related:: [[JD - IMC - Data Quality Engineer]]
tags::
%%
# [[data quality]]
<sub>scroll ↓ to [[#Resources]]</sub>
## Note
- Dimensions
	- [[accuracy]]
	- completeness
	- consistency
	- timeliness
	- validity
- [[Databricks]] expectations platform
- Issues
	- [[data imputation|missing data]]
	- duplication
	- freshness
	- personal data
	- [[data labeling]] mistakes
- Key topics
	- metadata
	- [[real-time]] processing
	- lineage
	- [[unstructured]] data
	- leakage
	-[[CICD|CI/CD]]
## Data Quality management lifecycle
- Discovery
	- Talk to stakeholders: business users, DS\DE, executives
	- Requirement gathering: surveys, workshops, interviews, etc.
- Rule setting
	- business rules
	- semantic rules
	- industry
	- compliance
- Data Profiling
	- identify trends and [[anomaly detection|outlier detection]]
	- metadata management
- Cleansing & Standardization
- Monitoring & Reporting
	- [[data lakehouse]] monitoring in [[Databricks]]
	- [[drift monitoring|data drift]]
	- 

## Resources
- [Monitoring Data Quality at Scale with Statistical Modeling | Uber Blog](https://www.uber.com/en-NL/blog/monitoring-data-quality-at-scale/)
- [Learn Practical Techniques for Applying Data Quality in the Lakehouse with Databricks](https://youtu.be/qfafEZJI4d4?si=mzjV74pZQAAsMNgQ)

---

![[base - related.base]]

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
