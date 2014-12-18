class CreateComments < ActiveRecord::Migration
  def change
  	create_table :comments do |c|
  		c.string :title, null: false
  		c.integer :post_id
  		c.timestamps
  end
end
end