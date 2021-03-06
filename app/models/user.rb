
class User < ApplicationRecord
  has_many :volunteers
  has_many :groups, through: :volunteers
  validates :username, presence: true, uniqueness: true
  validates :password, length: { in: 2..100 }
  validates :email, presence: true, uniqueness: true 
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_one_attached :avatar
  scope :admin, -> { where(admin: true) }
  scope :general, -> { where(admin: false) }
  has_secure_password


  def self.from_omniauth(auth)
      where(email: auth.info.email).first_or_initialize do |user|
        user.username = auth.info.name
        user.email = auth.info.email
        user.password = SecureRandom.hex
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        #user.admin = false   #this was de-admining admins.  I've set a default to false in the schema instead.
      end
    end

    def full_name
      "#{self.last_name}, #{self.first_name}"
    end

end
