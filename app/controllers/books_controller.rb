class BooksController < ApplicationController
	before_action :is_admin?, only: ['new', 'create']
	before_action :set_book, only: ['show']

	def index
		@books = Book.all
	end

	def new		
		@book = Book.new		
	end

	def create		
		@book = Book.new(book_params)

		if @book.save
			redirect_to @book, notice: "Your post was created successfully"
		else
			render :new, alert: "Sorry there was some problem while creating the genre"	
		end	
	end

	private
	def book_params
		params.require(:book).permit(:name, :description)
	end

	def set_book
		@book = Book.find params[:id]
	end
end
