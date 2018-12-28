class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment
	  
	  t.timestamps
      t.references :hammock, foreign_key: true
    end
  end
end
