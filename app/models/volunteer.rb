class Volunteer < ApplicationRecord
  belongs_to :user
  has_many :groups


  def last_name=(s)
    write_attribute(:last_name, s.to_s.titleize) # The to_s is in case you get nil/non-string
  end

  def full_name
    "#{self.last_name}, #{self.first_name}"
  end


end
