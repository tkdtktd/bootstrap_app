class OwnersController < ApplicationController
  
  # 本人以外は編集できないようにする。

  def show
    @owner = Owner.find(params[:id])
    @users = @owner.users
    @users = @users.page(params[:page]).per(3)
  end

  private
  
    def ensure_correct_owner
      @owner = User.find(params[:id])
      if current_owner.id != @user.owner_id
        flash[:notice] = "権限がありません"
        redirect_to users_path
      end
    end
end