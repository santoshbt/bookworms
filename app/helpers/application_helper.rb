module ApplicationHelper
	def user_is_admin?
		current_user.try(:type) == 'AdminUser' ? true : false
	end

	def readable_date create_date
		create_date.to_date.strftime("%m/%d/%Y")
	end

	def user_info(comment_created_at)		
		details = current_user.full_name + ' ' + readable_date(comment_created_at)
		content_tag(:p, content_tag(:span, details.html_safe))
	end

end
