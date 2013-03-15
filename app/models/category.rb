class Category < ActiveRecord::Base
  attr_accessible :id, :level, :name
  has_many :blogs, :dependent => :nullify
end
