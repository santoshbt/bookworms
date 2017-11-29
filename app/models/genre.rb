class Genre < ApplicationRecord
	validates :name, presence: true

	has_many :favorite_genres
	has_many :users, through: :favorite_genres
	has_many :books, dependent: :destroy

	include Favourable

	def genre_name
		Rails.cache.fetch([:genre, :id, :name], expires_in: 5.minutes) do
			genre.name
		end
	end

	def genre_description
	end	
end
