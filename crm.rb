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
  # 1. Retrive the recipes
  @contact = Contact.find(params[:id])

  # 2. Render recipe page
  erb :contact
end

get ('/about') do
  erb :about
end

after do
  ActiveRecord::Base.connection.close
end
