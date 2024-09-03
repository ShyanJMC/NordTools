FROM docker.io/mintplexlabs/anythingllm

USER root
RUN apt update && apt install -y git curl parallel
RUN curl -fsSL https://ollama.com/install.sh | sh 

ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
CMD ["/usr/bin/bash","/usr/local/bin/docker-entrypoint.sh"]
