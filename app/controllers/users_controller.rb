class UsersController < ApplicationController
  before_action :authenticate_user!
	before_action :baria_user, only: [:update]

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  	@book = Book.new #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
  end

  def index
  	@users = User.all #一覧表示するためにUserモデルのデータを全て変数に入れて取り出す。
  	@book = Book.new #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
  end

  def edit
  	@user = User.find(params[:id])
    redirect_to user_path(current_user) if current_user != @user
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to user_path(@user), notice: "successfully updated user!"
  	else
  		render "edit"
  	end
  end

# フォローしている人とフォローされている人の見極め方が分からない
  def followed
    @user = User.find(params[:user_id])
    @users = @user.follower_user
  end

  def follower
    @user = User.find(params[:user_id])
    @users = @user.following_user
    @users = @user.follower_user
  end
  # フォローしている人とフォローされている人の見極め方が分からない

  private
  
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

  #url直接防止　メソッドを自己定義してbefore_actionで発動。
   def baria_user
  	unless params[:id].to_i == current_user.id
  		redirect_to user_path(current_user)
  	end
   end

   def zipedit
  params.require(:user).permit(:postcode, :prefecture_name, :address_city, :address_street)
end

end
