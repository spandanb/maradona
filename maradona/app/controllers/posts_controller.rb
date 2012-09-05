class PostsController < ApplicationController

  before_filter  only: [:create, :destroy]

  def create
    @post = Post.new(params[:post])
    if @post.save == true
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      render 'Dashboards/show'
    end
  end


  def destroy
  end
end
