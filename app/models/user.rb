
class User < ApplicationRecord
  has_many :volunteers
  has_many :groups, through: :volunteers
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 2..100 }, on: :create
  validates :password, length: { in: 2..100 }, allow_blank: true, on: :update
  validates :email, presence: true, uniqueness: true 
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_one_attached :avatar
  scope :admin, -> { where(admin: true) }
  scope :general, -> { where(admin: false) }
  has_secure_password


    def full_name
      "#{self.last_name}, #{self.first_name}"
    end

end
