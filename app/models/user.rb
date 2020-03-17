class User < ApplicationRecord
  has_many :volunteers
  has_many :groups, through: :volunteers
  validates :username, uniqueness: true
  has_secure_password

end
