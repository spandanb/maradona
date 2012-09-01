class PeerRequestsController < ApplicationController
	
	def create
		@this_user = current_user
    @peer_request = @this_user.peer_request.new
    @peer_request = get_user_id 
    if @peer_request.save
      redirect_to @this_user, :notice => 'Your request has been sent'
    else
      redirect_to @this_user, :alert => 'Unable to send your request'
    end
  end

	private
    def get_user
      @other_user = User.find(params[:id])
    end
    
    def get_user_id
      @other_user_id = User.find(params[:id]).id
    end


end
