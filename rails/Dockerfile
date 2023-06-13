FROM ruby:3.1.0

WORKDIR /usr/src/app

RUN gem install rails && \
    rails new . && \
    bundle add lograge && \
    bundle add logstash-event && \
    bundle install

COPY lograge.rb config/initializers/

EXPOSE 3000

ENTRYPOINT [ "rails",  "s", "-b", "0.0.0.0" ]