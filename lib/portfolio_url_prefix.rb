class PortfolioUrlPrefix
  def initialize(app)
    @app = app
  end

  def call(env)
    request = ActionDispatch::Request.new(env)
    prefix = Rails.application.config.relative_url_root

    # Vercel strips this mount point from PATH_INFO. Restore SCRIPT_NAME so
    # route generation and per-form CSRF validation use the same public path.
    if request.script_name.empty? && prefix.present? &&
       %w[christopher-dent.com www.christopher-dent.com].include?(request.host)
      env['SCRIPT_NAME'] = prefix
    end

    @app.call(env)
  end
end
