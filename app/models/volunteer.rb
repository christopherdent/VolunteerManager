class Volunteer < ApplicationRecord
  belongs_to :user, optional: true
  has_many :group_volunteers
  has_many :groups, through: :group_volunteers, dependent: :destroy
  accepts_nested_attributes_for :groups

  def last_name=(s)
    write_attribute(:last_name, s.to_s.titleize) # The to_s is in case you get nil/non-string
  end

  def full_name
    "#{self.last_name}, #{self.first_name}"
  end

  def groups_attributes=(group_attributes)
    group_attributes.values.each do |group_attribute|
        group = Group.find_or_create_by(group_attribute)
        self.groups << group

    end
  end



end
