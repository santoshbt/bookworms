class UserPolicy < ApplicationPolicy

	def admin?
	    return true if current_user.try(:type) == 'AdminUser'
	    return false
  	end

	def download_report?
		current_user.admin? 
	end
end