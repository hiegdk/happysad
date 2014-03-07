# happysad.rb
require 'rubygems'
require 'sinatra'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => "localhost",
  :username => "happysad",
  :password => "happysad",
  :database => "happysad"
)

class Responses < ActiveRecord::Base
end

class App < Sinatra::Application
end


get '/' do
  responses = Responses.last(128)
  @output = ""
  responses.each do |response|
    @output << "<img src='/img/#{response.value}.png' border='0' height='64' width='64' />"
  end

  erb :show
end

get '/r/:ticket_number/:value' do
	#make sure we have valid values
	if params[:value] == "happy" || params[:value] == "sad"
		@r = Responses.create(:ticket_number => params[:ticket_number], :value => params[:value]) 
	redirect "/thanks/#{@r.id.to_s}/#{params[:value]}"
	else
		not_found
	end
end

get '/thanks/:id/:value' do
	@id = params[:id]
	@v = params[:value]
	erb :thanks
end

post '/comment' do
	Responses.update(params[:id], {:comment => params[:comment]})

	erb :thanks_comment
end

get '/about' do
	erb :about
end

not_found do
  erb :'404'
end