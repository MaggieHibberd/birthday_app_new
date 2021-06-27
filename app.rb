require 'sinatra/base'
require 'sinatra/reloader'
require './lib/birthday_card'

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
  session[:birthday_card] = BirthdayCard.new(params[:birthday], params[:name])
  if session[:birthday_card].confirmation?
     redirect '/greetings'
  else
    redirect '/future'
  end 
end

get '/greetings' do 
  @birthday_card = session[:birthday_card]
  erb :greetings
end


get '/future' do 
  @birthday_card = session[:birthday_card]
  erb :future
end

end