class PeerRequest < ActiveRecord::Base
  attr_accessible :from, :replied, :to
	
	belongs_to :user

end
