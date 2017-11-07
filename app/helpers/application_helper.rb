module ApplicationHelper
	def user_is_admin?
		current_user.try(:type) == 'AdminUser' ? true : false
	end

	def readable_date create_date
		create_date.to_date.strftime("%m/%d/%Y")
	end

	def user_info(comment_created_at, user)
		unless user.blank?	
			link_to_user_profile = link_to(user.full_name, user_path(id: user.id))	
		else
			link_to_user_profile = "Guest User"
		end	
		details = link_to_user_profile + ' ' + readable_date(comment_created_at)
		content_tag(:p, content_tag(:span, details.html_safe))
	end

end
