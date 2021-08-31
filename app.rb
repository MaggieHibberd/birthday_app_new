require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/birthday_card'

class Birthday < Sinatra::Base
  configure :development do
    register Sinatra::Flash
  end

enable :sessions

get '/' do 
  erb :index
end

post '/greetings' do 
if Date.parse(params[:birthday]).instance_of?(Date)
  @name = params[:name]
  session[:birthday_card] = BirthdayCard.new(params[:birthday], params[:name])
  if session[:birthday_card].confirmation?
    redirect '/greetings'
  else
    redirect '/future'
  end
else
  flash[:notice] = 'Put your birthday in the correct format!'
  redirect '/'
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