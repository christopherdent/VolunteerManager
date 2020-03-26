class GroupsController < ApplicationController

  def new
    @group = Group.new

  end

  def create
    @group = Group.create(group_params)
    @chair = Volunteer.where(last_name: @group.chair_last)
    #find last_name: (group_params[:chair_last])

    #@chair = Volunteer.find name: (group_params[:chair])
    @group.volunteers << @chair

    redirect_to group_path(@group)
  end

  def show

    @group = Group.find(params[:id])

  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.update(group_params)
  redirect_to group_path(@group)
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

private

  def group_params
    params.require(:group).permit(:name, :program_name, :chair_first, :chair_last, :status, :user_id, volunteer_ids:[], volunteers_attributes: [:last_name])
  end

end
