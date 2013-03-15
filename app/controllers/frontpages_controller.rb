class FrontpagesController < ApplicationController

  def index
    @blogs = Blog.all
    @categorys = Category.all
  end

  def nihao
  end
  
  def show
    
  end

end
