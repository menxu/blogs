class Admin::BlogsController < ApplicationController
  layout 'admin'
  before_filter :authenticate!
  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.all
    # json = @blogs.map{|blog| blog.to_hash}
    # p json
    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render :json => @blogs }
    # end
    # render :json => {
    #   :blog_lists => Blog.all.map{|blog| blog.to_hash}
    # }
    # render(:json => @blogs.map{|blog| blog.to_hash})
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @blog = Blog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @blog }
    end
  end

  # GET /blogs/new
  # GET /blogs/new.json
  def new
    @blog = Blog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @blog }
    end
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(params[:blog])
    @blog.user_id = get_admin.id
    respond_to do |format|
      if @blog.save
        format.html { redirect_to [:admin , @blog], :notice => 'Blog was successfully created.' }
        format.json { render :json => @blog, :status => :created, :location => @blog }
      else
        format.html { render :action => "new" }
        format.json { render :json => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /blogs/1
  # PUT /blogs/1.json
  def update
    @blog = Blog.find(params[:id])
    @blog.user_id = get_admin.id
    if @blog.update_attributes params[:blog]
      return redirect_to "/admin/blogs/#{@blog.id}"
    end
    # error = @student.errors.first
    # flash[:error] = error[1]
    redirect_to "/admin/blogs/#{@blog.id}/edit"
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to admin_blogs_url }
      format.json { head :no_content }
    end
  end
end
