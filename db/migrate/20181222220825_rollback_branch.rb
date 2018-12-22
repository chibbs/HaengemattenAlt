class RollbackBranch < ActiveRecord::Migration[5.2]
  def change
    remove_reference :reviews, :hammock, foreign_key: true
	drop_table :reviews do |t|
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end