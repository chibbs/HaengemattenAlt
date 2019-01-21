class AddMeanratingToSites < ActiveRecord::Migration[5.2]
  def change
    add_column :sites, :meanrating, :int, default: 0
  end
end
