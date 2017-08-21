class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.create comment_params
    
    respond_to do |format|
      format.html{ redirect_back fallback_location: root_path }
      format.js
    end
  end

  def destroy
  end
  
  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
