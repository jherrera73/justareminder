class Api::RemindersController < ApplicationController

  def index
    @reminders = Reminder.find_by_user_id(params[:user_id])
    render :json => @reminders
  end
  
  def edit
    @reminder = Reminder.find(params[:id])
    render json: @reminder
  end

  def create
    @reminder = Reminder.new(params[:reminder])
    endDateTime = params[:reminder][:end] + " " + Time.zone.now.strftime("%Z")
    startDateTime = params[:reminder][:start] + " " + Time.zone.now.strftime("%Z")
    @reminder.end = Time.strptime(endDateTime, '%m/%d/%Y %H:%M %Z').utc
    @reminder.start =  Time.strptime(startDateTime, '%m/%d/%Y %H:%M %Z').utc
    @reminder.user_id = current_user_session.user.id

    if @reminder.save
      render json: @reminder, :status => 200
    else
      render json: { :errors => @reminder.errors.as_json }, :status => :unprocessible_entity
    end
  end

  def update
    @reminder = Reminder.find(params[:id])
    endDateTime = params[:reminder][:end] + " " + Time.zone.now.strftime("%Z")
    startDateTime = params[:reminder][:start] + " " + Time.zone.now.strftime("%Z")
    params[:reminder][:end] = Time.strptime(endDateTime, '%m/%d/%Y %H:%M %Z').utc
    params[:reminder][:start] =  Time.strptime(startDateTime, '%m/%d/%Y %H:%M %Z').utc
    
    if @reminder.update_attributes(params[:contact])
      render json: @reminder, :status => 200
    else
      render json: { :errors => @reminder.errors.as_json }, :status => :unprocessible_entity
    end
  end

  def destroy
    @reminder = Reminder.find(params[:id])
    @reminder.destroy

    render json: :nothing, :status => 200

  end
end
