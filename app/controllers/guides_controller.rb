class GuidesController < ApplicationController
  def index
    return nil if params[:keyword] == ""
    @guides_key = Guide.where(['title LIKE ?', "%#{params[:keyword]}%"] )
    respond_to do |format|
      format.html
      format.json
    end
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