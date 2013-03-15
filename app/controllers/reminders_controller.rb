class RemindersController < ApplicationController

  before_filter :authenticate

  def index
    @reminders = Reminder.all
  end

  def new
    @reminder = Reminder.new
  end

  def edit
    @reminder = Reminder.find(params[:id])
  end

  def create
    @reminder = Reminder.new(params[:reminder])
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
