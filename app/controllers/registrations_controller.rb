class RegistrationsController < Devise::RegistrationsController

	protected

	def update_resource(resource, params)
		resource.update_without_password(params)
	end

	private

	def sign_up_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end

	def account_update_params
		params.require(:user).permit(:first_name, :last_name, :email, :avatar, :password, :password_confirmation, :current_password)
	end
end
