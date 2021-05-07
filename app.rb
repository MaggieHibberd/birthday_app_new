require 'sinatra/base'
require 'sinatra/reloader'

class Birthday < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

enable :sessions

get '/' do 
  erb :index
end

post '/greetings' do 
  @name = params[:name]
  erb :greetings
end

end