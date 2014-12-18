require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sinatra/simple-authentication'
require 'rack-flash'
require 'pry'

require_relative './config/environments'

require_relative './models/user'
require_relative './models/post'
require_relative './models/comment'

#binding.pry 

enable :sessions

Sinatra::SimpleAuthentication.configure do |c|
  c.use_password_confirmation = true
end

use Rack::Flash, :sweep => true

register Sinatra::SimpleAuthentication


get '/' do
  login_required
  #redirect '/artist_list'
	#erb :index
	redirect '/artist_list'
end 

get '/artist_list' do
	@posts = Post.all
	erb :artist_list
end


get '/login' do
	erb :login
end

get '/signup' do
	erb :signup
end

# get "/logout" do
#   session.clear
#   redirect '/'
# end

get '/post_artist' do
	erb :post_artist_form
end

post '/post_artist_form' do
	@post = params[:artist_name]
	Post.create(artist_name: @post)
	redirect '/'
end

#changed this and artist_and_venues.erb and post_venue_form

get '/:post_id/comments' do
  @post_id = params[:post_id]
  @post = Post.find(@post_id)
	@comments = Comment.where(post_id: params[:post_id])
	erb :artist_and_venues
end

# get '/comment_venue' do
# 	erb :post_venue_form
# end

post '/post_venue_form' do
	@post = params[:artist_name]
	Post.create(artist_name: @post)
	redirect '/'
end