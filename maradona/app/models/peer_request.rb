class PeerRequest < ActiveRecord::Base
  attr_accessible :user_id, :replied, :to
	
	belongs_to :user
	
	after_save :create_peer_ship
	
	def create_peer_ship
		if self.replied == true
			user_id = self.user_id
			user2_id = self.to			
			Peership.create(:user_id => user_id, :user2_id => user2_id) unless Peership.peership_exists?(user_id, user2_id) 			
		end
		#Delete request object unless user did not make a selection 
		PeerRequest.destroy(self.id) unless self.replied == nil 
		
	end

	
	

end
