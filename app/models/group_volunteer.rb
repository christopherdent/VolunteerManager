class GroupVolunteer < ApplicationRecord
  belongs_to :volunteer
  belongs_to :group

  def last_name
    @volunteer.last_name if @volunteer 
  end

end
