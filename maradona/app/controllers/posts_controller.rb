class PostsController < ApplicationController

  before_filter  only: [:create, :destroy]

  def create
    @post = Post.new(params[:post])
    if @post.save == true
      flash[:success] = "Post created!"
      redirect_to root_url
#    else
#      render 'dashboards/show'
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @reply_post = Post.find_by_sql("SELECT \"posts\".* FROM \"posts\" WHERE \"posts\".\"reply_id\" = #{@post.id}")

    for row in @reply_post
	row.delete
    end

    @post.destroy


    redirect_to root_url

  end
end
