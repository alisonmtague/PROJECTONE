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

binding.pry 

enable :sessions

Sinatra::SimpleAuthentication.configure do |c|
  c.use_password_confirmation = true
end

use Rack::Flash, :sweep => true

register Sinatra::SimpleAuthentication


get '/' do
  login_required
	erb :index
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


