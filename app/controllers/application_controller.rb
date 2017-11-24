class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery prepend: true
  helper_method :is_admin?
  
  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    klass.new(object, view_context)
  end

  def is_admin?
  	if current_user.try(:type) == 'AdminUser'
  		true
  	else
  		begin
  			redirect_back(fallback_location: genres_path)
  			flash[:alert] = "Sorry, you do not have permission to access the page"
  		rescue ActionController::RedirectBackError
  			redirect_to root_path, alert: "Sorry, you do not have permission to access the page"
  		end	
  	end
  end

  def user_signed_in?
    current_user.blank? ? false : true
  end

end
