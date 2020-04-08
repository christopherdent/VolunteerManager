class VolunteersController < ApplicationController


  def index
    if !params[:group].blank?  #why is volunteer_params not working?  Error is can't find volunteer without id?
      @group = Group.find(volunteer_params[:group])
      @volunteers = @group.volunteers
    else
    @volunteers = Volunteer.all
    end
  end

  def new
    @volunteer = Volunteer.new :active_status => true
    @groups = Group.all
  end

  def create
    @volunteer = Volunteer.create(volunteer_params)

    if volunteer_params[:group_ids] != ""
      @group = Group.find(volunteer_params[:group_ids]) if @group
    end
    @volunteer.save
    redirect_to volunteer_path(@volunteer)
  end

  def show
    @volunteer = Volunteer.find(params[:id])
    @group_volunteer = GroupVolunteer.new
  end

  def edit
    @volunteer = Volunteer.find(params[:id])
  end

  def update

    @volunteer =Volunteer.find(volunteer_params[:id])
     @volunteer.update(volunteer_params)
     redirect_to volunteer_path(@volunteer)
  end

  def destroy
      @volunteer = Volunteer.find(params[:id])
      @volunteer.groups = []
      @volunteer.destroy
      redirect_to volunteers_path
    end

    def remove_from_group
      @group = Group.find(params[:group_id])
      volunteer = Volunteer.find(params[:id])
      @group.volunteers.delete volunteer

      if volunteer.last_name == @group.chair_last  #this conditional clears the group's chair attribute if the volunteer you are removing is the chair.
        @group.chair_first = nil
        @group.chair_last = nil
      end
      @group.save
    redirect_to @group
end

  private

  def volunteer_params
    params.require(:volunteer).permit(:id, :first_name, :last_name, :email, :organization, :sector, :active_status, :user_id, :group_ids, group_ids:[], groups_attributes: [:name, :program_name, :chair_first, :chair_last, :status, :kind, :user_id, :id])
    #params.require(:volunteer).permit!
    #params.permit!
  end
end
