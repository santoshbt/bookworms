class Book < ApplicationRecord
	belongs_to :genre, optional: false
	has_many :ratings, dependent: :destroy
	has_many :reviews, dependent: :destroy

	default_scope { order(updated_at: :desc) }
	
	# after_save ThinkingSphinx::RealTime.callback_for(:book)
	include Ratable
	include Downloadable

	def cached_reviews
		Rails.cache.fetch([self.class.name, updated_at.to_i, :reviews], expires_in: 240.hours) {
			reviews.to_a
		}
	end
end
