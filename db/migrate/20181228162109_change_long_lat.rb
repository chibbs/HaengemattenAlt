class ChangeLongLat < ActiveRecord::Migration[5.2]
  def change
    remove_column :sites, :latitude, :float
    remove_column :sites, :longitude, :float
	add_column :sites, :latitude, :decimal, precision: 15, scale: 13
    add_column :sites, :longitude, :decimal, precision: 15, scale: 13
  end
end
