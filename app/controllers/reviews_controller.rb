class ReviewsController < ApplicationController	
	def new
		if user_signed_in?	
			set_genre_book		
			@review = Review.new
		else
			flash[:alert] = "Sorry you need to login first"
			redirect_to genres_path
		end
	end

	def create		
		if user_signed_in?	
			set_genre_book
			@review = @book.reviews.build(review_params)	
			if @review.save
				redirect_to genre_book_path(@genre, @book), notice: "Your review was posted successfully"
			end
		else
			flash[:alert] = "Sorry you need to login first"
			redirect_to genres_path
		end
	end

	def show
		@review = Review.find params[:id]
		@comment = Comment.new
		@review_comments = @review.comments.order("created_at desc")
	end

	private

	def review_params
		params.require(:review).permit(:title, :description, :user_id, :book_id)
	end

	def set_genre_book
		@genre = Genre.find params[:genre_id]	
		@book = Book.find params[:book_id]
	end
end
