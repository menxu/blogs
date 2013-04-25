class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  before_filter :set_locale
    
  def set_locale
    # 可以將 ["en", "zh-TW"] 設定為 VALID_LANG 放到 config/environment.rb 中
    if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
      session[:locale] = params[:locale]
    end

    I18n.locale = session[:locale] || I18n.default_locale
  end

  
  def get_admin
  	User.find(session[:current_user_id])	
  end

  protected

  	def current_user
  		session[:current_user_id] && User.find(session[:current_user_id])
  	end

  	def authenticate!
  		redirect_to '/auth' if !current_user 
  	end 
  	

  public 
  	def login_required(info=nil)
      current_user  
    end

end
