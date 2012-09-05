class DashboardsController < ApplicationController
	#Only authenticated users can view dashboard
	before_filter :authenticate
		
  
  def show 
  	# :id is obtained from url, i.e. dashboards/1  	
		@user = User.find(params[:id])
		@posts = @user.posts.paginate(page: params[:page])

		    @temp = Post.find_by_other_users("#{@user.id.to_s}")
		    if @temp != nil

			@posts.append(@temp)
			@posts.sort!{|a,b| b[:created_at] <=> a[:created_at]}
		    end


		redirect_to '/main' and return if current_user.id == @user.id	

		@post = current_user.posts.build if logged_in?
		@post.user_id = current_user.id
		@post.other_users = "#{@user.id.to_s}"


    		@profile = @user.profile

    
    #Create a peer_request, unless a request alread exists from current to required user
		#What would you see if they are pending your reply
		@peer_request = PeerRequest.new(:user_id => current_user.id, :to => @user.id) unless PeerRequest.find_by_user_id_and_to(current_user.id, @user.id)
		 
		@peership = Peership.exists?(current_user.id, @user.id)
		
		@subscription = Subscription.create(:user_id => current_user.id, :subscribed_to => @user.id) unless Subscription.find_by_user_id_and_subscribed_to(current_user.id, @user.id)
		
    respond_to do |format|
      format.html # show.html.erb
    end
  end
	
	#show for current_user's dashboard
	def my_dashboard 
	
    @user = current_user    
    @profile = @user.profile    
    @posts = @user.posts.paginate(page: params[:page])
 

    @temp = Post.find_by_other_users("#{@user.id.to_s}")
    if @temp != nil

	@posts.append(@temp)
	@posts.sort!{|a,b| b[:created_at] <=> a[:created_at]}
    end


    @my_requests = PeerRequest.where(:to => @user.id)
    @peers = Peership.get_peers(@user.id)
    @post = current_user.posts.build if logged_in?




    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
  
	
end
