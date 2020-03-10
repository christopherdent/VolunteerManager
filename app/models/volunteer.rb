class Volunteer < ApplicationRecord

  belongs_to :user
  has_many :groups, through :volunteer_groups

end
