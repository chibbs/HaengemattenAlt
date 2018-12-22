class RemoveStarsFromHammocks < ActiveRecord::Migration[5.2]
  def change
    remove_column :hammocks, :stars, :integer
  end
end
