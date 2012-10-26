class Reply < ActiveRecord::Base
  attr_accessible :content, :post_id, :reply_id, :user_id
  belongs_to :post
  validates :content, presence: true, length: { maximum: 250 }
  validates :user_id, presence: true
  default_scope order: 'replies.created_at DESC'
end


