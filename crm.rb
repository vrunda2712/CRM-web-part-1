require 'sinatra'
require_relative 'contact'

get '/' do
  erb :index
end

get '/home' do
  redirect to('/')
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :contact
  else
    raise Sinatra::NotFound
  end
end

get '/new' do
  erb :new
end

get '/about' do
  erb :about
end

after do
  ActiveRecord::Base.connection.close
end
