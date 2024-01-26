FROM ruby:3

RUN gem install fakes3:1.2.1 webrick

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 4569
