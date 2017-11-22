module Favourable
	extend ActiveSupport::Concern

	included do		
		default_scope { order(updated_at: :desc) }

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
end