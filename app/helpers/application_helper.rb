module ApplicationHelper
	def user_is_admin?
		current_user.try(:type) == 'AdminUser' ? true : false
	end
end
