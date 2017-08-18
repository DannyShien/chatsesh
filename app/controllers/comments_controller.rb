class CommentsController < ApplicationController
  def create
    @comment = Comment.new comment_params
    @comment.user = current_user
    @comment.save
    redirect_to root_path
  end



  def destroy
  end
  
  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
