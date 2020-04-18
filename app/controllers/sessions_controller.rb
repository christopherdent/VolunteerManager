class SessionsController < ApplicationController
  helper_method :current_user, :require_login, :logged_in?

  def welcome
    @user = User.find(session[:user_id]) if logged_in?
  end

  def create
    @user = User.find_by(:username => params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to(controller: 'users', action: 'index')
    else
      flash[:error] = "Something went wrong. Try again or"
      redirect_to(controller: 'sessions', action: 'new')
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

  def omniauth
      @user = User.from_omniauth(auth)
      @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    end

  private

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :email)
  end

  def auth
  request.env['omniauth.auth']
  end



end
