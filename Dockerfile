# syntax=docker/dockerfile:1

# Base Ruby image
FROM ruby:3.2

# Install OS packages
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  npm \
  postgresql-client \
  && rm -rf /var/lib/apt/lists/*

# Set working dir
WORKDIR /app

# Install bundler
RUN gem install bundler

# Cache gems
COPY Gemfile Gemfile.lock ./
RUN bundle install --without development test

# Copy app code
COPY . .

# Set env vars for production
ENV RAILS_ENV=production \
    RACK_ENV=production \
    BUNDLE_WITHOUT="development:test"

# Precompile assets (if you’re using sprockets/pipeline)
RUN bundle exec rake assets:precompile

# Expose Puma port
EXPOSE 3000

# Start server
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
