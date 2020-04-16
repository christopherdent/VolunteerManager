class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :admin_only, except: [:show, :new, :create, :index]

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

  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
     @user.update(user_params)
     if @user.save
       redirect_to user_path(@user)
     else
       render action: :edit
     end
  end

  def show
    @user = User.find_by_id(params[:id])
  end



  private

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :email, :admin, :avatar)
  end



end
