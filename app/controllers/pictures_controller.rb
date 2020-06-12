class PicturesController < ApplicationController

  def index
    @pictures = Picture.where(guide_id: 1)
    @likes = Like.where(user_id: current_user.id)
    @solds = UserGuide.where(user_id: current_user.id)
  end
  
end