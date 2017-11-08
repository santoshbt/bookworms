class BookIndex

	def self.index_docs
		ThinkingSphinx::Index.define :book, :with => :active_record do
			indexes title
			indexes genre.name, :as => genre, :sortable => true
			
			has author_id, created_at
		end
	end

end