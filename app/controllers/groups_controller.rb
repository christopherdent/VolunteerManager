class GroupsController < ApplicationController


  def index

    # @group = Group.new

  # if group_params.has_key?('kind')
  #   @groups = Group.where(["kind = ?", group_params[:kind]])
   #else
     @groups = Group.all
  # end
end

  def new
    @group = Group.new :status => true
    @volunteers = Volunteer.all

  end


  def create
    @group = Group.create(group_params)
    byebug
    if group_params[:volunteer_ids] != ""
      @volunteer = Volunteer.find(group_params[:volunteer_ids])
      @group.chair_first = @volunteer.first_name
      @group.chair_last = @volunteer.last_name #assigns the volunteer the chair role
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
    if group_params.key?(:volunteers_attributes)
      @group = Group.find(params[:id])
      @volunteer = Volunteer.find_or_create_by(group_params[:volunteer_ids])
      @group.update(group_params)
      @group.volunteers <<  @volunteer
    else
      @group = Group.find(params[:id]) #why does group_params not work here?  error is Couldnt find group without an ID?
      @volunteer = Volunteer.find(group_params[:volunteer_ids])

        @group.name = group_params[:name]
        @group.program_name = group_params[:program_name]
        @group.status = group_params[:status]
        @group.chair_first = @volunteer.first_name
        @group.chair_last = @volunteer.last_name
        @group.kind = group_params[:kind]
        @group.volunteers <<  @volunteer if !@group.volunteers.include?(@volunteer)
        @group.save
    end
    redirect_to group_path(@group)
  end

  def update_two  # this action handles the Add Existing Volunteer to Group form.
    
    @group = Group.find(params[:id])
    @volunteer = Volunteer.find(group_params[:volunteer_ids])
    @group.volunteers <<  @volunteer
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
      params.require(:group).permit(:id, :name, :program_name, :chair_first, :chair_last, :status, :kind, :user_id, :volunteer_ids, volunteer_ids:[], volunteers_attributes: [:last_name, :first_name, :email, :organization, :sector, :active_status, :id])
    #params.permit!
  end

end
