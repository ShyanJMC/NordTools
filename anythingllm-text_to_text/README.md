# Anything LLM


## Architecture

This container use ollama in local.

The entrypoint starts ollama and then anythingllm.

## Build

> [docker/podman] build -t anythingllm:202409 .

## Usage

1. Start container with port 3001

> [docker/podman] run -d -p 3001:3001 --name anythingllm --cap-add SYS_ADMIN localhost/anythingllm:202409

2. Download Llama 3.1 from [ollama's models](https://ollama.com/library);

> [docker/podman] podman exec -ti anythingllm /usr/local/bin/ollama pull llama3.1

By default you will download llama3.1 8b, with 8 billions of parameters. But there are also 70b (40GB) and 405b (229GB).

3. Use your web browser to access; http://[Server_IP]:3001

4. In "AI Providers" select "Ollama (Run LLMs locally on your own machine)" and select llama3.1 (or the model that you downloaded)

## Configuration

If anythingllm do not detect automatically Ollama's server, do this;

- In "AI Providers" select "Ollama (Run LLMs locally on your own machine)"
- In "Ollama Base URL" insert "http://127.0.0.1:11434" and continue.
- In "http://localhost:3001/settings/llm-preference"
