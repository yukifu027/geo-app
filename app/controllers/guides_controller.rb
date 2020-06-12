class GuidesController < ApplicationController
  require 'payjp'

  def pay
    @guide = Guide.find(params[:id])
    Payjp.api_key = "sk_test_75a1cf07d11562a783711721"
    Payjp::Charge.create(
      amount: @guide.price, 
      card: params['payjp-token'], 
      currency: 'jpy'
    )
    @user_guide = UserGuide.new(user_id: current_user.id, guide_id: @guide.id)
    if @user_guide.save
      redirect_to guide_pictures_path(@guide.id)
    else
      redirect_to guide_path(@guide.id)
    end
  end

  def index
    return nil if params[:keyword] == ""
    @guides_key = Guide.where(['title LIKE ?', "%#{params[:keyword]}%"] )
    respond_to do |format|
      format.html
      format.json
    end
    @guides_hokkaido = Guide.where(area: "北海道")
    @guides_tohoku = Guide.where(area: "東北")
    @guides_kantou = Guide.where(area: "関東")
    @guides_tokai = Guide.where(area: "東海")
    @guides_kansai = Guide.where(area: "関西")
    @guides_chugoku = Guide.where(area: "中国")
    @guides_shikoku = Guide.where(area: "四国")
    @guides_kyushu = Guide.where(area: "九州")
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