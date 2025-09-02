class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :require_login, :logged_in?

  # Skip login in development
  before_action :require_login, unless: -> { Rails.env.development? }

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    # Allow access in development via peer-auth socket
    return true if Rails.env.development?

    unless current_user
      redirect_to root_path and return
    end
  end

  def admin_only
    unless current_user&.admin?
      flash[:alert] = "You do not have permission to perform that action."
      redirect_to root_path
    end
  end

  def logged_in?
    current_user.present?
  end
end

