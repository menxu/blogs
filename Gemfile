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
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'rails_kindeditor', '~> 0.3.11'
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
  gem 'sdoc', '0.3.20', require:false
end

# group :development do
#   gem 'sqlite3', '1.3.7'
# end

group :production do
  gem 'pg', '0.15.1'
end

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


# 1.group :production do
#   gem 'pg', '0.15.1'
# end
# 2.ruby '2.0.0'
# 3.$ bundle install --without production
# 4.$ git commit -a -m "Update Gemfile.lock for Heroku"
# 5.$ heroku login
# 6.$ heroku create
# 7.$ git push heroku master
# 8.$ heroku open
# 9.$ heroku rename railstutorial
# ('a'..'z').to_a.shuffle[0..7].join
# 10.$ gem install mysql2psql


# blog2(master): heroku create
# Creating obscure-brook-5235... done, stack is cedar
# http://obscure-brook-5235.herokuapp.com/ | git@heroku.com:obscure-brook-5235.git
# Git remote heroku added
