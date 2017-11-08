class SearchController < ApplicationController
	def search_content
		@results = Book.search(params[:search])		
	end
end
