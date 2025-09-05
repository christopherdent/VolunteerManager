class SessionsController < ApplicationController
  helper_method :current_user, :require_login, :logged_in?

  def welcome
     
    @user = User.find(session[:user_id]) if logged_in?
  end

def create
  username = params.dig(:user, :username).to_s.strip
  password = params.dig(:user, :password).to_s

  if username.blank? || password.blank?
    flash.now[:alert] = "Please enter both username and password."
    @user = User.new(username: username)
    return render :new, status: :unprocessable_entity
  end

  @user = User.find_by(username: username)

  if @user&.authenticate(password)
    reset_session
    session[:user_id] = @user.id
    redirect_to action: 'welcome', notice: "Welcome back!"
  else
    flash.now[:alert] = "Invalid username or password."
    @user = User.new(username: username)
    render :new, status: :unprocessable_entity
  end
end

  def new
  end

  def destroy
    if current_user
      session.delete :user_id
      redirect_to '/'
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :email)
  end

  def auth
    request.env['omniauth.auth']
  end



end
