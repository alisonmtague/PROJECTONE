class CreatePosts < ActiveRecord::Migration
  def change
  	create_table :posts do |p|
  		p.string :post, null: false
  		p.timestamps
  end
end
end