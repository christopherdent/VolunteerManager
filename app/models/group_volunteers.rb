class PostCategory < ActiveRecord::Base
  belongs_to :group
  belongs_to :volunteer
end
