require 'sinatra'
require_relative '../lib/player.rb'

class RPS < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/submit-users' do
    session[:player_one] = Player.new(params[:username])
    redirect('/game')
  end

  get '/game' do
    @player_one = session[:player_one]
    erb(:game)
  end

  post '/move' do
    session[:move] = params[:move]
    redirect('/move')
  end

  get '/move' do
    @move = session[:move]
    erb(:move)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end