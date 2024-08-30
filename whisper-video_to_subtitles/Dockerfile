FROM docker.io/library/debian:12.6

# System update itself
RUN apt update && apt upgrade -y
RUN apt install -y python3 pipx python3-pip git gcc ffmpeg rustc cargo

# Whisper
RUN cd /opt && git clone https://github.com/openai/whisper
RUN python3 -m pip install --break-system-packages -r requirements.txt
RUN python3 setup.py 

VOLUME whisper-data
ENTRYPOINT ["/bin/bash"]
