class PostsController < ApplicationController
  def create 
    a = Post.new
    a.body = params[:post][:body]
    a.poster_id = params[:post][:poster_id]
    a.save
    redirect_to root_path
  end
end
