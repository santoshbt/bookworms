class SearchController < ApplicationController
	def book_search
		search = Sunspot.search(Book) do
			fulltext("#{params[:search]}")
			with :genre_id, 1
			order_by :created_at, :asc
		end

		reslts  = search.results

		p results
	end
end
