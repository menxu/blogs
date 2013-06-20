# encoding: utf-8
class AdminsController < ApplicationController

  def login
    print '用户登陆'
    username = params[:username]
    password = params[:password]

    print '参数：'
    print username
    print password
    print '用户登陆'
    user = User.find_by_username(username)
    p '-------------------------------------'
    print user.password
    p '-------------------------------------'
    if user then
      if user.password == password then

        session[:current_user_id] = user.id

        render :json => {
          :id => user.id,
          :username => user.username,
          :sign => "个人详细资料",
          :avatar_url => user.avatar
        }
      else
        render :text => "登陆密码不正确" ,:status => "401"
      end
      
    else
      render :text => "不存在此用户名"  ,:status => "402"
    end   
  end

end

 # http://localhost:3000 refused
# org.apache.http.conn.HttpHostConnectException: Connection to http://localhost:3000 refused
# render :json => {
#             :user => {
#               :id => self.id,
#               :username => self.username,
#               :sign => "个人详细资料",
#               :avatar_url => "用户头像地址"
#             }
#             # :user => user.as_json
#             # ，
#     

