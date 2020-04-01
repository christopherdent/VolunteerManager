class GroupVolunteersController < ApplicationController

  def new
    @group_volunteer = GroupVolunteer.new :status => true

  end

  def create
     
    @group_volunteer = GroupVolunteer.new(params)
  end

  def index

  end

private
  def group_volunteer_params
    params.permit!
  end


end
