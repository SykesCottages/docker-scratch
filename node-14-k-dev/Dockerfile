ARG ARCH=amd64
FROM sykescottages/node:14-$ARCH

RUN apt-get update && apt-get install -y \
    python2

RUN npm -g install --unsafe --loglevel=error \
        grunt-cli \
        webpack-cli \
        yarn

RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*
