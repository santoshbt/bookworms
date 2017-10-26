require 'rails_helper'

describe 'navigate' do
	describe 'index' do
		it 'can be reached successfully' do
			visit genres_path
			expect(page.status_code).to eq(200)
		end

		it 'has a name of genres' do
			visit genres_path
			expect(page).to have_content(/Genres/)
		end
	end
end