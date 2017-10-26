class GenresController < ApplicationController
	before_action :set_genre, only: ['show']

	def index
	end

	def new
		@genre = Genre.new
	end

	def create		
		@genre = Genre.new(genre_params)

		if @genre.save
			redirect_to @genre, notice: "Your post was created successfully"
		else
			render :new
		end	
	end

	def show		
	end

	private
	def genre_params
		params.require(:genre).permit(:name, :description)
	end

	def set_genre
		@genre = Genre.find params[:id]
	end
end
