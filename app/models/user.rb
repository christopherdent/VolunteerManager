class User < ApplicationRecord
  has_many :volunteers
  has_many :groups, through: :volunteers
  validates :username, presence: true
  validates :password, length: { in: 6..20 } 
  validates :email, presence: true
  validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :last_name, presence: true
  has_secure_password

end
