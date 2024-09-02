FROM docker.io/library/debian:12.6

# System update itself
RUN apt update && apt upgrade -y
RUN apt install -y python3 pipx python3-pip git gcc ffmpeg rustc cargo curl unzip

# Whisper
RUN cd /opt && curl -O https://codeload.github.com/openai/whisper/tar.gz/refs/tags/v20231117 && \
tar -xf v20231117

## Whisper dependencies
RUN cd /opt/whisper-20231117 && sed -i 's/triton>=2.0.0,<3;/triton>=2.0.0;/g' requirements.txt &&  sed -i 's/triton>=2.0.0,<3/triton>=2.0.0/g' setup.py && python3 -m pip install --break-system-packages -r requirements.txt

## Whisper build and then install
RUN cd /opt/whisper-20231117 && python3 setup.py build && python3 -m pip install --break-system-packages triton -U &&  python3 setup.py install

VOLUME whisper-data
CMD ["/usr/bin/bash"]
