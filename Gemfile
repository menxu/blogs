source 'http://ruby.taobao.org'
ruby '2.0.0'
gem 'rails', '3.2.9'
gem 'haml-rails'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'

gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3' #当我们使用 asset pipeline时， 资源的路径必须重写而且 sass-rails 为下列类别提供了 -url 和 -path helpers(在 Sass 中使用连字符，在 Ruby 中使用下划线) : image, font, video, audio, JavaScript 和 stylesheet.  image-url(“rails.png”) 变成 url(/assets/rails.png)
  gem 'coffee-rails', '~> 3.2.1' 

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  ##gem 'rails_kindeditor', '~> 0.3.11'
end

group :test do
  gem 'rspec-rails', '2.13.0'
  gem 'factory_girl_rails', '~> 4.2.1'
  gem 'coveralls', :require => false # 帮助在 coveralls.io 线统计测试覆盖率
end

gem 'jquery-rails'
gem "jquery_mobile_rails", "~> 1.3.0"

# 文件上传（fushang318增加） 
gem "carrierwave", "0.8.0"
# carrierwave 用到的图片切割
gem "mini_magick", "3.5.0", :require => false


# weibo omniauth-weibo-oauth2
gem "weibo2", "~> 0.1.0"
gem "omniauth-weibo-oauth2", "~> 0.3.0"

group :doc do
  gem 'sdoc', '0.3.20', require:false #在 doc/api 目录下面会生成HTML版本的Rails Doc
end

# group :development do
#   gem 'sqlite3', '1.3.7'
# end

group :production do
  gem 'pg', '0.15.1'
end

# 数据查询
gem 'pacecar', '1.5.3' # 给模型添加实用的scope
gem 'kaminari', '0.14.1' # 分页支持

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# gem 'ya2yaml'
