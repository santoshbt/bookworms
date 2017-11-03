require 'rails_helper'

RSpec.describe Genre, type: :model do
	describe 'creation' do
		before do
			@genre = FactoryGirl.create(:genre)
			@book = FactoryGirl.create(:book)
		end
		it 'can be created' do			
			expect(@genre).to be_valid
		end	

		it 'cannot be created without genre name' do
			@genre.name = nil
			expect(@genre).to_not be_valid
		end	
	end
end