class PicturesController < ApplicationController

  def index
    @pictures = Picture.where(guide_id: params[:guide_id])
    @likes = Like.where(user_id: current_user.id)
    @solds = UserGuide.where(user_id: current_user.id)
  end
  
end