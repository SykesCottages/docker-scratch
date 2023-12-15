ARG ARCH=amd64
FROM sykescottages/node:12-$ARCH

RUN gem install sass

RUN npm -g install --unsafe --loglevel=error \
    grunt-cli \
    webpack \
    node-sass
