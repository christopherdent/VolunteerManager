class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :require_login, :logged_in?

# my app's custom helpers

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

    def require_login
      if current_user == nil
        redirect_to '/'
      end
    end

    def admin_only
      unless current_user.admin
        redirect_to request.referrer, alert: "You must be an admin to perform that function!"
      end
    end

    def logged_in?
      current_user != nil
    end
  end
