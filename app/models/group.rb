class Group < ApplicationRecord
  belongs_to :user
#has_many :volunteers 

  has_many :group_volunteers
  has_many :volunteers, through :group_volunteers

end
