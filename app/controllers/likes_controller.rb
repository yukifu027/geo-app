class LikesController < ApplicationController

  def create
    like = Like.new(
      user_id: current_user.id,
      guide_id: params[:guide_id]
    )
    like.save
    redirect_to "/guides/#{like.guide.id}"
  end

  def destroy
    like = Like.find_by(
      user_id: current_user.id,
      guide_id: params[:guide_id]
    )
    like.destroy
    redirect_to "/guides/#{like.guide.id}"
  end
end