class GuidesController < ApplicationController
  def index
    @guides = Guide.all
    @guide = Guide.find_by(params[:id])
  end

  def show
    @user = User.find_by(params[:id])
    @guide = Guide.find_by(params[:id])
    @comment = Comment.new
    @comments = @guide.comments.includes(:user)
  end
end
