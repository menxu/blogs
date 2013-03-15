class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @blogs = @category.blogs
    respond_to do |format|
    	format.html
    	format.json { render :json => @category }
    	format.json { render :json => @blogs }
    end
  end
end