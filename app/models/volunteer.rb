class Volunteer < ApplicationRecord

  belongs_to :user
  has_many :volunteer_groups
  has_many :groups, through: :volunteer_groups

end
