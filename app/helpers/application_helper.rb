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
		items = [link_to_user_profile,  readable_date(comment_created_at)]
		contents = items.map {|item| content_tag(:p, item)}    		
		content_tag(:span, contents.join("\n").html_safe)
	end

	def active(path)
		return "active" if current_page?(path)
	end

	def present(object, klass = nil)
	    klass ||= "#{object.class}Presenter".constantize
	    presenter = klass.new(object, self)
	    yield presenter if block_given?
	    presenter
 	end

end
