class BooksController < ApplicationController
	#ログインしないと、booksの画面は見れない
		before_action :authenticate_user!

	# なぜbooks_controllerのcreateを探し出してくるんだ？
	def create
		book = Book.new(book_params)
		book.user_id = current_user.id
		if book.save
			redirect_to user_path(current_user.id), notice: 'Book was successfully created.'
		else
		end
	end


	# 本一覧
	def index
		@book_new = Book.new #投稿用のnewインスタンスここで要るのか？
		@books = Book.all
	end
	# 本詳細,編集,更新,削除
	def show
		@book_new = Book.new
		@book = Book.find(params[:id])
		@user = User.find(@book.user_id)
	end
	def edit
		@book_new = Book.new
		@book = Book.find(params[:id])
		@user = @book.user
	end
	def update
		book = Book.find(params[:id])
		book.update(book_params)
		redirect_to book_path(book.id), notice: 'Book was successfully updated.'
	end
	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path, notice: 'Book was successfully destroyed.'
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
