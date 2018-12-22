class AddHammockIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :hammock_id, :integer
  end
end
