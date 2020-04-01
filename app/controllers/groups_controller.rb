class GroupsController < ApplicationController

  def new
    @group = Group.new :status => true
    @volunteers = Volunteer.all

  end

  def create
    @group = Group.create(group_params)
    if group_params[:volunteer_ids] != ""
      @volunteer = Volunteer.find(group_params[:volunteer_ids])
      #@group.volunteers << @volunteer
      @group.chair_first = @volunteer.first_name
      @group.chair_last = @volunteer.last_name
    end
    @group.save
    redirect_to group_path(@group)
  end

  def show
    @group = Group.find(params[:id])
    @group_volunteer = GroupVolunteer.new
  #  @volunteer = @group.volunteers.build
  #  @volunteer.save
  end

  def edit
    @group = Group.find(params[:id])
    @chair = @group.chair


  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    redirect_to group_path(@group)
  end

  def destroy
    @group = Group.find(params[:id])
    @group.volunteers = []
    @group.destroy
    redirect_to groups_path
  end

  #def volunteers_index
  #  @group == Group.find(params[:id])
  #  @volunteers = @group.volunteers
  #  render template: 'volunteers/index'
  # end

  #def volunteer
  #  @group = group.find(params[:id])
  #  render template: 'volunteers/show'
  #end

private

  def group_params
    params.require(:group).permit(:name, :program_name, :chair_first, :chair_last, :status, :user_id, :volunteer_ids, volunteer_ids:[], volunteers_attributes: [:last_name, :first_name, :email, :organization, :sector, :active_status])
  end

end
