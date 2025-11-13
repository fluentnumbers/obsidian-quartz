---
cssclasses:
aliases:
permalink: AI/generative-ai-system-design-interview
publish: true
"date:": "[[2025-09-26]]"
link:
tags:
parent: "[[Generative AI System Design Interview - Ali Aminian (Computer scientist) Hao Sheng (Researcher in computational mathematics)]]"
source:
related:
  - "[[Interview questions|interview preparation]]"
  - "[[paper review|book review]]"
  - "[[How to answer the MLOps pipeline interview question]]"
created: 2025/09/26
updated: 2025/10/25
---
%%
date:: [[2025-09-26]]
parent:: [[Generative AI System Design Interview - Ali Aminian (Computer scientist) Hao Sheng (Researcher in computational mathematics)]]
source::
related:: [[Interview questions|interview preparation]] [[paper review|book review]] [[How to answer the MLOps pipeline interview question]]
tags::
%%
# [[Generative AI System Design Interview - Chapter 1 - Introduction and Overview]]
<sub>scroll ↓ to [[#Resources]]</sub>

## Contents

- [[#GenAI overview|GenAI overview]]
	- [[#GenAI overview#Discriminative|Discriminative]]
	- [[#GenAI overview#Generative|Generative]]
	- [[#GenAI overview#Three pillars of GenAI|Three pillars of GenAI]]
		- [[#Three pillars of GenAI#Data|Data]]
		- [[#Three pillars of GenAI#Model capacity|Model capacity]]
		- [[#Three pillars of GenAI#Compute|Compute]]
		- [[#Three pillars of GenAI#Scaling laws|Scaling laws]]
- [[#Framework for ML system design interviews|Framework for ML system design interviews]]
	- [[#Framework for ML system design interviews#Clarifying requirements|Clarifying requirements]]
		- [[#Clarifying requirements#Functional requirements|Functional requirements]]
		- [[#Clarifying requirements#Non-functional requirements|Non-functional requirements]]
	- [[#Framework for ML system design interviews#Framing the problem as an ML task|Framing the problem as an ML task]]
	- [[#Framework for ML system design interviews#Data preparation|Data preparation]]
		- [[#Data preparation#Data collection|Data collection]]
		- [[#Data preparation#Data cleaning|Data cleaning]]
		- [[#Data preparation#Data efficiency|Data efficiency]]
	- [[#Framework for ML system design interviews#Model development|Model development]]
		- [[#Model development#Model architecture|Model architecture]]
		- [[#Model development#Model training|Model training]]
			- [[#Model training#Methodology|Methodology]]
			- [[#Model training#Data|Data]]
			- [[#Model training#Loss and ML objectives|Loss and ML objectives]]
			- [[#Model training#Task-specific challenges and mitigations|Task-specific challenges and mitigations]]
			- [[#Model training#Model inference|Model inference]]
	- [[#Framework for ML system design interviews#Evaluation|Evaluation]]
		- [[#Evaluation#Offline Evaluation|Offline Evaluation]]
		- [[#Evaluation#Online Evaluation|Online Evaluation]]
	- [[#Framework for ML system design interviews#Overall ML system design|Overall ML system design]]
	- [[#Framework for ML system design interviews#Deployment and monitoring|Deployment and monitoring]]
- [[#Resources|Resources]]

## GenAI overview
- AI >> ML
- ML models can be discriminative or generative
### Discriminative
- learn [[conditional probability|conditional probabilities]] $P(target|features)$ to regress\classify the target
- ==do not learn underlying data distribution to generate new representative instances==
- example algorithms
	- [[logistic regression]]
	- [[SVM]]
	- [[decision tree]]
	- [[k-nearest neighbors|kNN]]
	- [[deep learning|neural network]]
- applications
	- [[image segmentation]]
	- [[object detection]]
	- speech recognition
	- [[recommendation system]]
	- [[named entity recognition]]
### Generative
- Learn the distribution of input data $P(x)$ (e.g. for Image\Text generation tasks) or the joint $P(X,Y)$ for sequence-to-sequence generation (text-to-image, translation, text-to-sql, etc.)
- Classical
	- [[naive bayes]]
	- Gaussian mixture models (GMM)
	- Hidden Markov models (HMM)
- Modern
	- [[variational autoencoder]](VAEs)
		- [[autoencoder]] encodes data distribution --> latent space
		- [[decoder]] reconstructs
	- [[Generative adversarial network]] (GANs)
		- Generator and discriminator are trained in parallel trying to compete with each other: One synthetizes *realistic* data, another one tries to distinguish [[synthetic data]] from the actual real data.
	- Diffusion models
- Applications
	- [[how to evaluate LLM chatbots|chatbots]]
	- summarization
	- content creation
	- Text-to-video\image\audio\another language
	- synthesis of anything generic or very specific

### Three pillars of GenAI
- Data, model capacity, compute
- [[scaling laws]]
	- ==experimentally derived== dependency between the number of parameters, training data tokens and best performance (lowest loss)
#### Data
- in [[#Discriminative]] ML specific tasks require specific datasets which are costly to acquire
- GenAI is ==self-supervised learning==
	- can employ vast amounts of ==unstructured== data from the internet, ==no [[data labeling]]==
	- modern models like [[paper review - Llama 3 Herd of Models|LLama 3]] are pre-trained on tens of trillions tokens
#### Model capacity
- Measured by the number of parameters and FLOPs (Floating Point Operations))
	- [[neural network architecture]] defines whether more parameters will actually lead to more FLOPs (e.g. fully connected layers vs [[convolutional network]] or [[Mixture-of-Experts]] )
- Number of parameters
	- can exceed 500 billions
	- [Exponential growth of parameters in notable AI systems](https://ourworldindata.org/grapher/exponential-growth-of-parameters-in-notable-ai-systems?time=2020-03-17..latest&country=)
- FLOPs count
	- counting the floating-point operations required to complete a forward pass (single output token generation)
	- For example a single fully-connected layer with 4-to-3 neurons requires 21 FLOPs
	- 
#### Compute
- also measured in FLOPs, but now as the total number of operations needed to ==train== the model
- modern [[GPU characteristics|GPU]] can deliver up to 60 teraflops per second, but training modern models on a single GPU still takes years and cost >$100 mil

#### Scaling laws
- improvement in performance can be predicted from model size, dataset size, or computational resources increase
- previously models were not large enough for the amount of data, as these two should scale linearly

## Framework for ML system design interviews
1. [[#Clarifying requirements]]
2. [[#Framing the problem as an ML task]]
3. [[#Data preparation]]
4. [[#Model development]]
5. [[#Evaluation]]
6. [[#Overall ML system design]]
7. [[#Deployment and monitoring]]

### Clarifying requirements
#### Functional requirements
- What the system should do? Which functionality should be present?
- Shape the high level architecture
- Examples
	- [[chatbot]]: `Based on a user's request, the system searches internal documents, retrieves only contextually appropriate information, and generates a draft response for the user.`
	- [[Harmful content detection system]]: `The system must moderate generated content to filter out harmful, biased, or inappropriate output before showing it to the user`
	- [[intent recognition]]: `The system must interpret user intent by analyzing and extracting entities and context from the input text`
	- [[AI use-case - Fitness app]]: `The system must analyze video recordings of users' gym training and give advice on technique, create exercise and meal plans`
#### Non-functional requirements
- focus on ==how the system performs, NOT what it does==
- Consider performance, scalability, business objectives, data requirements, architecture constraints, usability, security, ethics, reproducibility, etc
- Examples
	- minimum acceptable speech generation speed
	- [[GDPR]] compliance of the whole system
	- [[chatbot]] language support
	- an average new user must be able to get first generated image in under N minutes
	- support for peak load under X concurrent users with max degradation of response time of Y%, no output quality degradation
	- 
### Framing the problem as an ML task
- Is ML\AI needed to solve the problem?
- Define system inputs and outputs ==based on the requirements==?
	- modality (image, text, audio,...)
	- should that be a single model or specializaed ones?
- Choose a suitable ML approach
	- [[#Discriminative]] vs [[#Generative]]
		- choice defined by the system output
	- Identify the task type
		- Discriminative: [[classification]] or [[regression]]
		- Generative: generation of what - text, image, video, audio
	- select an algorithm
		- ability to handle input mentalities
		- What are the specific trade-offs between different algorithms in terms of quality, efficiency, and ease of use?
		- Is the chosen approach scalable and flexible enough to accommodate future changes or additions to the system's capabilities?
		- How easily can the system adapt if new input modalities or outputs are introduced later?
### Data preparation
- Structured data
	- categorical
	- numerical
	- ordinal
- Unstructured data
	- Emails, social media posts, multimedia data, pdfs

#### Data collection
- Data scraping from the Internet and other sources like books
- 
- [[synthetic data]] generation to use in training later
	- + Improving data diversity, helping with imbalanced datasets
	- - quality of generated data depends on the model, is a GenAI project by itself and may not capture complexity of the real world scenarios

#### Data cleaning
- filter out:
	- data-inherent biases: demographic, geographic
	- [[cognitive bias]]
	- misinformation
	- [[Harmful content detection system|harmful or inappropriate]]
	- sensitive information
		- How sensitive is the data (e.g., personal, financial, medical)? Is anonymization necessary to protect sensitive information?
	- low quality and noisy
		- What is the definition of noisy data? Are there outliers?
- 
#### Data efficiency
- How to ensure efficient storage and processing?
	- Consider [[Hadoop]], [[caching]], [[batching]], sharding and other data engineering techniques
### Model development
#### Model architecture
- explore different architectural options and weigh their advantages and disadvantages
	- [[Model selection and training]]
- discuss how the input is transformed into the output
- [[Tech - Tricky interview questions|tricky interview questions]]: how to modify the architecture to support a new feature?
	- [[image generation]]: how to let users control the style of generated images
	- text-to-video: control the direction of motion (e.g., left to right) during generation
- canonical architecture question could be about [[attention|self-attention]]

#### Model training
- [[model training]] discusses methodology, data, [[loss function]] and Task-specific challenges and their mitigations
- See [[paper review - Llama 3 Herd of Models]] for an example
##### Methodology
- diffusion models gradually denoise data to generate high-quality samples from noise
- GANs rely on adversarial training, where a generator and a discriminator compete to improve over time
- [[transformer]] uses [[tokenization|embeddings]] representation and [[attention]] mechanism
- in practice, LLMs undergo multi-stage training
	- pretraining on large datasets to learn general patterns
	- [[supervised finetuning]] to adapt to the specific task
	-  [[alignment]] stage to ensure outputs align with human values or intended behaviors

##### Data
- data sources, volumes and quality differs per stage
	- public data for pretraining vs carefully curated proprietary data for alignment
	- [[#Functional requirements]] play a big role in identifying useful data: languages, coding knowledge, etc.

##### Loss and ML objectives
- ML objective: how does it impact performance
	- [[variational autoencoder]] strives to reconstruct the original images
	- [[LLM]] is tasked to predict the next token
- [[loss function]]
	- available many options for different cases, but creating a custom one is complex. but possible
	- can differ and be influenced by business requirements or the task at hand
		- [[image retrieval|object retrieval]] requires [[triplet loss]] with both negative and positive example in addition to the anchor
	- may be updated with [[regularization]] terms
- [[Interview questions]]
	- What is the loss function that aligns with the chosen ML objective? Do you use a single loss function or multiple ones? If multiple, how do you combine them to optimize the training process? What is the purpose of each loss function?
##### Task-specific challenges and mitigations
- For resource-heavy tasks like [[video generation]] or training LLMs from scratch
- [[mixed precision training]] uses both 16-bit (half-precision) and 32-bit (single-precision) floating point numbers to speed up model training and reduce memory usage.
- latent diffusion models
- [[gradient checkpointing]] to reduce memory usage during model training by saving only a selected subset of activations. During the backward pass, the missing activations are recomputed.
- parallelization techniques, [[distributed computing]] enable efficient training of large models by utilizing multiple machines or devices in parallel.
	- data parallelism
	- Model parallelism
	- Hybrid parallelism
- [[Interview questions]]
	- What are typical training challenges specific to the chosen ML algorithm? How can these challenges be mitigated to ensure effective training?
##### Model inference
- [[decoding strategy|sampling strategy]] for generating new data or outputs from the trained generative model
- See also [[inference optimization]]
- [[Interview questions]]
	- How do different [[decoding strategy|sampling strategy]] (e.g., top-k, top-p) work? What are the pros and cons of each? How does the sampling process work? How do they affect the quality and creativity of the model's output? What methods can you use to make the sampling process faster without compromising quality?

### Evaluation

#### Offline Evaluation
- [[model evaluation]] on pre-collected data, before putting into production
	- GenAI applications assume evaluating ==generated content without fixed ground truth label==
		- [[LLM-as-a-judge]]
		- subjective or [[human-in-the-loop]] methods to gauge how well it aligns with human expectations or benchmarks
	- [[LLM metric|LLM metrics]]
- essential to ==assess the generated content from multiple angles==
	- [[text-to-image]]: ensure the generated image is both high-quality and that it aligns with the given text prompt
	- [[chatbot]]: capability across different tasks such as mathematics, common-sense reasoning, and code generation
- [[Interview questions]]
	- Which offline metrics best evaluate the quality and accuracy of the generative model? How do these metrics measure the diversity, realism, and coherence of generated outputs?
	- For generative models, especially in creative fields (e.g., text generation, image synthesis), human feedback is vital. How can human reviewers complement automatic evaluation? What methods (surveys, A/B testing, expert reviews) will best assess the model’s performance? How can you mitigate the effects of subjectivity among different reviewers?
#### Online Evaluation
- assesses how the model performs in production (i.e., after deployment)
- choosing online metrics is more subjective and requires input from product owners and stakeholders
- Examples of [[LLM metrics]]:
	- Click-Through Rate (CTR): Percentage of users who click on content or suggestions.
	- Conversion Rate: Percentage of users who complete a desired action (e.g., purchase, subscription) after interacting with the system.
	- [[latency]] (Inference time):	Time taken by the model to generate content.
	- Engagement Rate: Measure of user interaction, such as time spent engaging with the system.
	- Revenue Per User: Average revenue generated per user.
	- Churn Rate: Percentage of users who stop using the system over a given period.
	- User Satisfaction: Direct feedback from users on their experience with AI-generated content.
	- User Retention: Percentage of users who continue to use the system over a specific period.
	- Completion Rate: Percentage of tasks (e.g., text completions, image generations) successfully completed by the model.
- [[Interview questions]]
	- Which metrics are crucial for assessing the effectiveness of the generative model in a live production environment? How do these metrics align with the business goals, such as enhancing user creativity, boosting engagement, or driving product innovation?
### Overall ML system design
### Deployment and monitoring

## Resources
- 


---

![[base - related.base]]

---
###### Links to this File
```dataview
table file.inlinks, filter(file.outlinks, (x) => !contains(string(x), ".jpg") AND !contains(string(x), ".pdf") AND !contains(string(x), ".png")) as "Outlinks" from [[]] and !outgoing([[]])  AND -"Changelog"
```
