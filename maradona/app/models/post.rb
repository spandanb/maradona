class Post < ActiveRecord::Base
  attr_accessible :content, :location, :user_id,:other_users,:reply_id, :group_id
  belongs_to :user
  has_many :reply
  has_many :tag
  validates :content, presence: true, length: { maximum: 250 }
  validates :user_id, presence: true
  default_scope order: 'posts.created_at DESC'
end


