class HomeController < ApplicationController
  def index
    @posts = Post.order("updated_at DESC").page(1).per(5)
  end
end
