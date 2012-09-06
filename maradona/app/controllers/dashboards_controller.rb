class DashboardsController < ApplicationController
	#Only authenticated users can view dashboard
	before_filter :authenticate
		
  
  def show 
  	# :id is obtained from url, i.e. dashboards/1  	
		@user = User.find(params[:id])
		#@posts = @user.posts.paginate(page: params[:page])

		    @posts = Post.find_by_sql("SELECT \"posts\".* FROM \"posts\" WHERE \"posts\".\"user_id\" = #{@user.id} OR \"posts\".\"other_users\" = #{@user.id.to_s} ORDER BY posts.created_at DESC")
		    #if @temp != nil

		    #	@posts.append(@temp)
#			@posts.sort!{|a,b| b[:created_at] <=> a[:created_at]}
		    #end


		redirect_to '/main' and return if current_user.id == @user.id	

		@post = current_user.posts.build# if logged_in?
		@reply_post = current_user.posts.build# if logged_in?
		@post.user_id = current_user.id
		@post.other_users = "#{@user.id.to_s}"

		@reply_post.user_id = current_user.id
		@reply_post.other_users = "#{@user.id.to_s}"

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
    @posts = @user.posts.paginate(page: params[:page])
    @posts = Post.find_by_sql("SELECT \"posts\".* FROM \"posts\" WHERE \"posts\".\"user_id\" = #{@user.id} OR \"posts\".\"other_users\" = #{@user.id.to_s} ORDER BY posts.created_at DESC") 
    
    @post = current_user.posts.build# if logged_in?
    
    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
  def peers_page 
  	@user = current_user
  	@my_requests = PeerRequest.where(:to => @user.id)
    @peers = Peership.get_peers(@user.id)
  	  	
  end
  
end
