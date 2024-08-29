# Marker

Marker is a AI designed to transform PDF files to Markdown files.

The marker's repository is; https://github.com/VikParuchuri/marker

This custom call of Marker use 'tesseract' and 'ocrmypdf' to use OCR (Optical Character Recognition) 
with all languages supported by the first.

## Requirements

- [ ] Dedicated NVIDIA GPU (because Marker can use CUDA cores) with more or less 3GB of VRAM (Video RAM) available in dedicated NVIDIA GPU.
- [ ] If above is not possible (3GB of VRAM or NVIDIA GPU) you can use the CPU by default.

## Architecture

Use a Debian distribution container to run the program locally.

And use a volume to transfer the PDF files between the machine and the container.

## Build

Build the image from scratch runing this from this directory;

> [docker/podman] build -t marker:2.17 .

## Usage

| Note |
| :---: |
| If you want use NVIDIA GPU, add "-v /dev:/dev" before "--name" in point number 1. |

1. Run the container with a volume pointing directly to /data inside the container

> [docker/podman] run -ti -v [folder]:/data --name marker-2.17 -h marker marker:2.17 /bin/bash /bin/marker

2. To see the help

> /bin/marker-helper

The marker data is located at /opt/marker-[version]
