class LikesController < ApplicationController

  before_action :authenticate_owner!

  def create
    @user = User.find(params[:user_id])
    @like = Like.new(owner_id: current_owner.id, user_id: params[:user_id])
    @like.save
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @like = Like.find_by(owner_id: current_owner.id, user_id: params[:user_id])
    @like.destroy
    respond_to do |format|
      format.html
      format.js
    end
  end
  
end
