class Coruse < Activity::Base
  attr_accessible :name, :cid, :desc

  validtes :name, :presence => true

  has_many :chapters
  accepts_nested_attributes_for :chapters, 
                                :reject_if => lambda{ |a| a[:name].blank?}, 
                                :allow_destroy => true
  
  
end