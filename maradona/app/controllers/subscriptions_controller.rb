class SubscriptionsController < ApplicationController
	
	def create
		@subscription = Subscription.new(params[:subscription])
    @subscription.save
    
    if @subscription.save
      redirect_to :back, :notice => 'You have subscribed'
    else
      redirect_to :back, :alert => 'Unable to subscribe'
    end

	end
	
	def update
		#Destroy subscription
		@s = Subscription.where(:user_id => params[:subscription][:user_id], :subscribed_to => params[:subscription][:subscribed_to]).first 
		if Subscription.delete(@s.id) == 0
			redirect_to :back, :notice => 'Unable to un-subscribe'
		else
			redirect_to :back, :notice => 'You have un-subscribed'
		end
	end
	
end
