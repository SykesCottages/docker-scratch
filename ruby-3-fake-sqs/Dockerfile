FROM ruby:3

RUN gem install fake_sqs thin puma reel http webrick

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
