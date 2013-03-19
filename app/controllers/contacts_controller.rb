class ContactsController < ApplicationController
  
  before_filter :authenticate
  
  # GET /contacts
  # GET /contacts.json
  def index
    if current_user_session.user.role == "Admin"
      @contacts = Contact.all
    else
      @contacts = Contact.find_by_user_id(current_user_session.user.id)
    end
    
  end

  # GET /contacts/new
  # GET /contacts/new.json
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(params[:contact])
    @contact.user_id = current_user_session.user.id
    
    if @contact.save
      redirect_to contacts_url, notice: 'Contact was successfully created.' 
    else
      render action: "new"
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.json
  def update
    @contact = Contact.find(params[:id])
    
    if @contact.update_attributes(params[:contact])
      redirect_to contacts_url, notice: 'Contact was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    redirect_to contacts_url

  end
end
