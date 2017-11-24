module Registrable
	extend ActiveSupport::Concern

	included do
		def full_name
	      first_name + " " + last_name rescue "Guest user"
	    end

	    def admin?
	    	return true if self.try(:type) == "AdminUser"
	    	return false
	    end
	end

	module ClassMethods
		def from_omniauth(auth)
			data = auth.info
			user = User.where(:email => data["email"]).first

			unless user
				password = Devise.friendly_token[0,20]
				user = User.create(name: data["name"], email: data["email"],
					password: password, password_confirmation: password
					)
			end
			user
		end
	end
end