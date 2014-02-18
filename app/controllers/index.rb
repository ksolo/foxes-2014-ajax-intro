#GET=========================================================
get '/contacts' do
  @contacts = Contact.all
  erb :index
end

get '/contacts/new' do
  erb :new
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :show
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])
end

#POST=======================================================

post '/contacts' do
  @contact = Contact.new(params[:contact])
  if @contact.save
    redirect to '/contacts'
  else
    erb :new
  end
end

post '/contacts/:id' do
  @contact = Contact.find(params[:id])
  if @contact.update_attributes(params[:contact])
    redirect to '/contacts'
  else
    erb :edit
  end
end

post '/contacts/:id/delete' do
  @contact = Contact.find(params[:id])
  @contact.destroy
  redirect to '/contacts'
end