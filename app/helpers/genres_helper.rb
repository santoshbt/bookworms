module GenresHelper
	def already_my_favorite genre_id
		favorite_genres = current_user.favorite_genres.where(genre_id: genre_id) 
		return true if favorite_genres.count > 0
		return false
	end
end
