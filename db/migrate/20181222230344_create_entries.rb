class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :name
      t.text :description
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
	remove_reference :reviews, :hammock, index: true, foreign_key: true
	add_reference :reviews, :entry, index: true, foreign_key: true
  end
end
