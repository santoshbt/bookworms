class Book < ApplicationRecord
	belongs_to :genre, optional: false
	has_many :ratings, dependent: :destroy
	has_many :reviews, dependent: :destroy

	default_scope { order(updated_at: :desc) }
	
	# after_save ThinkingSphinx::RealTime.callback_for(:book)
	include Ratable
	include Downloadable
end
