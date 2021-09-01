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
begin
  date = (params[:birthday])
  date.is_a?(DateTime) 
  @name = params[:name]
  @name = params[:birthday]

  connection = PG.connect(dbname: 'birthdayapp')
  connection.exec("INSERT INTO birthday_table (name, birthday) VALUES ('#{@name}, #{@birthday}')" )
  

  session[:birthday_card] = BirthdayCard.new(params[:birthday], params[:name])
    if session[:birthday_card].today?
      redirect '/greetings'
    else
      redirect '/future'
    end
rescue ArgumentError
  flash[:notice] = '**!!PLEASE ENTER YOUR BIRTHDAY IN THE CORRECT FORMAT!!**'
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