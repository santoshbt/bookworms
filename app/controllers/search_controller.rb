class SearchController < ApplicationController
	def show
	end
	
	
	def search_content
		@results = Book.search(params[:search])		
	end
end
