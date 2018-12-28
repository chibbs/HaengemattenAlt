class ChangeHammockLongLat < ActiveRecord::Migration[5.2]
  def change
    change_table :hammocks do |t|
	  t.rename :lang, :longitude
	  t.rename :lat, :latitude
	end
  end
end
