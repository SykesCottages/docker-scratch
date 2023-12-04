ARG ARCH=amd64
FROM sykescottages/base:ubuntu-22-04-$ARCH

RUN apt update && \
    apt install -y jq

RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*
