FROM sykescottages/base

RUN apt update && \
    apt install -y jq

RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*
