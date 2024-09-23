FROM docker.io/library/debian:12.6

ADD selection.sh /usr/bin/selection

# System update itself
RUN apt update && apt upgrade -y && apt install -f
RUN apt install -y python3 apt-utils jq sudo pipx python3-pip npm git gcc micro nano curl unzip python3-poetry apt-transport-https ca-certificates gnupg lsb-release

# Azure
ADD InstallAzureCLIDeb /usr/bin/ 
RUN sudo sed -i '/messagebus/d' /var/lib/dpkg/statoverride && bash /usr/bin/InstallAzureCLIDeb

# AWS
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
	unzip awscliv2.zip && sudo ./aws/install

# GCP
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN echo "deb http://archive.debian.org/debian/ stretch contrib main non-free" >> /etc/apt/sources.list.d/debian-old.list
RUN sudo apt-get update && sudo apt install -y python2.7 && sudo apt install -y google-cloud-cli*

# ScoutSuite
## Runs with "scout.py" python file at root directory
RUN cd /opt && curl -O https://codeload.github.com/nccgroup/ScoutSuite/tar.gz/refs/tags/5.14.0 && tar -xf 5.14.0
RUN cd /opt/ScoutSuite-5.14.0 && python3 -m pip install --break-system-packages -r requirements.txt && \
    python3 -m pip install --break-system-packages --no-cache-dir .

# Prowler
RUN cd /opt && curl -O https://codeload.github.com/prowler-cloud/prowler/tar.gz/refs/tags/4.3.5 && tar -xf 4.3.5 
RUN cd /opt/prowler-4.3.5 && poetry install && python3 -m pip install --break-system-packages --no-cache-dir .
RUN python3 -m pip install --break-system-packages alive_progress pydantic \
    trove-classifiers>=2022.5.19 markdown==3.3.7 dulwich==0.20.50
RUN cd /opt/prowler-4.3.5 && python3 -m pip install --break-system-packages --no-cache-dir .

# CloudSploit
## It runs using the file "index.js" as a CLI binary.
RUN cd /opt && curl -O https://codeload.github.com/aquasecurity/cloudsploit/tar.gz/refs/tags/v3.5.0 && tar -xf v3.5.0
RUN cd /opt/cloudsploit-3.5.0 && npm install && chmod +x index.js

# Metahub
## Only for AWS
## Runs with "metahub" python file at root directory
RUN cd /opt && curl -O https://codeload.github.com/gabrielsoltz/metahub/tar.gz/refs/tags/v2.5.0 && tar -xf v2.5.0
RUN cd /opt/metahub-2.5.0 && python3 -m pip install --break-system-packages -r requirements.txt 

# ElectricEye
## Only for AWS
## Runs with "python3 eeauditor/controller.py" at root directory -t -o json --output-file /data/aws-findings-electriceye
RUN cd /opt && git clone https://github.com/jonrau1/ElectricEye.git electriceye-$(date '+%Y-%M-%d')
RUN cd /opt/electriceye-$(date '+%Y-%M-%d') && python3 -m pip install --break-system-packages -r requirements.txt 

# Clean
RUN rm -rf /opt/[0-9]* && rm -rf /opt/v* && apt clean all -y && rm -rf /var/log/* && rm -rf /root/.cache/* && rm -rf /tmp/*

CMD ["/usr/bin/bash","/usr/bin/selection"]
