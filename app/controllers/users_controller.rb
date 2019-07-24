class UsersController < ApplicationController

#ログインしないと、usersの画面は見れない
	before_action :authenticate_user!

# トップ画面の作成
	def top
	end


# ユーザ詳細画面
	def show
		@user = User.find(params[:id])
		@book = Book.new
		@books = @user.books
		# Todo ページネーション
	end

# ユーザ情報編集画面
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user.id)
	end

# ユーザ一覧画面
	def index
		@users = User.all

	end


	private
	def user_params
		params.require(:user).permit(:name, :profile_image)
	end
end
