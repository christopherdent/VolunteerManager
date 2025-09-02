class GroupsController < ApplicationController
before_action :require_login
before_action :admin_only, except: [:index, :show]
before_action :set_group, only: [:update]

  def index
     @groups = Group.active.sort_by(&:name)  #for listing all of the groups on the index page
  end

  def new
    @group = Group.new :status => true  #default all new groups to active.
    @volunteers = Volunteer.all #be able to add a group member (the Chair) when creating the group.
  end

  def create
    @group = Group.create(group_params)
    if group_params[:volunteer_ids] != ""  #if the group is being created with a volunteer
      @volunteer = Volunteer.find(group_params[:volunteer_ids])
      @group.chair_first = @volunteer.first_name
      @group.chair_last = @volunteer.last_name #assigns the volunteer the chair role
    end

    if @group.save  #if all that worked, go to the group show page
      redirect_to group_path(@group)
    else
      render action: :new
    end
  end

def show
  @group = Group.find(params[:id])
  @group_volunteer = GroupVolunteer.new

  # preload join records for the members list + emails
  gvs = @group.group_volunteers.includes(:volunteer)

  @members  = gvs.map(&:volunteer).compact.uniq.sort_by(&:last_name)
  @gv_index = gvs.index_by(&:volunteer_id)

  # emails for the mail_to
  @emails = @members.map(&:email).compact.uniq

  # <-- this was missing:
  @volunteers = Volunteer.order(:last_name)  # or .select(:id, :first_name, :last_name).order(:last_name)
end


  def edit
    @group = Group.find(params[:id])
    @chair = @group.chair
  end

  def update
    if group_params.key?(:volunteers_attributes) #handles the nested form to add a brand new volunteer to the current group
      #@group = Group.find(params[:id])
      @volunteer = Volunteer.find_or_create_by(group_params[:volunteer_ids])
      @group.update(group_params)
      @group.volunteers <<  @volunteer  #this block works with the nested route to add a brand new volunteer to the current group.  Ensures that volunteer is added to this group.
    else #and thsis block is for a regular group-edit.
    #  @group = Group.find(params[:id]) #why does group_params not work here?  error is Couldnt find group without an ID? Can this be cleaned up with before_action set_group?
      @volunteer = Volunteer.find(group_params[:volunteer_ids]) unless group_params[:volunteer_ids] == ""
      #@group.update(group_params)  #this line won't work because it update parts that should not be updated, the logic below tells it how to handle each item.
        @group.name = group_params[:name]
        @group.program_name = group_params[:program_name]
        @group.status = group_params[:status]
        @group.chair_first = @volunteer.first_name unless group_params[:volunteer_ids] == ""
        @group.chair_last = @volunteer.last_name unless group_params[:volunteer_ids] == ""
        @group.kind = group_params[:kind]
        @group.volunteers <<  @volunteer unless group_params[:volunteer_ids] == ""
        if group_params[:volunteer_ids] == ""
          @group.chair_first = nil
          @group.chair_last = nil
        end
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
    @group.volunteers = []  #remove all volunteers from the group
    @group.destroy  #then destroy it
    redirect_to groups_path
  end

private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
      params.require(:group).permit(:id, :name, :program_name, :chair_first, :chair_last, :status, :kind, :user_id, :volunteer_ids, volunteer_ids:[], volunteers_attributes: [:last_name, :first_name, :email, :organization, :sector, :active_status, :id])
  end

end
