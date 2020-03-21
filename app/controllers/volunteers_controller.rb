class VolunteersController < ApplicationController

  def index
    @volunteers = Volunteer.all
  end

  def new
    @volunteer = Volunteer.new :active_status => true
  end

  def create
    @volunteer = Volunteer.new
    @volunteer.first_name = params[:volunteer][:first_name]
    @volunteer.last_name = params[:volunteer][:last_name]
    @volunteer.email = params[:volunteer][:email]
    @volunteer.organization = params[:volunteer][:organization]
    @volunteer.sector = params[:volunteer][:sector]
    @volunteer.active_status = params[:volunteer][:active_status]
    @volunteer.user_id = current_user.id
    @volunteer.save
    redirect_to volunteer_path(@volunteer)
  end

  def show

    @volunteer = Volunteer.find(params[:id])

  end

  def edit
    @volunteer = Volunteer.find(params[:id])
  end

  def update

  end 

  private

  def volunteer_params
    #params.require(:volunteer).permit(:first_name, :last_name, :email, :organization, :sector, :active_status)
    #params.permit(:first_name, :last_name, :email, :organization, :sector, :active_status, :id)
    params.permit!
  end



end
