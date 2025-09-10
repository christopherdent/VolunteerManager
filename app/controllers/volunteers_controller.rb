class VolunteersController < ApplicationController
# before_action :require_login
# before_action :admin_only, except: [:index, :show]

def index
  @volunteers = Volunteer.all
  
    if params[:group].present?
      @group = Group.find(params[:group])
      @volunteers = @volunteers.joins(:groups).where(groups: { id: params[:group] })
    else
      @group = nil
    end
  
  @volunteers = @volunteers.includes(:groups) # Avoid N+1 queries
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
      if @volunteer.save
        redirect_to volunteer_path(@volunteer)
      else
        render action: :new
      end
  end

  def show
    @volunteer = Volunteer.find(params[:id])
    @group_volunteer = GroupVolunteer.new
  end

  def edit
    @volunteer = Volunteer.find(params[:id])
  end

  def update
    @volunteer =Volunteer.find(request.params[:id])  
     @volunteer.update(volunteer_params)
     if @volunteer.save
       redirect_to volunteer_path(@volunteer)
     else
       render action: :edit
   end
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
    params.require(:volunteer).permit(:cv, :id, :first_name, :last_name, :email, :organization, :sector, :active_status, :user_id, :group_ids, group_ids:[], groups_attributes: [:name, :program_name, :chair_first, :chair_last, :status, :kind, :user_id, :id])
  end

end
