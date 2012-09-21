class PeerRequestsController < ApplicationController
	
	def create
    @peer_request = PeerRequest.new(params[:peer_request])#current_user.peer_requests.new

    if @peer_request.save
      redirect_to :back, :notice => 'Your request has been sent'
    else
      redirect_to :back, :alert => 'Unable to send your request'
    end

  end
  
  def update
    @request = PeerRequest.find(params[:id])
    @request.replied = case params[:commit] 
    									 	when "Accept" then true
    									 	when "Decline" then false
    									 	else nil 
    									 end
    @request.save
    redirect_to :back     							  
 	end

	private
    def get_user
      @other_user = User.find(params[:id])
    end
    
    def get_user_id
      @other_user_id = User.find(params[:id]).id
    end


end
