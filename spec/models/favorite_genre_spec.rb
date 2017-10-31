require 'rails_helper'

RSpec.describe Genre, type: :model do
	before do		
		@user = FactoryGirl.create(:user)
	end

	describe 'mark genre as favorite' do		
		it 'can be marked as favorite' do			
			@genre = Genre.create(name: "Fiction", description: "Fictional story books")
			@favorite_genre = FavoriteGenre.create(user: @user, genre: @genre)
			expect(@favorite_genre).to be_valid
		end		
	end

	# describe 'remove genre as favorite' do		
	# end
end