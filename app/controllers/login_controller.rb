class LoginController < ApplicationController
  def create #TODO: encrypt password	
  end
  
  def new #log
	user = Admin.where(:name => params[:name]).first #authentification start!
	if user && user[:password] == params[:password] #logged!
		session[:is_logged] = true
		respond_to do |format|      
			format.html { redirect_to login_path, :notice => 'logged' } 
		end		
	else #fault
		respond_to do |format|      
			format.html { redirect_to login_path, :notice => 'authentification fault' } 
		end
	end
	#@user = params[:name]+params[:password]
	#session[:user_id] = @user	           
  end
  
  def delete #delog
	session[:is_logged] = nil
	respond_to do |format|      
		format.html { redirect_to login_path, :notice => 'logged out' } 
	end
  end
end
