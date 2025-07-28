---
cssclasses: 
aliases: 
permalink: LLM/what-can-go-wrong-with-llm
publish: "true"
"date:": "[[2024-12-30]]"
link: https://fluentnumbers.medium.com/what-can-go-wrong-with-llms-9326959621a7
tags: 
parent: "[[LLM]]"
source: 
related:
  - "[[tokenization|embedding]]"
  - "[[Retrieval-Augmented Generation|RAG]]"
  - "[[published]]"
created: 2024/12/30
updated: 2025/07/26
---
%%
date:: [[2024-12-30]]
parent:: [[LLM]]
source::
related:: [[tokenization|embedding]] [[Retrieval-Augmented Generation|RAG]] [[published]]
tags::
%%
# [[what can go wrong with LLMs]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Contents

- [[#Hallucinations|Hallucinations]]
	- [[#Hallucinations#Fake answers when they don't know|Fake answers when they don't know]]
	- [[#Hallucinations#Blindly trust any available source|Blindly trust any available source]]
	- [[#Hallucinations#Undefined behavior due to contradictory sources|Undefined behavior due to contradictory sources]]
- [[#Embeddings|Embeddings]]
	- [[#Embeddings#Numerical instability|Numerical instability]]
	- [[#Embeddings#Cosine similarity is not always the best choice|Cosine similarity is not always the best choice]]
- [[#Tokenization|Tokenization]]
- [[#Context|Context]]
	- [[#Context#Lost-in-the-middle-effect|Lost-in-the-middle-effect]]
	- [[#Context#Context in different language|Context in different language]]
- [[#Other|Other]]
- [[#Resources|Resources]]

## Hallucinations
[[hallucination]]
Assume the documents we query are unique, LLM wasn't trained on them and can't know the answer itself. Let's do a quick test on SotA models (**without internet access**) and ask it a simple question about the Heroes of Might and Magic 3.
`How much damage do Dendroids inflict in HoMM3? Answer with one number range or N/A only.`. The true answer is [10-14](https://heroes.thelazy.net/index.php/Dendroid_Guard_and_Dendroid_Soldier).

### Fake answers when they don't know
Chatbots may invent the answer. The correct behavior in the absence of any additional inputs is to admit the lack of knowledge, but it doesn't always happens so. It depends on the model, of course, As in the example below, gpt-4o-mini does it right.

> [!figure]-
> ![[Pasted image 20250507091150.png]]
>
> ![[Pasted image 20250507091247.png]]

### Blindly trust any available source
Chatbots will trust any information it can reach internally or on the web. Although, technically correct extraction, this information can be factually wrong.

> [!figure]-
> ![[Pasted image 20250507091354.png]]

### Undefined behavior due to contradictory sources
In presence of several information sources with potential answers chatbots can rely on one or the other unpredictably, or disobey the output format.

> [!figure]-
> ![[Pasted image 20250507091707.png]]

---
## Embeddings
### Numerical instability
[[tokenization|embedding]] operation may [return different vectors for the same text input and model](https://community.openai.com/t/why-openai-embedding-return-different-vectors-for-the-same-text-input/144495).
> Embeddings only return vectors. The vector is **the same for the same input, same model, and the same API endpoint**.
> But we have seen differences between the OpenAI endpoint and the Azure endpoint for the same model. So a pick an endpoint and stick with it to avoid any differences.
> **There could be very slight roundoff errors** in the embedding when calling it over and over for the same (above) configuration, but this is in the noise and won’t effect your search result.

As per the quote, not only the input must be the same and the same model **release**, but also the API endpoint. Calling the same embedding model (like `text-embeddings-3-large`) an Azure endpoint and OpenAI endpoint might yield different results. But even then, there might be some rounding differences in returned embeddings. This doesn't sound like a big issue because it should not affect the overall performance later in the pipeline, But for the developers, writing unit tests this can cause some headache if they, for instance, compute SHA values of embeddings.

> [!NOTE]- Code
> ```python
> client = OpenAI()
> text = f"The Tesla company achieved a record production of 1.5 million vehicles in 2023, reflecting a growth rate of 20% compared to 2022."
> 
> def compute_fingerprint(embedding):
>     hash_obj = hashlib.sha256()
>     hash_obj.update(np.array(embedding))
>     return hash_obj.hexdigest()
> 
> embeddings = []
> for i in range(5):
>     embedding = client.embeddings.create(input=[text], model="text-embedding-3-large").data[0].embedding
>     embeddings.append(embedding)
> 
> for e in embeddings:
>     print(compute_fingerprint(e))
> ```

> [!NOTE]- Ouput
> ```bash
> abf808061b95c6ede71222df465c4604070fd1aab0da16376760bd056d5419bc 
> 1fa6d80f438fb865258ce9f30db3875bd741505104aa1ae561c5b6bb7ac6acdc 
> 1fa6d80f438fb865258ce9f30db3875bd741505104aa1ae561c5b6bb7ac6acdc 
> 43501ed2ef1db207e059b33053eb04c347c893131b7e01bc4f52f2b41a4c7a21 
> 43501ed2ef1db207e059b33053eb04c347c893131b7e01bc4f52f2b41a4c7a21
> ```

---

### Cosine similarity is not always the best choice
[[cosine similarity]] search works non-intuitively for us, and may fail unexpectedly in cases where simple string match search would not. In the example below, cosine similarity of a text vs a small, but **exact** chunk of it returns values below widely used threshold. For that reason, number one rule for [[information retrieval]] systems is to use [[Advanced RAG techniques#^f44082|hybrid search]].

> [!NOTE]- Code
> ```python
> text = f"The Tesla company achieved a record production of 1.5 million vehicles in 2023, reflecting a growth rate of 20% compared to 2022. All revenue streams reported growth, except for the Autonomous Driving, which still is in the development phase."
> 
> areas = "Autonomous Driving, Electric Vehicles, Renewable Energy, Autonomous Driving, Battery Technology, Automotive Industry"
> 
> def cosine_similarity(a, b) -> np.double:
>     return np.dot(a, b) / (np.linalg.norm(a) * np.linalg.norm(b))
> 
> 
> def compute_embeddings(texts):
>     result = client.embeddings.create(input =texts, model="text-embedding-3-large")
>     return [d.embedding for d in result.data]
> 
> for area in areas.split(", "):
>     txt = text.replace("Autonomous Driving", area)
>     print(f'...{txt[110:220]}...')
>     print(area)
>     a, b = compute_embeddings([area, txt])
>     distance = cosine_similarity(a, b)
>     result = 'FOUND' if distance > 0.6 else 'NOT FOUND'
>     print(f"distance:{distance:0.2f}. {result}")
>     print("--------------------------------")
> ```

> [!NOTE]- Output
> ```bash
> ...% compared to 2022. All revenue streams reported growth, except for the Autonomous Driving, which still is in ...
> VS
> Autonomous Driving
> distance:0.35. NOT FOUND
> --------------------------------
> ...% compared to 2022. All revenue streams reported growth, except for the Electric Vehicles, which still is in t...
> VS
> Electric Vehicles
> distance:0.41. NOT FOUND
> --------------------------------
> ...% compared to 2022. All revenue streams reported growth, except for the Renewable Energy, which still is in th...
> VS
> Renewable Energy
> distance:0.31. NOT FOUND
> --------------------------------
> ...% compared to 2022. All revenue streams reported growth, except for the Autonomous Driving, which still is in ...
> VS
> Autonomous Driving
> distance:0.35. NOT FOUND
> --------------------------------
> ...% compared to 2022. All revenue streams reported growth, except for the Battery Technology, which still is in ...
> VS
> Battery Technology
> distance:0.36. NOT FOUND
> --------------------------------
> ...% compared to 2022. All revenue streams reported growth, except for the Automotive Industry, which still is in...
> VS
> Automotive Industry
> distance:0.43. NOT FOUND
> --------------------------------
> ```

----

## Tokenization
![[tokenization#Common issues due to tokenization]]
## Context
### Lost-in-the-middle-effect
![[Lost in the Middle effect#Note]]
### Context in different language
Often databases may contain information in multiple languages, other than the user query. Not to miss out on relevant chunks of context, use [[query expansion]] [[Enterprise RAG patterns|pattern]]

## Other
- 
## Resources
-

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
