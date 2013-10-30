class FileUploader < ActiveRecord::Base
  attr_accessible :title, :desc, :file_entity_id
end