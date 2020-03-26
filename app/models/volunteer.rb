class Volunteer < ApplicationRecord
  belongs_to :user
  #has_many :groups

  has_many :group_voluteers
  has many :groups, through :group_volunteers 

  def last_name=(s)
    write_attribute(:last_name, s.to_s.titleize) # The to_s is in case you get nil/non-string
  end



end
