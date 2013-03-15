class Admin::HomeController < ApplicationController
	layout 'admin'
  before_filter :authenticate!, :only => [:show]
  def show
  end

  def sessions
  	@user = User.find_by_username(params[:username])
    if @user && @user.login(params[:password])
      session[:current_user_id] = @user.id
      flash[:notice] = "Success!"
      # redirect_to :action => :index
      # redirect_to '/home'
      # render :json => params
      redirect_to admin_blogs_path
    else  
      flash[:notice] = "Invalid userpassword combination"
      # render :action => :index
      redirect_to login_admin_home_path
    end
  end



  def login
    render :layout => 'login'
  end

end
