require_relative 'contact'
require 'sinatra'
require 'pry'


get '/' do
  @crm_app_name = "Hisayo's CRM"
  erb :index
end# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
get '/contacts' do
  erb :contacts
end

post '/contacts' do
  contact = Contact.create(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    note: params[:note]
  )
  redirect to ('contacts')
end

get '/contacts/:id' do
  @one_contact = Contact.find(params["id"].to_i)
 erb :one_contact
end

delete '/contacts/:id' do
  @one_contact = Contact.find(params["id"].to_i)
  @one_contact.delete
  erb :contacts
end

get '/contacts/:id/edit' do
  @one_contact = Contact.find(params["id"].to_i)
  erb :edit_contacts
end
# this doesnt' work!
patch '/contacts/:id' do
  @one_contact = Contact.find(params["id"].to_i)
  @one_contact.update_attributes(:first_name => params["first_name"],:last_name =>params["last_name"],
  :email => params["email"],:note =>params["note"])

  @one_contact.save

  # @one_contact.update("first_name", params["first_name"])
  # @one_contact.update("last_name", params["last_name"])
  # @one_contact.update("email", params["email"])
  # @one_contact.update("note", params["note"])
  #@one_contact.update(first_name, )
  erb :contacts
end

get '/new_contact' do
    erb :new_contact
end

get '/delete_contacts' do

  erb :delete_contacts
end




get '/edit_contacts' do
  erb :edit_contacts
end
