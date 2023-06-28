FROM ruby:3.1.0

WORKDIR /usr/src/app

RUN gem install rails && \
    rails new . && \
    bundle add lograge && \
    bundle add logstash-event && \
    bundle install

RUN echo "Rails.application.configure do" >> config/environments/development.rb && \
    echo "  config.hosts.clear" >> config/environments/development.rb && \
    echo "end" >> config/environments/development.rb 

COPY lograge.rb config/initializers/
COPY routes.rb config/
COPY app app/

EXPOSE 3000

ENTRYPOINT [ "rails",  "s", "-b", "0.0.0.0" ]