FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y postgresql-client shared-mime-info dos2unix
RUN mkdir /api

WORKDIR /api

COPY Gemfile* /api/

RUN bundle install

COPY . /api

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
RUN dos2unix /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]