# ./app.rb

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/user'

class BirthdayGreeter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end


  enable :sessions

  # our routes would go here
  get '/' do
    erb(:index)
  end

  post '/info' do
    $user = User.new(params[:name], params[:month], params[:day])
    redirect '/message'
  end

  get '/message' do
    $user.generate_message
    @user = $user
    erb(:message)
  end

  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end
