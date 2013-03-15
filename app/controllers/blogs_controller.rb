class BlogsController < ApplicationController
	def show
		@blog = Blog.find(params[:id])
		@comment = @blog.comments.build
		respond_to do |format|
    		format.html
	    	format.json { render :json => @blog }
	  end
	end
end