class FileUploadersController < ApplicationController
  def new
    @file_uploader = FileUploader.new
    render :text => User.page(1).to_json
  end
end