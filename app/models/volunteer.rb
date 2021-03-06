class Volunteer < ApplicationRecord
  belongs_to :user, optional: true
  has_many :group_volunteers
  has_many :groups, through: :group_volunteers, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :sector, presence: true
  validates :organization, presence: true
  scope :active, -> { where(active_status: true) }
  scope :inactive, -> { where(active_status: false) }
  accepts_nested_attributes_for :groups
  accepts_nested_attributes_for :group_volunteers
  has_one_attached :cv

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
