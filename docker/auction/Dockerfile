FROM ruby:2.5.1-alpine3.7

RUN apk update
RUN apk add --no-cache bash nodejs postgresql less imagemagick

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN gem install bundler
RUN apk add --no-cache alpine-sdk \
      --virtual .build_deps libxml2-dev libxslt-dev zlib zlib-dev postgresql-dev readline-dev
RUN bundle install

COPY . /app

CMD ["bash"]
