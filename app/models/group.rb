class Group < ApplicationRecord
  belongs_to :user
  has_many :group_volunteers
  has_many :volunteers, through: :group_volunteers


  accepts_nested_attributes_for :volunteers



  def volunteers_attributes=(volunteer_attributes)
      volunteer_attributes.values.each do |volunteer_attribute|
      volunteer = Volunteer.find_or_create_by(category_attribute)
      self.volunteers << volunteer
    end
  end

  def active?
    self.status == true 
  end

end
