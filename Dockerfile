# syntax=docker/dockerfile:1

FROM ruby:3.2

# ---- system dependencies ----
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  postgresql-client \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN gem install bundler

# -------- build args to control env & bundler --------
# Defaults are dev-friendly; prod will override in CI/deploy
ARG RAILS_ENV=development
ARG BUNDLE_WITHOUT="test"

# Set runtime envs
ENV RAILS_ENV=${RAILS_ENV} \
    RACK_ENV=${RAILS_ENV}

# ---- install gems ----
COPY Gemfile Gemfile.lock ./
RUN bundle config set without "${BUNDLE_WITHOUT}" \
 && bundle install --jobs 4 --retry 3

# ---- copy app ----
COPY . .

# optional: precompile assets in production
# RUN if [ "$RAILS_ENV" = "production" ]; then bundle exec rails assets:precompile; fi

# Ensure tmp/pids exists so Puma can write PID file
RUN mkdir -p tmp/pids

EXPOSE 3000

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
