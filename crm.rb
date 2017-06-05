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

get '/contacts/new' do
  erb :new_contact
end

# Create new contact
post '/contacts'  do
  # puts params
  Contact.create(
   {first_name:  params[:first_name],
     last_name:  params[:last_name],
     email:      params[:email],
     note:       params[:note]
   })
   redirect to('/contacts')
end

# Find contact by ID
# get '/contacts/:id' do
#   @contact = Contact.find(params[:id].to_i)
#   if @contact
#     erb :contact
#   else
#     raise Sinatra::NotFound
#   end
# end

# Edit Contact
get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
  erb :edit_contact
end

# Find contact by ID to edit
put '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.update(
     {first_name:  params[:first_name],
       last_name:  params[:last_name],
       email:      params[:email],
       note:       params[:note]
     })
     redirect to('/contacts')
   else
     raise Sinatra::NotFound
  end
end

# Delete Contact
get '/contacts/:id/delete' do
  @contact = Contact.find(params[:id].to_i)
  @contact.delete

  redirect to('/contacts')
end

# Find contact by ID to delete
delete '/contacts/:id' do
  @contact = Contact.find(params[:id].to.i)
  @contact.delete

  redirect to('/contacts')
end

get '/about' do
  erb :about
end

after do
  ActiveRecord::Base.connection.close
end
