class Api::UserSessionsController < ApplicationController

  # GET /user_sessions/new
  def new
    @title = "Login"
    @user_session = UserSession.new
  end

  # POST /user_sessions
  def create
    @title = "Login"
    @user_session = UserSession.new(params[:user_session])

    if @user_session.save
      redirect_to root_url, notice: 'Login successful.'
    else
      render action: "new"
    end

  end

  # DELETE /user_sessions
  def destroy
    current_user_session.destroy
    redirect_to root_url
  end
end