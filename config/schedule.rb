# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

every 1.day, :at => '6:30 am' do #send reminders to user that have open reminders.
  runner RemainderMailer.send_open_reminders
end

every :hour do #close reminders every hour that have end dates prior to todays date.
  runner Reminder.close_reminders
end

# Learn more: http://github.com/javan/whenever
