class DashboardsController < ApplicationController
	#Only authenticated users can view dashboard
	before_filter :authenticate
		
  
  def show 
  	# :id is obtained from url, i.e. dashboards/1  	
		@user = User.find(params[:id])
		redirect_to '/main' and return if current_user.id == @user.id	
			
    @profile = @user.profile
    
    #Create a peer_request, unless a request alread exists from current to required user
		@request_exists = PeerRequest.request_exists(current_user.id, @user.id)
		
		@peer_request = current_user.peer_requests.new(:to => @user.id) unless @request_exists

		@peership = Peership.exists?(current_user.id, @user.id)
		
		@subscription = Subscription.find_by_user_id_and_subscribed_to(current_user.id, @user.id) ||
										current_user.subscriptions.new(:subscribed_to => @user.id) 
		
    respond_to do |format|
      format.html # show.html.erb
    end
  end
	
	#show for current_user's dashboard
	def my_dashboard 
	
    @user = current_user    
    @profile = @user.profile    
    @my_requests = PeerRequest.where(:to => @user.id)
    @peers = Peership.get_peers(@user.id)
    
    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
  
	
end
