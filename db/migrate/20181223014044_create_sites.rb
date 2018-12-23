class CreateSites < ActiveRecord::Migration[5.2]
  def change
	create_table :sites do |t|
      t.string :name
      t.text :description
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
	add_reference :reviews, :site, index: true, foreign_key: true
  end
end
