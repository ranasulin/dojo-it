class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :topic

  default_scope { order('created_at DESC') }
  #default_scope { joins(:user).order('users.name ASC') }
end
