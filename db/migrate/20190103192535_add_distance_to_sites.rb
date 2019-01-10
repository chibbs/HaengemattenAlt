class AddDistanceToSites < ActiveRecord::Migration[5.2]
  def change
    add_column :sites, :distance, :float
  end
end
