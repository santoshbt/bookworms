require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'creation' do
  	before do
		@book = FactoryBot.create(:book)
		@user = User.create(email: 'test@test.com', password: 'asdfasdf', 
								password_confirmation: 'asdfasdf', first_name: 'John', last_name:'Snow')
	end
	it 'can be created' do	
		@review = Review.create(title: "Best Comedy book", description: "I have read it multiple times",
								user_id: @user.id, book: @book)
		expect(@review).to be_valid
	end

	it 'cannot be created' do
		@review = Review.create(title: "", description: "I have read it multiple times",
								user_id: @user.id, book: @book)
		expect(@review).to_not be_valid
	end
  end
end

