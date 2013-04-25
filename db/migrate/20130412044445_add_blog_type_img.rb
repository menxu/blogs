class AddBlogTypeImg < ActiveRecord::Migration
  def change
    add_column :blogs, :context_type, :string, :default => 'ContentTypeText'

    add_column :blogs, :image_url, :string
  end
  
end
