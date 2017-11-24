module Downloadable
	extend ActiveSupport::Concern

	included do					
		def self.excluded_attributes
			['id']
		end

		def self.column_custom_names
			{ 
				title: 'Title',
				author_name: 'Author Name',
				genre: 'Genre',
				created_at: 'Published On',
				updated_at: 'Modified On'
			}
		end

		def self.to_csv(options = {})
		  CSV.generate(options) do |csv|
		  	original_columns = column_custom_names.keys
		  	modified_columns = column_custom_names.values
		  	modified_columns << ['Reviews Count', 'Average Rating']
		  	row = []
		  	csv << modified_columns.flatten	
		    all.each do |book|
		    	reviews_count = book.reviews.count
		    	average_rating = book.average_rating		    	
		    	row = [book.title, book.author_name, book.genre.name, book.created_at, book.updated_at,
		    			reviews_count, average_rating]	
		    
		    	csv << row		   		    
		    end
		  end
		end		
	end
end