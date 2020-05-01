class GuidesController < ApplicationController
  def index
    @user = User.find_by(params[:id])
  end

  def show
  end
end
