class DashboardsController < ApplicationController
	#Only authenticated users can view dashboard
	before_filter :authenticate
		
  
  def show 
  	# :id is obtained from url, i.e. dashboards/1
		@user = User.find(params[:id])
    @profile = @user.profile

    respond_to do |format|
      format.html # show.html.erb
    end
  end
	
	#show for current_user's dashboard
	def my_dashboard 
	
    @user = current_user    
    @profile = @user.profile
    
    respond_to do |format|
      format.html # show.html.erb
    end
  end
	
end
