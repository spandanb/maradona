class PostsController < ApplicationController

  before_filter  only: [:create, :destroy]

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      render 'Dashboards/show'
    end
  end


  def destroy
  end
end
