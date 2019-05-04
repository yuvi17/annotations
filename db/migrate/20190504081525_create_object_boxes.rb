class CreateObjectBoxes < ActiveRecord::Migration[5.2]
  def change
    create_table :object_boxes do |t|
      t.integer :timestamp
      t.integer :xtl
      t.integer :ytl
      t.integer :xbr
      t.integer :ybr
      t.references :snippet, foreign_key: true

      t.timestamps
    end
  end
end
