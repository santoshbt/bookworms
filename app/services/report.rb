class Report	
	def initialize(user, category)	
		@user = user	
		@category = category
	end

	def download
		puts @category.inspect
		puts  @user.admin?
		if @category == "book" && @user.admin?
			books = Book.includes(:ratings, :reviews).order(:updated_at)
			OpenStruct.new({ books: books, result: 'success' })
		else
			OpenStruct.new({ books: nil, result: 'error' })				
		end
	end
end