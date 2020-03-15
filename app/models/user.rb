class User < ApplicationRecord
  has_many :volunteers
  has_many :groups

  validates :username, uniqueness: true 

  has_secure_password

end
