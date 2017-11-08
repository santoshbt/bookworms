ThinkingSphinx::Index.define :book, :with => :active_record do	
	indexes :title, sortable: true
	indexes :author_name
	indexes genre.name, as: :genre_name	  

	has genre_id, created_at
end

