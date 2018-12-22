class AddStarsToHammock < ActiveRecord::Migration[5.2]
  def change
    add_column :hammocks, :stars, :integer
  end
end
