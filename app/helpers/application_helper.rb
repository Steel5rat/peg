module ApplicationHelper
	def logged?
		session[:is_logged]
	end
end
