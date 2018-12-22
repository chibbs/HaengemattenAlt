class ChangeHammockIdToForeignKey < ActiveRecord::Migration[5.2]
  def change
	remove_column :reviews, :hammock_id, :integer
    add_reference :reviews, :hammock, foreign_key: true
  end
end
