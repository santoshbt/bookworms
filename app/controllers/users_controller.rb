class UsersController < ApplicationController
	before_action :set_user, only: ['edit', 'show']

	def edit		
	end

	def show		
	end

	def download_report	
		download_book_report = Report.new(current_user, 'book').download
		if download_book_report.result == 'success'
			books = download_book_report.books
			p download_book_report.books
			send_data books.to_csv
		else
			render plain: "Download fail"
		end	
	end

	private

	def user_params
		params.permit(:first_name, :last_name)
	end

	def set_user
		@user = User.find params[:id]
	end
end
