require 'rails_helper'

RSpec.describe Book, type: :model do
  	describe 'creation' do
		before do						
			@genre = FactoryGirl.create(:genre)
			@book = Book.create(title: "My Comedy Series", author_name: "Jon Paul", genre_id: @genre.id)
			puts @book.inspect
		end

		it 'can be created' do
			expect(@book).to be_valid
		end

		it 'cannot be created without a genre' do
			@book.genre_id = nil
			expect(@book).to_not be_valid
		end
	end	
end


