class RemindersController < ApplicationController

  before_filter :authenticate

  def index
    if current_user_session.user.role == "Admin"
      @reminders = Reminder.all
    else
      @reminders = Reminder.find_by_user_id(current_user_session.user.id, "Open")
    end
  end

  def new
    @reminder = Reminder.new
  end

  def edit
    @reminder = Reminder.find(params[:id])
  end

  def create
    @reminder = Reminder.new(params[:reminder])
    @reminder.end = DateTime.strptime(params[:reminder][:end], "%Y-%m-%d %H:%M %Z").in_time_zone
    @reminder.start =  DateTime.strptime(params[:reminder][:start], "%Y-%m-%d %H:%M %Z").in_time_zone
    @reminder.user_id = current_user_session.user.id

    if @reminder.save
      redirect_to reminders_url, notice: 'Reminder was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @reminder = Reminder.find(params[:id])

    if @reminder.update_attributes(params[:reminder])
      redirect_to reminders_url, notice: 'Reminder was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @reminder = Reminder.find(params[:id])
    @reminder.destroy

    redirect_to reminders_url

  end
end
