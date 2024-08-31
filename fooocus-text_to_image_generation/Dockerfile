FROM docker.io/library/debian:12.6

# Upgrade itself
RUN apt update && apt upgrade -y
# Basic tools
RUN apt install -y git python3 python3-pip pipx curl tar gzip

# Fooocus itself
RUN cd /opt && curl -O https://codeload.github.com/lllyasviel/Fooocus/tar.gz/refs/tags/v2.5.5 && tar -xf v2.5.5 
RUN cd /opt/Fooocus-2.5.5 && python3 -m pip install --break-system-packages -r requirements_versions.txt

# Fooocus
CMD ["/usr/bin/python3","/opt/Fooocus-2.5.5/entry_with_update.py", "--listen"]
