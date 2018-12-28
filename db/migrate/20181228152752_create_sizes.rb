class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
      t.string :name
      t.text :text
      t.timestamps
    end
	create_table :sites_sizes, id: false do |t|
      t.belongs_to :site, index: true
      t.belongs_to :size, index: true
    end
  end
end
