class GenresController < ApplicationController	
	before_action :is_admin?, only: ['new', 'create']
	before_action :set_genre, only: ['show']

	def index
		@genres = Genre.all
	end

	def new		
		@genre = Genre.new		
	end

	def create		
		@genre = Genre.new(genre_params)

		if @genre.save
			redirect_to @genre, notice: "Your post was created successfully"
		else
			render :new, alert: "Sorry there was some problem while creating the genre"	
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
