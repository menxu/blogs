class User < ActiveRecord::Base
  attr_accessible :id, :password, :username
  has_many :comments
  has_many :blogs

  def login(password)
  	self.password == password
  end
end
