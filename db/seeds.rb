require "sinatra"
require "sinatra/activerecord"
require "active_record"
require 'sinatra/simple-authentication'
require_relative "../config/environments"
require_relative "../models/comment"
require_relative "../models/post"
require_relative "../models/user"


Post.create([
 
  { :post => "Classixx"},
  { :post => "Matthew Dear"},
  { :post => "Ben Pearce"},
])

# Task.create([
 
#   { :title => "2 dozen large eggs", :description => "", :list_id => 1, :user_id => 1},
#   { :title => "Paper towels", :description => "", :list_id => 1, :user_id => 1},
#   { :title => "Wheat Bread", :description => "", :list_id => 1, :user_id => 1},
#   { :title => "Steak & cheese", :description => "Get steak & cheese at the Snack N Stand", :list_id => 1, :user_id => 1},
# ])