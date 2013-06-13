class FrontpagesController < ApplicationController
  layout 'html5test'

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
