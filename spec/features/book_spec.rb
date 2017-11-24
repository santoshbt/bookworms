require 'rails_helper'

describe 'navigate' do
	describe 'create' do		
		it 'Admin can create book successfully' do						
			admin_user = FactoryBot.create(:admin_user)	
			login_as(admin_user, scope: :user)
			genre = FactoryBot.create(:genre)
			visit genres_path
			click_link("Add Books")

			expect(page.status_code).to eq(200)
			fill_in 'book[title]', with: "My Comedy Series", visible: false	
			fill_in 'book[author_name]', with: "George Posh"	    
		    click_on "Save"

		    expect(page).to have_content("My Comedy Series")
		end
	end

	# describe 'index' do
	# 	it 'user can reach the list of books' do
	# 		user = FactoryBot.create(:user)
	# 		login_as(user)
	# 		genre = FactoryBot.create(:genre)
	# 		visit genres_path

	# 		click_link("Comedy")
	# 		expect(page.status_code).to eq(200)
	# 		expect(page).to have_content("Comedy")

	# 		click_link("View Books")
	# 		book = FactoryBot.create(:book)
			
	# 		expect(page.status_code).to eq(200)
	# 		expect(page).to have_content("My Comedy Series")
	# 	end
	# end
end
				

