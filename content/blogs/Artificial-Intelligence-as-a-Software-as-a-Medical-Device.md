---
cssclasses: 
aliases: 
permalink: blog/Artificial-Intelligence-as-a-Software-as-a-Medical-Device
publish: "true"
date: "[[2024-12-06]]"
link: https://www.linkedin.com/pulse/artificial-intelligence-as-a-software-as-a-medical-d-fedjajevs
tags: 
parent: "[[published]]"
source: 
related:
  - "[[med tech]]"
  - "[[Philips]]"
created: 2024/12/06
updated: 2025/05/01
---
%%
date:: [[2024-12-06]]
parent:: [[published]]
source::
related:: [[Philips]] [[med tech]] [[regulations]] [[Machine Learning MoC|Artificial Intelligence]]
tags::
%%
# [[Artificial-Intelligence-as-a-Software-as-a-Medical-Device]]
[Artificial-Intelligence-as-a-Software-as-a-Medical-Device](https://www.linkedin.com/pulse/artificial-intelligence-as-a-software-as-a-medical-d-fedjajevs/)

## Contents

- [[#Foreword about Software-as-a-Medical-Device|Foreword about Software-as-a-Medical-Device]]
- [[#AI\ML-enabled SaMD|AI\ML-enabled SaMD]]
	- [[#AI\ML-enabled SaMD#1. FDA Discussion paper|1. FDA Discussion paper]]
	- [[#AI\ML-enabled SaMD#2. Collecting feedback|2. Collecting feedback]]
	- [[#AI\ML-enabled SaMD#3. AI\ML action plan|3. AI\ML action plan]]
	- [[#AI\ML-enabled SaMD#4. AI\ML transparency workshop with 3800 participants|4. AI\ML transparency workshop with 3800 participants]]
	- [[#AI\ML-enabled SaMD#6. Good ML Practices|6. Good ML Practices]]
- [[#Resources|Resources]]

In an attempt to scrape the surface of the topic, this post is a structured list of what I have read, watched and understood. Compiled for beginners by a beginner.

## Foreword about Software-as-a-Medical-Device

Firstly, one needs to recall that SaMD is a "software intended to be used for one or more medical purposes that perform these purposes without being part of a hardware medical device"
([https://www.imdrf.org/sites/default/files/docs/imdrf/final/technical/imdrf-tech-131209-samd-key-definitions-140901.pdf](https://www.imdrf.org/sites/default/files/docs/imdrf/final/technical/imdrf-tech-131209-samd-key-definitions-140901.pdf)).
In essence, SaMD runs on external HW, not on a medical device itself. So, infusion pump or pacemakers controllers, electronic medical record systems are not SaMD (I came across the term SiMD as in Software-in-Medical-Device, but not totally sure it means exactly what it sounds to mean).

Examples of SaMD would be: software that can determine the right dosage of a drug or can detect a stroke event from recorded vital signs time-series, MRI image or else. More examples:
 [https://www.fda.gov/medical-devices/software-medical-device-samd/what-are-examples-software-medical-device](https://www.fda.gov/medical-devices/software-medical-device-samd/what-are-examples-software-medical-device). One can easily guess from evidence, that life-style apps, activity counters and such are **not** SaMD.
![[1673115503555.png|900]]
<sub>Source: https://eur-lex.europa.eu/legal-content/EN/TXT/PDF/?uri=CELEX:32017R0745</sub>

Medical devices are classified into Class I, II, III by intended use and potential harm - it is a 1D hierarchy where regulatory control follows the risk level: low - for lab equipment, moderate - for surgical clamps, high - for implanted devices. In case of SaMD classification becomes a 2D matrix governed by:

- Significance: what your software does (diagnoses, drives decisions or merely informs)
- Healthcare context: under which conditions it is supposed to happen (critical, serious or non-serious).

It is described in Rule 11 of the EU MDR: [https://eur-lex.europa.eu/legal-content/EN/TXT/PDF/?uri=CELEX:32017R0745](https://eur-lex.europa.eu/legal-content/EN/TXT/PDF/?uri=CELEX:32017R0745) and can be summarized in a table like this (everything not falling into the matrix is Class I):

![[1673115535076.png|600]]
<sub>Source: https://blog.cm-dm.com/pages/How-to-qualify%2C-classify-and-CE-mark-software</sub>

Some (tricky) examples of SaMD and not SaMD here: [https://openregulatory.com/mdcg-2021-24-examples-for-software-classification-of-software-as-a-medical-device-samd/](https://openregulatory.com/mdcg-2021-24-examples-for-software-classification-of-software-as-a-medical-device-samd/)

For instance: an app analyzing a user's heartbeat (e.g. for meditation) can be Class I, but if the intention is to inform a physician - it becomes Class II (a or b). Note, that even Apple Watch is detecting Afib, which is pretty serious condition, it is also not a MD. There is also a maintained (?) list of marketed Class I software: [https://openregulatory.com/mdr-class-i-software-situation/](https://openregulatory.com/mdr-class-i-software-situation/).

Fast-forwarding to SaMD regulatory framework ([https://www.imdrf.org/working-groups/software-medical-device-samd](https://www.imdrf.org/working-groups/software-medical-device-samd)), in order to develop "an app" aimed at healthcare uses one needs to:

- Develop a Quality Management System (QMS) following a standard
- Develop this app following another standard
- Perform clinical evaluation just another standard
- Established Post-Market Surveillance… ([https://blog.cm-dm.com/post/2022/05/13/Software-as-a-Medical-Device-Post-Market-Surveillance](https://blog.cm-dm.com/post/2022/05/13/Software-as-a-Medical-Device-Post-Market-Surveillance))

---

## AI\ML-enabled SaMD

So far I didn't mention AI\ML in the context of SaMD assuming involved algorithms being "locked". Such **SaMD typically requires a new pre-market submission every time either the intended use, associated risks or the algorithm itself have changed.**

![[1673115581248.png|900]]

Apparently, regulators want to make modification to the framework for continuously learning (AI\ML) algorithms to "embrace the iterative improvement power of AI/ML SaMD while assuring that patient safety is maintained".

![[1673115602853.png|900]]

Below I mention resources I accessed in the order they were created by the FDA activities. Most of this information follows the official slide deck:

![[1673115656748.png|900]]
<sub>Source: https://www.fda.gov/media/160125/download</sub>

### 1. FDA Discussion paper
[fda.gov/files/medical devices/published/US-FDA-Artificial-Intelligence-and-Machine-Learning-Discussion-Paper.pdf](https://www.fda.gov/files/medical%20devices/published/US-FDA-Artificial-Intelligence-and-Machine-Learning-Discussion-Paper.pdf)

The action started in 2019 with a discussion paper by the FDA. It proposes a 4-step approach for AI\ML SaMD to avoid new pre-market submission for pre-anticipated SaMD modifications. This whitepaper in essence:

1. Have a quality system in place and ensure Good ML Practices: acquire relevant datasets, don't mix training and testing samples, etc.
2. Submit a plan for anticipated modifications (SPS): "what the manufacturer intends the algorithm to become as it learns" and a plan (ACP) how the anticipated changes will be handled preserving safety and effectiveness (_**to my understanding this idea of "**__**pre-certification**__**" is the core of the whole proposal**_).
3. When modifications actually take place, if it is within bounds of a previously approved plan (above bullet-point), then it is possible to document the change and avoid new pre-market submission.
4. Real-world performance monitoring (akin to post-market surveillance): transparency, periodic reporting, gathering performance data

Here is their not-so-successful attempt to clearly visualize it:
![[1673115687238.png|700]]
### 2. Collecting feedback

The whitepaper is not a guidance or even its draft. It contains many open questions to be answered by interested parties together, which was realized by collecting public comments (154 at the moment).
[Regulations.gov](https://www.regulations.gov/docket/FDA-2019-N-1185/comments)

In overall, it is rather strange choice of evening-read, but _vox populi_ is a educative source of unconventional opinions.
![[1673115725860.png|700]]
<sub>Source: comments of Public Responsibility in Medicine and Research (PRIM&R)</sub>

My colleagues, who reached this line, might be interested in reading Philips proposals and concerns:
[https://downloads.regulations.gov/FDA-2019-N-1185-0104/attachment_1.pdf](https://downloads.regulations.gov/FDA-2019-N-1185-0104/attachment_1.pdf)

A short lyrical digression: J.A. Smith _et.al._ [https://bmjopen.bmj.com/content/bmjopen/10/10/e039969.full.pdf](https://bmjopen.bmj.com/content/bmjopen/10/10/e039969.full.pdf) did meta-analysis of those comments to find out that:

- Industry representatives accounted for >50% of respondents vs 17% from academia and only 10% from healthcare. Industry comments appear also the most lengthy (up to 30 pages, median 4)
- Citing scientific evidence was quite uncommon and is present in 18 out of 125 comments

Other means of collecting feedback for FDA was: Patient Engagement Committee meetings and related workshops\panel discussions on the topic of AI-guided image acquisition: [FDA Public Workshop | AI in Imaging | Public Health & AI Imaging Regulation Discussion Panel](https://www.youtube.com/watch?v=1HlMhTntK_4) (71 YouTube views, must be fascinating).

### 3. AI\ML action plan

In early 2021 the [[FDA]] followed up with the response\action plan:
[fda.gov/media/145022/download](https://www.fda.gov/media/145022/download)

According to that FDA committed to:
- work on a draft guidance for anticipated modifications plan (SPS and ACP above)
- align Good ML Practices with other existing standards
- elaborate more on how to ensure transparency for SaMD and how to monitor their real-world performance

### 4. AI\ML transparency workshop with 3800 participants
[Page Not Found | FDA](https://www.fda.gov/medical-devices/workshops-conferences-medical-devices/virtual-public-workshop-transparency-artificial-intelligencemachine-learning-enabled-medical-devices)
Working definition of transparency: "_Degree to which appropriate information about a device – including its intended use, development, performance, and, when available, logic – is clearly communicated to stakeholders._"

Judging from presentations' titles, impressive diversity of topics discussed: from more abstract ones about how to promote healthcare equity to listing specific Python packages facilitating AI interpretability.

[Artificial Intelligence and Machine Learning (AI/ML)-Enabled Medical Devices | FDA](https://www.fda.gov/medical-devices/software-medical-device-samd/artificial-intelligence-and-machine-learning-aiml-enabled-medical-devices)
Each entry contains SaMD info and official FDA correspondence outlining their (approving) decision. One can find lots of public info like device classification, intended use, comparison to reference or predicate device, clinical evaluation setup and performance, etc. Very nice source of information on the state of the art in regulations.

Obviously, someone (E. Wu _et. al._) analyzed all that info and published a paper [https://www.nature.com/articles/s41591-021-01312-x](https://www.nature.com/articles/s41591-021-01312-x) (and an interactive visual [https://ericwu09.github.io/medical-ai-evaluation/](https://ericwu09.github.io/medical-ai-evaluation/) ), which makes several disputable remarks hinting that _we are not there yet_:

![[1673115943969.png|700]]
![[1673115958565.png|700]]

### 6. Good ML Practices

Quite recently GMLP were substantiated by the following principles and their explanations.
[fda.gov/media/153486/download](https://www.fda.gov/media/153486/download)
![[1673116072232.png|700]]

A lot to discuss here, for instance, that:

- performance should be considered taking into account Human-AI collaboration if present, not the AI model only.
- FDA expands a bit on what "essential information" can be for the user (known limitations, acceptable inputs, etc.), which emphasizes the big challenge of interpretability and sub-population bias reporting once again.
- Post-deployment monitoring importance (as if FDA can come back any time after product launch and request updated performance metrics)

So many questions, so few answers... hopefully, it was practical or entertaining read.

## Resources
- https://jelvix.com/blog/software-as-a-medical-device-samd
- https://www.youtube.com/watch?v=VbxXAjypSEQ
- https://www.youtube.com/watch?v=zu9r2Zsto58

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
