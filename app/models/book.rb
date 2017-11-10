class Book < ApplicationRecord
	belongs_to :genre, optional: false
	has_many :ratings, dependent: :destroy
	has_many :reviews, dependent: :destroy
	
	# after_save ThinkingSphinx::RealTime.callback_for(:book)

	def average_rating
		ratings.sum(:score) / ratings.size
	end
end
