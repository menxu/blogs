class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.integer :id
      t.references :user
      t.string :title
      t.text :content
      t.integer :category_id

      t.timestamps
    end
    add_index :blogs, :user_id
  end
end
