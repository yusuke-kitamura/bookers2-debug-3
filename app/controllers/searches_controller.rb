class SearchesController < ApplicationController
	def search
		@book = Book.new
		@user_or_book = params[:option]
		@how_search = params[:choice]

		if @user_or_book == "1"
			@users = User.search(params[:search], @user_or_book, @how_search)
		else
			@books = Book.search(params[:search], @user_or_book, @how_search)
		end
	end
end
