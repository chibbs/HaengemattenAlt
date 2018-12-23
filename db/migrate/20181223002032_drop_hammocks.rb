class DropHammocks < ActiveRecord::Migration[5.2]
  def change
    drop_table :hammocks do |t|
      t.string :name
      t.text :description
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
