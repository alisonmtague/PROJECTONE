class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |u|
  		u.string :email, null: false
  		u.string :password_digest, null: false
  	end
  end
end
