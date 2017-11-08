class Book < ApplicationRecord
	belongs_to :genre, optional: false
	has_many :ratings, dependent: :destroy
	has_many :reviews, dependent: :destroy

	searchable do
		text :title
		integer :genre_id
		text :author_name
		time :created_at		
	end

	def average_rating
		ratings.sum(:score) / ratings.size
	end
end
