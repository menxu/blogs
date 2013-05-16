class Api::CategoryListsController < ApplicationController
  before_filter :login_required

  def pull
    render(:json => Category.all.as_json )
  end
end