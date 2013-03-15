# encoding: utf-8
class Auth::LoginsController < ApplicationController
  layout 'login'
  before_filter :authenticate!, :only => [:show]

  def index
    @nihao = 'nihao '
    1.upto(10){|x| p "a  #{x}"}
    @xhr="错误 2 大于 3"
    p '----------------------------'
    p params[:password]
    p '----------------------------'
    
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.login(params[:password])
      session[:current_user_id] = @user.id
      render :json => {:redirect_to => admin_blogs_path}, :status => 200
    else    
      # flash[:notice] = "Invalid userpassword combination"
      # render :action => :index
      # redirect_to login_admin_home_path
      render :text => '亲 登陆名称/密码有误，请重新填写', :status => 403
    end
    
  end

  # 登出
  def destroy   
    p '============== destroy'
    if login_required
      session[:current_user_id] = nil
    end
    
    return redirect_to "/auth"
  end

  def show

  end

end