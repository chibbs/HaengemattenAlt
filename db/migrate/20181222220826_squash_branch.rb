class SquashBranch < ActiveRecord::Migration[5.2]
  def change
	create_table :reviews do |t|
      t.integer :rating
      t.text :comment

      t.timestamps
    end
    add_reference :reviews, :hammock, index: true, foreign_key: true
  end
end
