class CreateSnippets < ActiveRecord::Migration[5.2]
  def change
    create_table :snippets do |t|
      t.string :video_id
      t.string :class_name
      t.integer :object_id
      t.integer :start_time
      t.integer :end_time

      t.timestamps
    end
  end
end
