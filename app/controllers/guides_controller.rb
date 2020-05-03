class GuidesController < ApplicationController
  def index
    @guides = Guide.all
    @likes = Like.where(user_id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @guide = Guide.find(params[:id])
    @comment = Comment.new
    @comments = @guide.comments.includes(:user)
    @likes_count = Like.where(guide_id: @guide.id).count
    @likes = Like.where(user_id: current_user.id)
  end
end