class PostsController < ApplicationController
  def index 
  end

  def new
  end 

  def create 
    @post = Post.new post_params
    @post.poster = current_user
    @post.save
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
