# Whisper

Whisper is an IA tool to detect the audio in a video or in mp3/wav audio file to subtitle file with timestamps.

Whisper repository; https://github.com/openai/whisper

## Requirements

- [ ] Dedicated NVIDIA GPU (because Marker can use CUDA cores) with more or less 3GB of VRAM (Video RAM) available in dedicated NVIDIA GPU.
- [ ] If above is not possible (3GB of VRAM or NVIDIA GPU) you can use the CPU by default.

## Architecture

Use a Debian distribution container to run the program locally.

And use a volume to transfer the video/audio files between the machine and the container.

## Build

Build the image from scratch runing this from this directory;

> [docker/podman] build -t whisper:20240829 .

## Usage

| Note |
| :---: |
| If you want use NVIDIA GPU, add "-v /dev:/dev" before "--name" in point number 1. |


