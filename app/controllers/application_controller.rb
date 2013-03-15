class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user


def get_admin
	User.find(session[:current_user_id])	
end

protected

	def current_user
		session[:current_user_id] && User.find(session[:current_user_id])
	end

	def authenticate!
		redirect_to '/home/login' if !current_user 
	end 
	

public 
	def login_required(info=nil)
    current_user  
  end

end
