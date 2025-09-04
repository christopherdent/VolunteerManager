#!/bin/bash
set -e

# Ensure tmp dirs exist
mkdir -p tmp/pids

# Precompile assets if missing
if [ ! -d public/assets ]; then
  echo "Precompiling assets..."
  bundle exec rake assets:precompile
fi

exec "$@"
