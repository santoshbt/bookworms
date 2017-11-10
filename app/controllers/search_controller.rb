class SearchController < ApplicationController
	def show
	end
		
	def search_content
		@book_results, @user_results = [], []
		@book_results = Book.search(params[:search])		
		@user_results = User.search(params[:search])
	end
end
