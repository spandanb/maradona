class Post < ActiveRecord::Base
  attr_accessible :content, :location, :user_id
  belongs_to :user

  validates :content, presence: true, length: { maximum: 250 }
  validates :user_id, presence: true
  default_scope order: 'posts.created_at DESC'
end


