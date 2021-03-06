class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :followings, :followers, :destroy]
  
  
  def show # 追加
   @user = User.find(params[:id])
   @microposts = @user.microposts
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end
  
  def edit
  
  end
  
  def update
    if @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to @user , notice: '内容を編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end  
  

  def followings
    @followings_user = @user.following_users
  end
  

  def followers
    @followers_user = @user.follower_users
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :area)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  
end