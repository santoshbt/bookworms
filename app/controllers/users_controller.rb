class UsersController < ApplicationController
	before_action :set_user, only: ['edit', 'show']

	def edit		
	end

	def show		
	end

	private

	def user_params
		params.permit(:first_name, :last_name)
	end

	def set_user
		@user = User.find params[:id]
	end
end
