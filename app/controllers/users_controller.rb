class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to(controller: 'users', action: 'index')
    else
      render action: :new 
    end
  end

  def index
    redirect_to(controller: 'sessions', action: 'welcome')
  end


  def show
    @user = User.find_by_id(params[:id])
  end



  private

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :email)
  end



end
