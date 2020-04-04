class GroupVolunteersController < ApplicationController

  def new
    @group_volunteer = GroupVolunteer.new :status => true

  end

  def create

    @group_volunteer = GroupVolunteer.new(params)
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
    params.permit!
  end


end
