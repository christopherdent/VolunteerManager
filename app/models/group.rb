class Group < ApplicationRecord
  belongs_to :user 
has_many :volunteers, through: :volunteer_groups


end
