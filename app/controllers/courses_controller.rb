class CoursesController < ApplicationController
  layout "html5test"
  def new
    @course = Course.new
  end
  def index
  end
end