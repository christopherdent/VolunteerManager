class VolunteersController < ApplicationController



  def index
    @volunteers = Volunteer.all
  end



  def new
    @volunteer = Volunteer.new :active_status => true
  end

  def create
      @volunteer = Volunteer.create(volunteer_params)

    redirect_to volunteer_path(@volunteer)
  end

  def show
    @volunteer = Volunteer.find(params[:id])
  end

  def edit
    @volunteer = Volunteer.find(params[:id])
  end

  def update
     @volunteer = Volunteer.update(volunteer_params)
     redirect_to volunteer_path(@volunteer)
  end

    def destroy
      @volunteer = Volunteer.find(volunteer_params[:id])
      @volunteer.destroy
      redirect_to volunteers_path
    end


  private

  def volunteer_params
    params.require(:volunteer).permit(:first_name, :last_name, :email, :organization, :sector, :active_status, :user_id)

  end
end
