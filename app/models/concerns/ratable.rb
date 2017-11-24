module Ratable
	extend ActiveSupport::Concern
	
	included do
		def average_rating		
			unless ratings.size == 0
				ratings.sum(:score) / ratings.size
			else
				0
			end	
		end
	end
end