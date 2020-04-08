class Group < ApplicationRecord
  belongs_to :user, optional: true
  has_many :group_volunteers
  has_many :volunteers, through: :group_volunteers
  accepts_nested_attributes_for :volunteers
  validate :is_title_case
  before_validation :make_title_case

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



private

  def is_title_case
    if name.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:name, "Name must be in title case")
    end
  end

  def make_title_case
    self.name = self.name.titlecase
  end



end
