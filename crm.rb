require 'sinatra'
require_relative 'contact'

get ('/') do
  erb :index
end

after do
  ActiveRecord::Base.connection.close
end
