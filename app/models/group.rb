class Group < ApplicationRecord
  belongs_to :user, optional: true
  has_many :group_volunteers
  has_many :volunteers, through: :group_volunteers
  accepts_nested_attributes_for :volunteers

  def volunteers_attributes=(volunteer_attributes)
      volunteer_attributes.values.each do |volunteer_attribute|
      volunteer = Volunteer.find_or_create_by(volunteer_attribute)
      self.volunteers << volunteer
    end
  end

  def active?
    self.status == true
  end

  def chair
    "#{self.chair_first}, #{self.chair_last}"
  end


end
