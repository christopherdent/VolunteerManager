class VolunteersController < ApplicationController


  def index

    if !volunteer_params[:group].blank?
      @group = Group.find(volunteer_params[:group])
      @volunteers = @group.volunteers
    else
    @volunteers = Volunteer.all
    end
  end

  def new
    @volunteer = Volunteer.new :active_status => true
    @groups = Group.all
  end

  def create
    @volunteer = Volunteer.create(volunteer_params)
    if volunteer_params[:group_ids] != ""
      @group = Group.find(volunteer_params[:group_ids])

    end
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

    @volunteer =Volunteer.find(volunteer_params[:id])
     @volunteer.update(volunteer_params)
     redirect_to volunteer_path(@volunteer)
  end

  def destroy
      @volunteer = Volunteer.find(params[:id])
      @volunteer.groups = []
      @volunteer.destroy
      redirect_to volunteers_path
    end

    def remove_from_group
      @group = Group.find(params[:group_id]) #can do that in before_filter
      volunteer = Volunteer.find(params[:id])
      @group.volunteers.delete volunteer
    redirect_to @group
end

  private

  def volunteer_params

    #params.require(:volunteer).permit!
    params.permit!
  end
end
