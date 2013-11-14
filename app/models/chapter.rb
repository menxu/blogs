class Chapter < ActiveRecord::Base
  attr_accessible :name, :dese, :course
  
  belongs_to :course
  validates :name, :presence => true
end