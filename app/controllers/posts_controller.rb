class PostsController < ApplicationController
  before_action :require_login 
  def index 
  end

  def new
  end 

  def create 
    @post = Post.new post_params
    @post.poster = current_user
    @post.save
    raise
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit(:body)
  end

  def paging
    params[:per] ||= 5
    @post = Post.order("updated_at DESC").page(params[:page]).per(params[:per]) 

    render partial: 'post', collection: @post, layout: false
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @post}
    end
end

