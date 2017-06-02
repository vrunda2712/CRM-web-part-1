require 'sinatra'
require_relative 'contact'

get ('/') do
  erb :index
end

get '/home' do
  redirect to('/')
end

get ('/contacts') do
  @contacts = Contact.all
  erb :contacts
end

get '/contacts/:id' do
  # params[:id]
  # 1. Retrive the contacts
  @contact = Contact.find(params[:id].to_i)

  # 2. Render contact page
  if @contact
    erb :contact
  else
    raise Sinatra::NotFound
  end
end

get ('/about') do
  erb :about
end

after do
  ActiveRecord::Base.connection.close
end
