class GroupVolunteersController < ApplicationController
before_action :require_login
before_action :admin_only, except: [:index, :show]
before_action :set_group_volunteer, only: [:delete_statemet]

  def new
    @group_volunteer = GroupVolunteer.new
    @volunteer = Volunteer.find(group_volunteer_params[:volunteer_id])
    @groups = @volunteer.groups if @volunteer
  end

  def create

    @group_volunteer = GroupVolunteer.create(group_volunteer_params)
    #volunteer = Volunteer.find(params[:volunteer_id])
    #@group_volunteer.save

    redirect_to volunteer_path(group_volunteer_params[:volunteer_id])
  end


  def index
      @group_volunteers = GroupVolunteer.all
      @group_volunteers_statements = []
      @group_volunteers.each do |gv|
        if gv.statement != nil
          @group_volunteers_statements << gv  #populates the array I use in the view file
        end
      end
    end

    def edit
      @group_volunteer = GroupVolunteer.find(group_volunteer_params[:id])
      @volunteer = Volunteer.find(@group_volunteer.volunteer_id)
      @groups = Group.all
    end

    def update
      @group_volunteer = GroupVolunteer.find(group_volunteer_params[:id])
      @group_volunteer.update(group_volunteer_params)
       redirect_to group_volunteers_path
    end

  def show
    #redirect_to group_volunteers_path
  end

  def destroy  #the first part of this code is to remove a volunteer from a group, not to delete an instance of group_volunteer
     @group = Group.find(params[:group][:id])
     @volunteer = group.volunteers.find(params[:volunteer][:id])

     if @volunteer
        @group.volunteers.delete(@volunteer)
     end
  end

  def delete_statement
     @group_volunteer = GroupVolunteer.find(group_volunteer_params[:id])
     @group_volunteer.statement = nil
     @group_volunteer.save 
     redirect_to group_volunteers_path
  end

private
  def group_volunteer_params
    if params.has_key?("group_volunteer")
      params.require(:group_volunteer).permit(:group_volunteer, :id, :statement, :group_id, :volunteer_id)
    else
    params.permit!
    end
  end


end
