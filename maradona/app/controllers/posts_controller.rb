class PostsController < ApplicationController

  before_filter  only: [:create, :destroy, :reply]

  def create
    @post = Post.new(params[:post])
    if @post.save == true
      flash[:success] = "Post created!"
      redirect_to root_url
#    else
#      render 'dashboards/show'
    end
  end

  def reply

	@reply_post = Post.new(params[:reply_post])
	    if @reply_post.save == true
	      flash[:success] = "Post created!"
	      redirect_to root_url
#	    else
#	      render 'dashboards/show'
	    end
	b = 123
	a = File.new("/tmp/wasi","w")
#	@post = Post.find(params[:id])
	a.write("#{b.to_s}")
	a.close
  end

  def destroy
  end
end
