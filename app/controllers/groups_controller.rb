class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    redirect_to group_path(@group)
  end

  def show
    @group = Group.find(params[:id])
  end

private

  def group_params
    params.require(:group).permit(:name, :program_name, :chair, :status, :user_id)
  end

end
