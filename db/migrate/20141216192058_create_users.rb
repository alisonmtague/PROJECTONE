class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |u|
  		u.string :email, null: false
  		u.string :hashed_password
    	u.string :salt

  	end
  	add_index :users, :email, :unique => true
  end
end
