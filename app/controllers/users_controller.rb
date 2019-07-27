class UsersController < ApplicationController

#ログインしないと、usersの画面は見れない
	before_action :authenticate_user!

# トップ画面の作成
	def top
	end


# ユーザ詳細画面
	def show
		@user = User.find(params[:id])
		@book_new = Book.new
		@books = @user.books
	end



# ユーザ情報編集画面
	def edit
		@user = User.find(params[:id])
		if @user != current_user
			redirect_to user_path(current_user.id)
		end
	end
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user.id), notice: 'Profile was successfully updated.'
		else
			render :edit
		end
	end


# ユーザ一覧画面
	def index
		@users = User.all
		@book_new = Book.new
		@user = current_user
	end


	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end
end
