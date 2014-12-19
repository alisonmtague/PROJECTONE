require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sinatra/simple-authentication'
require 'rack-flash'
require 'pry'

require_relative './config/environments'

require_relative './models/user'
require_relative './models/artist'
require_relative './models/venue'

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
	@artists = Artist.all
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

get '/artist_form' do
	erb :artist_form
end

post '/artist_form' do
	@artist = params[:artist_name]
	Artist.create(name: @artist)
	redirect '/'
end

#changed this and artist_and_venues.erb and post_venue_form

get '/:artist_id/venues' do
  @artist_id = params[:artist_id]
  @artist = Artist.find(@artist_id)
	erb :artist_and_venues
end

# get '/comment_venue' do
# 	erb :post_venue_form
# end

post '/venue_form' do  ##changed from post_venue_form
	@venue = params[:venue_name]
	Venue.create(name: @venue, artist_id: params[:artist_id])
	redirect '/'
end

# get '/:artist_id/add_venue' do
# 	@artist_id = params[:artist_id]
# 	erb :artist_and_venues
# end


