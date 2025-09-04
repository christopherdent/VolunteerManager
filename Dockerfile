# syntax=docker/dockerfile:1

FROM ruby:3.2

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  postgresql-client \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN gem install bundler

COPY Gemfile Gemfile.lock ./
RUN bundle install --without development test

COPY . .

ENV RAILS_ENV=production \
    RACK_ENV=production \
    BUNDLE_WITHOUT="development:test"

# Ensure tmp/pids exists so Puma can write PID file
RUN mkdir -p tmp/pids

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
