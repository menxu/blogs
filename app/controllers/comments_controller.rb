class CommentsController < ApplicationController 
  def show
    @comment = Blog.find(params[:id])
    @comment = @blog.comments.build
    respond_to do |format|
        format.html
        format.json { render :json => @blog }
    end
  end

  def new
    @comment = Comment.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @comment }
    end
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user = get_admin
    @comment.blog = Blog.find(params[:blog_id])
    respond_to do |format|
      if @comment.save
        # redirect_to :back
        format.html { redirect_to @comment.blog, :notice => 'Comment was successfully created.' }
        format.json { render :json => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.json { render :json => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end
end

# 12-14 13:04:36.522: INFO/System.out(18082): dataList_server -1 : 1 : 新入手Nexus4该装些啥软件？ : COLLECTION : true : false : 400 : 1354785749 : 1354785895 :  -1 :  false : false
# 12-14 13:09:08.412: INFO/System.out(18570): item ： -1 : 1 : 新入手Nexus4该装些啥软件？ : COLLECTION : true : false : 400 : 1354785749 : 1354785895 :  -1 :  false : false
