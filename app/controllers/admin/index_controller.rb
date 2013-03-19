class Admin::IndexController < ApplicationController
  layout 'admin'
  before_filter :authenticate!, :only => [:show]
  def show
  end

  def index
  end

  def new
  end
end
