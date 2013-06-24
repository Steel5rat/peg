module ApplicationHelper
	def logged?
		session[:is_logged]
	end
	
	def unloggedRedirect
		respond_to do |format|      
			format.html { redirect_to login_path, :notice => 'need to authentificate' } 
		end
	end
end
