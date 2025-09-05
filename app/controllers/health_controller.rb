class HealthController < ApplicationController
  def ok
    render plain: "OK"
  end
  def db
    ActiveRecord::Base.connection.execute("SELECT 1")
    render plain: "DB OK"
  rescue => e
    render plain: "DB ERR: #{e.class}: #{e.message}", status: 500
  end
end
