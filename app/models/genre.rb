class Genre < ApplicationRecord
	validates :name, presence: true

	has_many :favorite_genres
	has_many :users, through: :favorite_genres
	has_many :books, dependent: :destroy

	include Favourable
end
