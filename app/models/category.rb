class Category < ActiveRecord::Base
  attr_accessible :id, :level, :name
  has_many :blogs, :dependent => :nullify

  def self.search(query)
    if query.blank?
      scoped
    else
      q = "%#{query}%"
      where("name like ?",q)
    end
  end
end


