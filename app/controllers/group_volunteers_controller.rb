class GroupVolunteersController < ApplicationController

  def new
    @group_volunteer = GroupVolunteer.new

  end

  def create
    @group_volunteer = GroupVolunteer.new(group_volunteer_params)
  
    redirect_to volunteers_path
  end

  def index

  end

  def destroy

     @group = Group.find(params[:group][:id])
     @volunteer = group.volunteers.find(params[:volunteer][:id])

     if @volunteer
        @group.volunteers.delete(@volunteer)

     end

  end



private
  def group_volunteer_params
      params.require(:group_volunteer).permit(:statement, :group_id, :volunteer_id)
  end


end
