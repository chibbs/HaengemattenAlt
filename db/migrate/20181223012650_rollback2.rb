class Rollback2 < ActiveRecord::Migration[5.2]
  def change
	remove_reference :reviews, :site, index: true, foreign_key: true
	drop_table :sites do |t|
      t.string :name
      t.text :description
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
	
	create_table :hammocks do |t|
      t.string :name
      t.text :description
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
	add_reference :reviews, :hammock, index: true, foreign_key: true
  end
end
