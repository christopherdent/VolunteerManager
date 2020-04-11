class GroupVolunteersController < ApplicationController
before_action :require_login
before_action :admin_only, except: [:index, :show]

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

          @group_volunteers_statements << gv
        end

      end

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
    if params.has_key?("group_volunteer")
      params.require(:group_volunteer).permit(:group_volunteer, :statement, :group_id, :volunteer_id)
    else
    params.permit!
    end
  end


end
