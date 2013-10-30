class CreateFileUploaders < ActiveRecord::Migration
  def change
    create_table :file_uploaders do |t|
      t.string  :title
      t.string  :desc
      t.integer :file_entity_id
      t.timestamps
    end
  end
end
