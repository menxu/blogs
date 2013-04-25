class FrontpagesController < ApplicationController

  def index
    @hashs = Frontpage.roots

    @blogs = Blog.all
    @categorys = Category.all
  end

  def nihao
  end
  
  def show
    
  end

end
