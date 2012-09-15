class GroupsController < ApplicationController

	def index 
		@groups = Group.all
	end	
	
	def show
    	@group = Group.find(params[:id])    
	@user = current_user
	@post = current_user.posts.build if logged_in?
	@post.user_id = current_user.id
	@post.group_id = @group.id.to_i


	@posts = Post.find_by_sql("SELECT \"posts\".* FROM \"posts\" WHERE \"posts\".\"group_id\" = #{@group.id} ORDER BY posts.created_at DESC")

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
