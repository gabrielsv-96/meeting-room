FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /meeting-room
COPY Gemfile /meeting-room/Gemfile
COPY Gemfile.lock /meeting-room/Gemfile.lock
RUN bundle install
COPY . /meeting-room

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]