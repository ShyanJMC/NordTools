FROM docker.io/library/debian:12.6

# Basic tools
RUN apt update && apt upgrade -y
RUN apt install -y curl git python3 python3-pip pipx ocrmypdf tesseract-ocr-* 
RUN echo "PATH=$PATH:/root/.local/bin" >> ~/.bashrc

# Marker itself
RUN cd /opt && curl -O https://codeload.github.com/VikParuchuri/marker/tar.gz/refs/tags/v0.2.17 && tar -xf v0.2.17 
## Marker dependencies
RUN pipx install pypdfium2 
RUN python3 -m pip install -U pypdfium2 torch pydantic pydantic_settings ftfy surya-ocr scikit-learn texify pdftext rapidfuzz --break-system-packages
RUN apt install -y python3-dotenv python3-dotenv-cli 

ADD marker.sh /bin/marker-helper
RUN chmod +x /bin/marker-helper
VOLUME marker-data
ENTRYPOINT ["/bin/marker-helper"]
