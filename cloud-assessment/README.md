# Cloud Assessment

This proyect is to automate cloud asessments using one container with many open source tools.

## Architecture

This container constains in "/opt" directory; 

- Prowler (AWS, Azure, GCP, K8S)
- ScoutSuite (AWS, Azure, GCP)
- CloudSploit (AWS, Azure, GCP)
- MetaHub (AWS)
- ElectricEye (AWS)

## Build image

> [docker/podman] build -t cloud-assessment:0.1.0 .

## Usage
