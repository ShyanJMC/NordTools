# Foocus

Foocus is an AI tool to generate image from user's prompt.

You can customize the configurations and generate differents outputs with the same prompt.

## Requirement

- [ ] NVIDIA GPU with CUDA

## Architecture

In this case, in contrast to whisper and marker container, local volume is not needed.

Fooocus use only the port to access trough your web browser and provide the final picture.

## Build

1. Build the image

> [docker/podman] build -t fooocus:2.5.5 .

2. Install "nvidia-container-toolkit" and "podman-docker" (if you use podman instead docker)

3. Configure nvidia-container-toolkit to use podman or docker (in both cases is docker)

> sudo nvidia-ctk runtime configure --runtime=docker

## Usage

1. Run the container forwading the local port 8080 to container port 7865 . Be patient because in the first run will download many image models (>7.0 GB) from huggingface.co.

> [docker/podman] run -d --gpus all -p 8080:7865 fooocus:2.5.5 /bin/bash

In the WebGUI with the "Advance" option you can customize the variables and options.

## Note

Take into consideration that if you change the model in "Settings" -> "Preset" will download new models, and
will take sometime.

For example; the model "realistic" sizes 6.46GB.
