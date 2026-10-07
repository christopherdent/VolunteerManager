require 'test_helper'

class UrlPrefixTest < ActionDispatch::IntegrationTest
  # These request tests create their own user; the legacy fixtures are unrelated.
  self.fixture_table_names = []
  parallelize(workers: 1)

  PREFIX = '/volunteer-manager'
  KOYEB_HOST = 'consistent-robinetta-christopherdent-69ec9810.koyeb.app'

  setup do
    @original_root = Rails.application.config.relative_url_root
    @original_host = Rails.application.routes.default_url_options[:host]
    @original_forgery_protection = ActionController::Base.allow_forgery_protection
    ActionController::Base.allow_forgery_protection = true
    Rails.application.config.relative_url_root = PREFIX
    Rails.application.routes.default_url_options[:host] = KOYEB_HOST
    @user = User.create!(username: 'prefix-test', password: 'local-test',
                         first_name: 'Prefix', last_name: 'Test', email: 'prefix-test@example.com')
    https!
  end

  teardown do
    Rails.application.config.relative_url_root = @original_root
    Rails.application.routes.default_url_options[:host] = @original_host
    ActionController::Base.allow_forgery_protection = @original_forgery_protection
  end

  ['christopher-dent.com', 'www.christopher-dent.com'].each do |portfolio_host|
    test "authentication and navigation retain prefix on #{portfolio_host}" do
      host! portfolio_host
      check_authentication_flow(PREFIX)
    end
  end

  test 'forwarded portfolio host retains prefix when the origin host is Koyeb' do
    host! KOYEB_HOST
    check_authentication_flow(PREFIX, headers: { 'X-Forwarded-Host' => 'www.christopher-dent.com' })
  end

  test 'direct Koyeb access stays at root despite configured prefix' do
    host! KOYEB_HOST
    check_authentication_flow('')
  end

  test 'localhost stays at root despite configured prefix' do
    host! 'localhost'
    check_authentication_flow('')
  end

  test 'unconfigured root deployment stays at root on portfolio host' do
    Rails.application.config.relative_url_root = nil
    host! 'www.christopher-dent.com'
    check_authentication_flow('')
  end

  test 'an existing Rack script name is preserved without doubling the prefix' do
    host! 'www.christopher-dent.com'
    get '/login', env: { 'SCRIPT_NAME' => PREFIX }
    assert_response :success
    assert_select "form[action='#{PREFIX}/login']"
    assert_select "img[src^='#{PREFIX}/assets/logo-']"
  end

  private

  def check_authentication_flow(prefix, headers: {})
    # Vercel removes the public prefix: Rails receives /login, /, and /logout
    # with an empty SCRIPT_NAME. Follow redirects through that same arrangement.
    get '/login', headers: headers
    assert_response :success
    assert_equal '/login', request.path_info
    assert_equal prefix, request.script_name
    token = css_select('input[name=authenticity_token]').first['value']
    assert_select "form[action='#{prefix}/login'][method='post']"
    assert_select "a.navbar-brand[href='#{prefix}/']"
    assert_select "a[href='#{prefix}/signup']"
    assert_select "img[src^='#{prefix}/assets/logo-']"
    assert_select "link[href^='#{prefix}/assets/application-']"
    assert_select "script[src^='#{prefix}/assets/application-']"

    get '/', headers: headers
    assert_public_redirect "#{prefix}/login"
    get '/volunteers', headers: headers
    assert_public_redirect "#{prefix}/"

    post '/login', params: { authenticity_token: token, user: { username: @user.username, password: 'local-test' } }, headers: headers
    assert_public_redirect "#{prefix}/"
    get '/', headers: headers
    assert_response :success
    assert_select "a[href='#{prefix}/volunteers']"
    assert_select "a[href='#{prefix}/groups']"
    assert_select "a[href='#{prefix}/logout']"
    token = css_select('meta[name=csrf-token]').first['content']

    delete '/logout', params: { authenticity_token: token }, headers: headers
    assert_public_redirect "#{prefix}/"
    get '/', headers: headers
    assert_public_redirect "#{prefix}/login"
    get '/health', headers: headers
    assert_response :success
    assert_equal 'OK', response.body
  end

  def assert_public_redirect(path)
    assert_response :redirect
    location = URI.parse(response.location)
    assert_equal 'https', location.scheme
    assert_equal request.host, location.host
    assert_equal path, location.path
  end
end
