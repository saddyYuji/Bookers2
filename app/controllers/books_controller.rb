class BooksController < ApplicationController
	#ログインしないと、booksの画面は見れない
		before_action :authenticate_user!


# newは不要、投稿はユーザ情報の下部分で行うので、画面がない。
	def create
		book = Book.new(book_params)
		book.save
		redirect_to book_path(book.id), notice: 'Book was successfully created.'
	end

	# 本一覧
	def index
		@book = Book.new #投稿用のnewインスタンスここで要るのか？
		@books = Book.all
	end
	# 本詳細,編集,更新,削除
	def show
		@book = Book.find(params[:id])
	end
	def edit
		@book = Book.find(params[:id])
	end
	def update
		@book = Book.find(params[:id])
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
