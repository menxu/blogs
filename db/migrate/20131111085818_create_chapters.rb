class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :name
      t.text :desc
      t.integer :course_id

      t.timestamps
    end
  end
end
