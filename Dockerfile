# Use a lightweight Ruby image
FROM ruby:3.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  npm \
  postgresql-client

# Set working directory
WORKDIR /app

# Install bundler
RUN gem install bundler

# Copy Gemfile and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy rest of the app
COPY . .

# Precompile assets (optional: uncomment if using sprockets/pipeline)
# RUN bundle exec rake assets:precompile

# Expose port Puma will run on
EXPOSE 3000

# Default command to start the app
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
