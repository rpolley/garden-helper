FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /garden-helper
WORKDIR /garden-helper
COPY Gemfile /garden-helper/Gemfile
RUN touch /garden-helper/Gemfile.lock
RUN bundle install
COPY . /garden-helper

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
ENV RAILS_ENV="test"
#set up sqllite
RUN gem install sqllite