class CreateHammocks < ActiveRecord::Migration[5.2]
  def change
    create_table :hammocks do |t|
      t.string :name
      t.text :description
      t.float :lang
      t.float :lat

      t.timestamps
    end
  end
end
