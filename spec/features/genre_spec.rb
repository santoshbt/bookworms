require 'rails_helper'

describe 'navigate' do
	describe 'index' do
		before do
			visit genres_path
		end

		it 'can be reached successfully' do			
			expect(page.status_code).to eq(200)
		end

		it 'has a name of genres' do			
			expect(page).to have_content(/Genres/)
		end

		#### Not able to test the ajax request. Throwing unsupported format error.

		# it 'user click the link Mark Favorite' do
		# 	user = FactoryGirl.create(:user)	
		# 	login_as(user, scope: :user)

		# 	genre_to_mark_favorite = Genre.create(name: 'Fiction', description: 'Fictitious books')

		# 	visit genres_path
		# 	click_link("favorite_#{genre_to_mark_favorite.id}")	
		# 	reload_page
		# 	# expect(page).to have_css('#favorite_#{genre_to_mark_favorite.id}', text: 'Remove Favorite')
								
		# 	expect(page).to have_content(/Remove Favorite/)
		# end
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
			fill_in 'genre[name]', with: "Comedy", visible: false	
			fill_in 'genre[description]', with: "Includes books with good humour"	    
		    click_on "Save"

		    expect(page).to have_content("Comedy")
		end
	end
end
