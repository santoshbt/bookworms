require 'rails_helper'

describe 'navigate' do
	describe 'index' do
		before do
			admin_user = FactoryGirl.create(:admin_user)	
			login_as(admin_user, scope: :user)				
		end

		it 'can be reached successfully' do			
			visit genres_path
			genre = FactoryGirl.create(:genre)
			visit genres_path
			click_link("Add Books")

			expect(page.status_code).to eq(200)
			fill_in 'book[title]', with: "My Comedy Series", visible: false	
			fill_in 'book[author_name]', with: "George Posh"	    
		    click_on "Save"

		    expect(page).to have_content("My Comedy Series")
		end
	end			
end
