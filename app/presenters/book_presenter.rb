class BookPresenter < BasePresenter
	presents :book
	delegate :ratings, to: :book
	delegate :reviews, to: :book
	delegate :average_rating, to: :book
	
	def title
		book.title.camelize rescue nil
	end

	def reviews
		arr = book.reviews

		content_tag(:div, class: 'reviews') do
			arr.each do |review|
				concat( content_tag(:div, class: "well") do
					concat content_tag(:p, link_to(genre_book_review_path(book.genre.id, book.id, review.id)) do
													    review.title
													end)
					concat content_tag(:p, review.description)
				end)
			end
		end
	end
end