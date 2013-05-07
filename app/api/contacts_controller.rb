class Api::ContactsController < ApplicationController
    
  # GET /contacts
  def index
    @contacts = Contact.find_by_user_id(params[:user_id])
    render json: @contacts
  end
  
  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
    render json: @contact
  end

  # POST /contacts
  def create
    @contact = Contact.new(params[:contact])
    
    if @contact.save
      render json: @contact, :status => 200
    else
      render json: { :errors => @contact.errors.as_json }, :status => :unprocessible_entity
    end
  end

  # PUT /contacts/1
  def update
    @contact = Contact.find(params[:id])
    
    if @contact.update_attributes(params[:contact])
      render json: @contact, :status => 200
    else
      render json: { :errors => @contact.errors.as_json }, :status => :unprocessible_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    render json: :nothing, :status => 200

  end
end
