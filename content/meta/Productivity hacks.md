---
cssclasses: 
aliases:
  - productivity hacks
  - productivity hack
permalink: meta/productivity-hacks
publish: "true"
"date:": "[[2025-06-27]]"
link: 
tags: [0]
parent: "[[productivity]]"
source: 
related:
  - "[[Lifehacks MoC]]"
created_date: 2025/06/27
updated_date: 2025/06/27
created: 2025/06/27
updated: 2025/08/20
---
%%
date:: [[2025-06-27]]
parent:: [[productivity]]
source::
related:: [[Lifehacks MoC]]
tags::
%%
# [[Productivity hacks]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Tools

> [!NOTE] RULE #0
> ==None of the hacks work when you are tired or bored.== Before switching off notifications on your smartphone (which is a great step btw), solve the real problem. Some even say that [“eliminate the distractions” is the worst productivity advice I’ve ever seen](https://guzey.com/productivity/#interlude-eliminate-the-distractions-is-the-worst-productivity-advice-ive-ever-seen)

^66e582

- add any worthy [[Youtube]] videos into the *Watch Later* list. Only watch videos from **that** list and never from the algorithmic stream. That helps reducing impulsive binge watching.
- Collect your favorite digital sources into one [[rss]] feed (yes, RSS is still alive in 2025!). Most of the websites, blogs and news outlets have a rss feed, even Telegram chats, public Facebook pages and Twitter accounts (with certain hacks) can be followed in one place. Set update frequency to twice a day.
	- [RSS-Bridge](https://rss-bridge.org/bridge01/)
	- You can deploy a [[self-hosted]] rss like [FreshRSS](https://github.com/FreshRSS/FreshRSS) or use a subscription-based service
- Minimalistic launcher for your smartphone. I use [Olauncher](https://play.google.com/store/apps/details?id=app.olauncher&hl=en). No fancy icons designed so that users click on them more often.
- Various app blockers and usage monitors. E.g. [Stay Focused](https://play.google.com/store/apps/details?id=com.stayfocused&hl=en) or [one sec](https://play.google.com/store/apps/details?id=wtf.riedel.onesec) for Android or [Cold Turkey - Features](https://getcoldturkey.com/features/) for PC, but I don't find them particularly effective, especially see [[#^66e582|Rule #0]]. If you have to fight yourself playing a dumb arcade game or updating the same website for the 100th time - you are already doing it in a wrong way.
- Journaling works very well for me. [[PKM|obsidian]] is a great tool for [[PKM|personal knowledge management]]. One can keep the desired level of organization, but even with that set to None and also None extra time spent - it is still relatively easy to go back and find something you didn't even know was written down by you.
- Do not type. Talk. Voice-to-text models like Whisper made tremendous advances in recent years and are easily wrapped into applications allowing you to type less. Everywhere. UX-wise there are decent tools out there (e.g. https://whispertyping.com/), but if privacy concern is important for you, luckily, there are [[self-hosted]] alternatives - [pluja\whishper](https://github.com/pluja/whishper), [aschmelyun\subvert](https://github.com/aschmelyun/subvert)
- [The Optimal iPhone Settings and Best Apps for Productivity, Focus, and Health](https://medium.com/better-humans/how-to-set-up-your-iphone-for-productivity-focus-and-your-own-longevity-bb27a68cc3d8)
- switch smartphone screen into B&W mode

---

## Tricks
- A trick to getting started is just to tell yourself you're just going to do 5 minutes and then you can stop. To help with this you can leave a typo in your last commit then your first task is to `git commit --amend` to fix it. Or you can leave a unit test failing with a trivial fix. Anything to just get you to open the editor and start typing. https://www.reddit.com/r/productivity/comments/13m5cxh/how_do_i_get_into_a_flow_state_at_work/
- ==vigorously delete from your feed any content creators, who post bullshit, AI-generated slope, anything that thrives on people FOMO==
- learn to distinguish news and events. Events do have consequences. News are irrelevant.

## Resources

- [[Джедайские техники - Максим Дорофеев]]
	- https://youtube.com/@maximdorofeev
- blogs
	- [How I Am Productive — LessWrong](https://www.lesswrong.com/posts/JTHe5oGvdj6T73o4o/how-i-am-productive)
	- - [Every productivity thought I've ever had, as concisely as possible - Alexey Guzey](https://guzey.com/productivity/)
- books
	- [How to Fail at Almost Everything and Still Win Big](https://www.amazon.com/How-Fail-Almost-Everything-Still-ebook/dp/B00COOFBA4?ie=UTF8&linkCode=sl1&tag=guzeycom-20&linkId=b1c9c7e3beb365677388aafdd77f362b&language=en_US)
---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
