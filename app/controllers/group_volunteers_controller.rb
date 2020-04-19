class GroupVolunteersController < ApplicationController
before_action :require_login #none of this can be used if not logged in
before_action :admin_only, except: [:index, :show] #nothing in here can be changed by anyone other than an admin
before_action :set_group_volunteer, only: [:delete_statement, :edit, :new] #this before action sets the statement of expertise to be deleted or edited

  def new
    @group_volunteer = GroupVolunteer.new
    @volunteer = Volunteer.find(group_volunteer_params[:volunteer_id])
    @groups = @volunteer.groups if @volunteer
  end

  def create
    @group_volunteer = GroupVolunteer.create(group_volunteer_params)
    redirect_to volunteer_path(group_volunteer_params[:volunteer_id])
  end


  def index
    if group_volunteer_params.has_key?("group")  #this block is for filtering the index page
      group_volunteers = GroupVolunteer.where(group_id: group_volunteer_params[:group])
      @group = Group.find(group_volunteer_params[:group])  #this variable lets me show what the current filter is
    elsif group_volunteer_params.has_key?("volunteer")
      group_volunteers = GroupVolunteer.where(volunteer_id: group_volunteer_params[:volunteer])
      @volunteer = Volunteer.find(group_volunteer_params[:volunteer])
    else
      group_volunteers = GroupVolunteer.all   #if not filtering then it should show everything
    end
      @group_volunteers_statements = [] #creating an array of all statements of expertise
      group_volunteers.each do |gv|
        if gv.statement != nil   #don't show me records that do not have a statement.  
          @group_volunteers_statements << gv  #populates the array I use in the view file
        end
      end
    end

    def edit #only used for modifying a statement of expertise
      @group_volunteer = GroupVolunteer.find(params[:id])
      @volunteer = Volunteer.find(@group_volunteer.volunteer_id)
      @groups = Group.all
    end

    def update
      @group_volunteer = GroupVolunteer.find(group_volunteer_params[:id])
      @group_volunteer.update(group_volunteer_params)
       redirect_to group_volunteers_path
    end


  def destroy  #the first part of this code is to remove a volunteer from a group, not to delete an instance of group_volunteer
     @group = Group.find(params[:group][:id])
     @volunteer = group.volunteers.find(params[:volunteer][:id])
     if @volunteer
        @group.volunteers.delete(@volunteer)
     end
  end

  def delete_statement  #custom action to remove a statement of expertise without breaking the group/volunteer connection
     @group_volunteer = GroupVolunteer.find(group_volunteer_params[:id])
     @group_volunteer.statement = nil
     @group_volunteer.save
     redirect_to group_volunteers_path
  end

private

  def set_group_volunteer
    if params[:id]
       @group_volunteer = GroupVolunteer.find(params[:id])
     else
       @group_volunteer = GroupVolunteer.new
     end
  end

  def group_volunteer_params
    if params.has_key?("group_volunteer")
      params.require(:group_volunteer).permit(:id, :statement, :group_id, :volunteer_id)
    else
      params.permit!  #this was a workaround for the error "required param missing"...
    end
  end


end
