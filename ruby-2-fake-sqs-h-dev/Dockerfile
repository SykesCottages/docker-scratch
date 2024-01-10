FROM ruby:3

RUN gem install fake_sqs

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

