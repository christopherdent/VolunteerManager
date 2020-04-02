class GroupsController < ApplicationController

  def new
    @group = Group.new :status => true
    @volunteers = Volunteer.all

  end

  def create
    @group = Group.create(group_params)
    if group_params[:volunteer_ids] != ""
      @volunteer = Volunteer.find(group_params[:volunteer_ids])
      @group.chair_first = @volunteer.first_name
      @group.chair_last = @volunteer.last_name
    end
    @group.save
    redirect_to group_path(@group)
  end

  def show
    @group = Group.find(params[:id])
    @group_volunteer = GroupVolunteer.new
  end

  def edit
    @group = Group.find(params[:id])
    @chair = @group.chair


  end

  def update
    @group = Group.find(params[:id])
    #byebug
    #@group.update(group_params)
    @volunteer = Volunteer.find(group_params[:volunteer_ids])
    if @volunteer != nil
      @group.volunteers <<  @volunteer
    elsif group_params.include?
      @group.update(group_params)
    end
    redirect_to group_path(@group)
  end

  def destroy
    @group = Group.find(params[:id])
    @group.volunteers = []
    @group.destroy
    redirect_to groups_path
  end


private

  def group_params
    params.require(:group).permit(:name, :program_name, :chair_first, :chair_last, :status, :user_id, :volunteer_ids, volunteer_ids:[], volunteers_attributes: [:last_name, :first_name, :email, :organization, :sector, :active_status])
  end

end
