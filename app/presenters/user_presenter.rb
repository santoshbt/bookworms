class UserPesenter
	def initialize(user)
		@user = user
	end

	def is_admin?
		# current_user.try(:type) == 'AdminUser' ? true : false
		@user.try(:type) == 'AdminUser' ? true : false
	end
end