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

	describe 'creation' do
		before do
  			visit new_genre_path
  		end

		it 'has a form that cannot be reached by normal user' do	
			user = FactoryGirl.create(:user)	
			login_as(user, scope: :user)	
			visit(new_genre_path)

			expect(current_path).to eq(genres_path)
		end  		

		it 'has a form that can be reached by adminuser' do	
			admin_user = FactoryGirl.create(:admin_user)	
			login_as(admin_user, scope: :user)	
			visit(new_genre_path)

			expect(page.status_code).to eq(200)
		end

		# it 'can be created from new form page' do			
		# 	fill_in 'genre[name]', with: "Comedy", visible: false	
		# 	fill_in 'genre[description]', with: "Includes books with good humour"	    
		#     click_on "Save"

		#     expect(page).to have_content("Comedy")
		# end
	end
end
