class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |u|
  		u.string :email, null: false
  		# u.string :password_digest, null: false
  		t.string :hashed_password
    	t.string :salt

  	end
  	add_index :users, :email, :unique => true
  end
end
