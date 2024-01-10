ARG ARCH=amd64
FROM sykescottages/node:18-$ARCH

RUN apt update && \
    apt install -y bzip2 &&  \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN touch /.yarnrc && chown 1000:1000 /.yarnrc
RUN npm install -g gulp-cli yarn
