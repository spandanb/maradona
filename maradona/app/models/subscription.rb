class Subscription < ActiveRecord::Base
  attr_accessible :subscribed_to, :user_id

	belongs_to :user
end
