class BooksController < ApplicationController
	before_action :is_admin?, only: ['new', 'create']
	before_action :set_book, only: ['show']

	def index
		@genre = Genre.select(:id, :name).find_by_id(params[:genre_id])
		@books = Book.all
	end

	def new		
		@genre = Genre.find_by_id params[:genre_id]
		@book = Book.new		
	end

	def create	
		@genre = Genre.find_by_id params[:genre_id]	
		@book = @genre.books.build book_params		

		if @book.save
			redirect_to genre_book_path(@genre, @book), notice: "Book was created successfully"
		end		
	end	

	def show 
		@book = Book.find_by_id params[:id]
		@book_reviews = @book.reviews
		@rating = Rating.where(book_id: @book.id, user_id: current_user.id).first
		unless @rating
		  @rating = Rating.create(book_id: @book.id, user_id: current_user.id, score: 0)
		end
	end

	private
	def book_params
		params.require(:book).permit(:title, :author_name, :genre_id)
	end

	def set_book
		@book = Book.find params[:id]
	end
end
