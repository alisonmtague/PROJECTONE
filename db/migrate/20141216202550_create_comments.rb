class CreateComments < ActiveRecord::Migration
  def change
  	create_table :comments do |c|
  		c.string :title, null: false
  		c.string :content
  		c.timestamps
  end
end
end