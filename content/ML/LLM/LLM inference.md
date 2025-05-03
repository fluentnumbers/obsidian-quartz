---
cssclasses: 
aliases: 
permalink: note/llm-inference
publish: true
"date:": "[[2024-11-03]]"
link: 
tags: 
parent: "[[LLM]]"
source: 
related:
  - "[[GPU]]"
created: 2024/11/03
updated: 2025/05/01
---
%%
date:: [[2024-11-03]]
parent:: [[LLM]]
source::
related::
tags::
%%
# [[LLM inference]]
<sub>scroll ↓ to [[#Resources]]</sub>

- [[#Note|Note]]
- [[#Inference engine|Inference engine]]
	- [[#Inference engine#LLM request flow|LLM request flow]]
	- [[#Inference engine#Libraries and tools for inference|Libraries and tools for inference]]
- [[#Inference metrics and LLM monitoring|Inference metrics and LLM monitoring]]
- [[#Inference math|Inference math]]
	- [[#Inference math#Memory-bound and Compute-bound Programs|Memory-bound and Compute-bound Programs]]
		- [[#Memory-bound and Compute-bound Programs#Memory-bound regime|Memory-bound regime]]
	- [[#Inference math#Batching|Batching]]
	- [[#Inference math#Memory consumption|Memory consumption]]
	- [[#Inference math#FLOPs needed to generate one token|FLOPs needed to generate one token]]
	- [[#Inference math#LLM throughput|LLM throughput]]
		- [[#LLM throughput#The optimal batch size|The optimal batch size]]
- [[#Inference Optimization|Inference Optimization]]
- [[#Resources|Resources]]

## Note
- Inference process contains three steps
	- **Downloading** the model weights from a cloud storage (Hugging Face) to the drive, where you plan to run your LLM
	- **Loading** downloaded weights into RAM or GPU memory.
	- **Generating** new tokens which are concatenated into the output sequence.
- During the generation step, there are two stages, **prompt processing** and **autoregressive decoding**.
	- Prompt processing results in the generation of the first token in the output sequence and is generally *compute-bound*, because of large matrix operations on many tokens in parallel.
	- Next, during the autoregressive decoding, tokens are generated one by one. This process cannot be parallelized, so each token is computed sequentially, hence, it is *memory-bound* The decoding continues until either an **End Of Sequence (EOS)** token is generated or the maximum sequence length is reached. ^62c056
- [[#Inference engine]] manages the interaction between a user and a hosted LLM.

## Inference engine
### LLM request flow

> [!NOTE]- Request flow
> 1. **The client application formulates a request** containing parameters like the input context and generation options.
> 2. **The request is sent** to the Inference Engine's endpoint using a protocol like HTTP or gRPC.
> 3. **Scheduling and batching**: The scheduler queues incoming requests and determines when they will be processed. Requests may be grouped into batches to optimize computational resources. In some cases, a request might be partially processed and then deferred due to resource constraints or scheduling policies.
> 4. **Model inference**: The model performs a forward pass on the current batch of requests to generate a next token.
> 5. **Output processing**: The generated tokens are processed and converted into human-readable text.
> 6. **The system checks if the generation should stop** — either because an End-of-Sequence (EOS) token is generated or the maximum number of new tokens limit is reached. **The response is then prepared**, containing the generated text and any relevant metadata (e.g., reasons for finishing, token probabilities).
> 7. While the Inference Engine is running, **it provides ways to monitor its performance**, such as logs or metrics in Prometheus format.
> ![[3.8.1 EN.png|800]]

### Libraries and tools for inference
- There are numerous tools for LLM inference, perhaps **vLLM** is one of the best choices for [[deployment]]: [GitHub - vllm-project/vllm: A high-throughput and memory-efficient inference and serving engine for LLMs](https://github.com/vllm-project/vllm)
	- supports all popular models, including multimodal
	- supports [[quantization]] out of the box
	- built-in monitoring with [[Prometheus]]
	- API compatible with OpenAI standards
	- [Deploying vLLM: a Step-by-Step Guide](https://ploomber.io/blog/vllm-deploy/)
- But there are other options:
	- [GitHub - ollama/ollama: Get up and running with Llama 3.2, Mistral, Gemma 2, and other large language models.](https://github.com/ollama/ollama)
	- [GitHub - ggerganov/llama.cpp: LLM inference in C/C++](https://github.com/ggerganov/llama.cpp)
	- [Text Generation Inference](https://huggingface.co/docs/text-generation-inference/en/index)
- One can also look at [[benchmark]]s: [Benchmarking LLM Inference Backends](https://www.bentoml.com/blog/benchmarking-llm-inference-backends)
- Also see the *awesome* list of all LLM-tools [awesome-ml/llm-tools.md at master · underlines/awesome-ml · GitHub](https://github.com/underlines/awesome-ml/blob/master/llm-tools.md)

## Inference metrics and LLM monitoring
- The most important LLM metrics are
	- **[[throughput]]**: the number of requests or tokens an LLM can process per second. Increasing throughput allows the system to handle more tokens and requests in the same amount of time, improving overall efficiency. The **peak throughput** is the maximum throughput the model can achieve. It depends on several factors, including the model's architecture, size, and the underlying hardware.
		- ==throughput is synonymous to **cost** in this context==
	- **[[latency]]**: the time elapsed from when a user makes a request until the LLM provides a response. This metric is especially critical in real-time and interactive applications, such as chatbots and real-time systems, where quick response times are crucial.
		- monitored via [[LLM metric]] such as:
			- average time for a single end-to-end LLM request in seconds
			- Processing speed of input tokens versus generation speed of output tokens as in *3500 prompt tokens per second vs 350 generated ones*
			- average **time-to-first-token** in relation to the time required to generate a single output token
	- **Cost**: the amount of money spent to process a request. If not completely the same, ==this is synonymous to the throughput==.

> [!NOTE]- Additional metrics
> - Time to first token - how long users wait until seeing something
> - number of tokens generated per second
> - Resource Utilization. [[GPU]], CPU, RAM, Input\Output.
> - User feedback in the format of like\dislike or side-by-side model comparison
> - Input prompts and their evolution over time, how much are they alike to reference prompts from the test set
> - Logs - RAG requests, System I\O, agents' actions, etc.
> - How often a model declines to provide an answer for any reason like harmfulness, security, etc.?

---
- [[Prometheus]] and [[Grafana]] are too powerful tools for ML monitoring and visualization
	- Prometheus acts as a data collector and a database
	- Grafana presents that data in a way that's easy to understand and interpret
![[3.9.2 EN.png|600]]
## Inference math
- See [[GPU characteristics]]
### Memory-bound and Compute-bound Programs
- **Compute-bound program**: Its execution time mostly depends on the time spent on calculations (matrix multiplication). To speed it up, one needs a more powerful compute engine.
- **Memory-bound program**: Its execution time primarily depends on the speed of data movement (matrix transpose). To speed it up, one needs to increase memory bandwidth.
- Certain optimizations, parameters, and hardware used can affect whether the LLM performs in the memory-bound or compute-bound regime. LLM inference is predominantly **memory-bound**. To improve inference speed, focusing on optimizing memory movement is more effective than enhancing computational performance.

#### Memory-bound regime
- The time spent on data movement is significantly greater than the time spent on calculations.
- The time for data movement does not depend on batch size.
- Model [[throughput]] increases almost linearly, but its [[latency]] remains relatively constant.
- However, in the compute-bound area, the throughput remains constant and reaches the peak throughput.
- `time_of_computations ≪ time_of_data_movements`

### Batching
- [[batch size]] affects the [[throughput]] of the LLM system. When the batch size is small, the LLM operates in a memory-bound regime. As the batch size reaches a certain threshold, the model transitions to a compute-bound regime.
	- ==When using [[batching]] ALL prompts in each batch must be of the same length==. In LLMs, we use left padding to avoid inserting pad tokens between the prompts and the generation result. This is needed for the correct functioning of LLMs.
- See [[#The optimal batch size]] below.

![[1,3,6,8.png|500]]

###### Links
-[How continuous batching enables 23x throughput in LLM inference while reducing p50 latency](https://www.anyscale.com/blog/continuous-batching-llm-inference)

### Memory consumption
- **LLM weights**: for storing all the model parameters. Equals to `num parameters * num bytes per parameter`
	- "*small*" 8b models in *float16* take ~ 15 Gb of GPU memory
- **Cache**: LLM inference involves multiple passes through the transformer: one for prompt processing and many more for autoregressive decoding. The cache holds intermediate computation results to avoid recalculating them in future iterations. Cache size depends on [[batch size]], context length, and other model parameters.
- **Activations**: to store intermediate data (neural network activations) during the current iteration of the LLM. Depends on the framework implementation and the floating-point precision used.
- For simplicity, it is sometimes assumed that the context length is small, and hence cache is also negligible, and The activation part remains constant and is also left out of the calculations. Then the memory needed is just `num parameters * num bytes per parameter`
-

> [!NOTE]- `!nvidia-smi` to check the state of the GPU
> ![[Pasted image 20241108122719.png|800]]

### FLOPs needed to generate one token
- *Roughly speaking,* to generate a single token, each token needs to be multiplied by all the parameters and then the results are summed across all parameters.
	- `FLOP = 2 * num_parameters * batch_size`

### LLM throughput
- `time_of_computation = FLOP needed / GPU peak FLOPs = (2 * num_parameters * batch_size) / GPU_peak_FLOPs`
- `time_of_data_movement = memory needed / GPU memory bandwidth = (num_parameters * num_bytes_per_parameter) / GPU_memory_bandwidth`
- `throughput = batch_size / (time_of_computation + time_of_data_movement)` (as in all input tokens divided by the time needed to fully process them)
- In memory-bound mode: `throughput(batch_size) = batch_size / time_of_data_movement ~ batch_size / const`
- In compute-bound mode: `throughput(batch_size) = batch_size / time_of_computation = batch_size * (GPU_peak_FLOPs / (2 * num_parameters * batch_size)) = GPU_peak_FLOPs / (2 * num_parameters)`

#### The optimal batch size
- ==The optimal batch size== is the point on a graph where we can achieve maximum throughput with minimal latency. It is the point where `time_of_computations=time_of_data_movements`
- `optimal_batch_size = (GPU_peak_FLOPs * num_bytes_per_parameter) / (2 * GPU_memory_bandwidth)` ^5eb7ed
- `true_optimal_batch_size = min(optimal_batch_size,max_size_that_fits_into_the_GPU_memory)` because otherwise it will not fit in the memory, but it ==doesn’t depend on the model size==
- For multi-GPU setup, the calculations become more tedious due to data channelling between GPUs.
- In practice, the optimal batch size is much smaller than the theoretical limit due to high memory consumptions of activations and the cache.

###### Links
- [Making Deep Learning go Brrrr From First Principles](https://horace.io/brrr_intro.html)
- [Transformer Inference Arithmetic | kipply's blog](https://kipp.ly/transformer-inference-arithmetic/#flops-counting)
- [Can You Run It? LLM inference calculator](https://huggingface.co/spaces/Vokturz/can-it-run-llm)

## Inference Optimization
![[inference optimization#Note]]

## Resources
- [[Nebius LLM course]]

---
###### Links to this File
```dataview
table file.inlinks, file.outlinks from [[]] and !outgoing([[]])  AND -"Changelog"
```
