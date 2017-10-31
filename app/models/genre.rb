class Genre < ApplicationRecord
	validates :name, presence: true

	has_many :favorite_genres
	has_many :users, through: :favorite_genres

	def favorite(user)
		unless user.blank?
			existing_favorite_genre = favorite_genres.where(user: user)
			if existing_favorite_genre.count == 0
				favorite_genres.build(user: user)
				save		
			end			
		else
			false
		end
	end
end
