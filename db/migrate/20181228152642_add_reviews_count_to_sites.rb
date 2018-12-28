class AddReviewsCountToSites < ActiveRecord::Migration[5.2]
  def change
    add_column :sites, :reviews_count, :integer
  end
end
