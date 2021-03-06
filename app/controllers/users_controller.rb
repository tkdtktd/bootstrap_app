class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_owner!, only: [:new, :create, :edit, :update, :destroy]
  # ログインしていない場合は犬の登録などの操作を制限する。

  before_action :ensure_correct_owner, only: [:edit, :update, :destroy]
  # 飼い主以外は犬の情報を編集できないようにする。

  # GET /users
  # GET /users.json
  def index
    if params[:name] != "" && params[:age] == ""
      @users = User.where('name LIKE ?', "%#{params[:name]}%")
      @users = @users.page(params[:page]).per(10)
      flash[:warning] = "該当データなし" if @users.count == 0
    elsif params[:name] == "" && params[:age] != ""
      @users = User.where(age: params[:age])
      @users = @users.page(params[:page]).per(10)
      flash[:warning] = "該当データなし" if @users.count == 0
    elsif params[:name] && params[:age]
      @users = User.where('name LIKE ?', "%#{params[:name]}%").where(age: params[:age])
      @users = @users.page(params[:page]).per(10)
      flash[:warning] = "該当データなし" if @users.count == 0
    else
      flash[:warning] = ""
      @users = User.page(params[:page]).per(10)
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @like = Like.find_by(owner_id: current_owner.id, user_id: params[:id]) if signed_in?
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.owner_id = current_owner.id

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: '情報を登録しました' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: '情報を更新しました' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: '情報を削除しました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :age, :avatar, :remove_avatar, :owner_id, :introduction)
    end
    
    # 飼い主以外は犬の情報を編集できないようにするためのメソッド
    def ensure_correct_owner
      @user = User.find(params[:id])
      if current_owner.id != @user.owner_id
        flash[:notice] = "権限がありません"
        redirect_to users_path
      end
    end
end


