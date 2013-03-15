class Blog < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  attr_accessible :category_id, :content, :id, :title , :user_id
  # has_many :comments, :dependent => :destory
  has_many :comments, :dependent => :destroy
end

# 1990
# 2013