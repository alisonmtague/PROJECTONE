class CreateVenues < ActiveRecord::Migration
  def change
  	create_table :venues do |t|
  		t.string :name, null: false
  		t.integer :artist_id
  		t.timestamps
  end
end
end