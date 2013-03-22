class User < ActiveRecord::Base
  attr_accessible :id, :password, :username, :avatar
  has_many :comments
  has_many :blogs

  # carrierwave
  mount_uploader :avatar, AvatarUploader

  def login(password)
  	self.password == password
  end
end
