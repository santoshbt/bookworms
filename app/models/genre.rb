class Genre < ApplicationRecord
	validates :name, presence: true

	has_many :favorite_genres
	has_many :users, through: :favorite_genres

	def favorite(user)
		unless user.blank?
			favorite_genres.build(user: user)
			save				
		else
			false
		end
	end
end
