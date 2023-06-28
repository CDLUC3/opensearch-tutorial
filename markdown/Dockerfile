FROM ruby:3
RUN apt-get update -y -qq && apt-get install -y build-essential libpq-dev nodejs && apt-get -y upgrade

# Adding gems
COPY Gemfile Gemfile

RUN gem install bundler
RUN bundle install --jobs 20 --retry 5
# Adding project files

COPY *.rb .
COPY *.md .
COPY *.css .

EXPOSE 4567
CMD ["ruby", "app.rb"]