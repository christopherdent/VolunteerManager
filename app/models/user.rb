class User < ApplicationRecord
  has_many :volunteers
  has_many :groups

end
