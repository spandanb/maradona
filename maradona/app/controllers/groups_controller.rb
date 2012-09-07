class GroupsController < ApplicationController

	def index 
		@groups = Group.all
	end	
	
	def show
    @group = Group.find(params[:id])    
  end
  
	def new
		#By default, the current_user is added to the group
		@group = current_user.groups.new
	end
	
	def create
	  @group = Group.new(params[:group])
		@group.save
		redirect_to groups_path
	end		
	
	def update
    @group = Group.find(params[:id])
    if params[:commit] == "Join"
    	@group.users << current_user
    elsif params[:commit] == "Leave"
    	@group.users.delete(current_user)
    end
    redirect_to :back
  end
	
end