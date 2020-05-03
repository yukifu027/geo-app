class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/guides/#{comment.guide.id}" 
  end
  
  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, guide_id: params[:guide_id])
  end
end
