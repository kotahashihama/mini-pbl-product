FROM ruby:3.1.0

RUN apt update -qq
# RUN apt update -qq && apt install -y postgresql-client
RUN mkdir /app
WORKDIR /app
# COPY Gemfile /app/Gemfile
# COPY Gemfile.lock /app/Gemfile.lock
COPY ./project /app
RUN gem update bundle
RUN bundle install --jobs=`getconf _NPROCESSORS_ONLN`

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]