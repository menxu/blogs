class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :id
      t.references :blog
      t.text :content
      t.references :user
      
      t.timestamps
    end
    add_index :comments, :blog_id
    add_index :comments, :user_id
  end
end
