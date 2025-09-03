# config/puma.rb

# Threads
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# Environment (default to production on the server)
environment ENV.fetch("RAILS_ENV") { "production" }

# PID file (used by some process managers; harmless to keep)
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# Workers (0 = single process; good for small/free instances)
workers ENV.fetch("WEB_CONCURRENCY") { 0 }

# Preload only if using multiple workers
preload_app! if ENV.fetch("WEB_CONCURRENCY", "0").to_i > 0

# ⬇️ IMPORTANT: single listener that binds to the Koyeb-assigned $PORT
# bind "tcp://0.0.0.0:#{ENV.fetch('PORT', 3000)}"

# Reconnect DB when using workers (safe no-op when workers = 0)
on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

# Allow `bin/rails restart` to work
plugin :tmp_restart
