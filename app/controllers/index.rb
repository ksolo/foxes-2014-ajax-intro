#GET=========================================================
get '/contacts' do
  @contacts = Contact.all
  erb :index
end

get '/contacts/new' do
  # only render the layout if the request is
  # from the browser
  erb :new, layout: !request.xhr?
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
    # is this a ajax request
    if request.xhr?
      # only render the row that needs to be added to the table
      erb :_contact_row, layout: false, locals: {contact: @contact}
    else
      redirect to '/contacts'
    end
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