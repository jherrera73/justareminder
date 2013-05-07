class Api::UsersController < ApplicationController

  def index
    @users = User.all 
    render json: @users
  end

  def edit
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(params[:user])
    
    if @user.save
      UserMailer.register_confirmation(@user).deliver 
      render json: @user, :status => 200
    else
      render json: { :errors => @user.errors.as_json }, :status => :unprocessible_entity
    end

  end

  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      render json: @user, :status => 200
    else
      render json: { :errors => @user.errors.as_json }, :status => :unprocessible_entity
    end
  end

end
