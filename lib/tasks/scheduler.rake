desc "This task is called by the Heroku scheduler add-on"

task :send_reminders => :environment do
  puts "Sending reminders..."
  ReminderMailer.send_open_reminders
  puts "Done"
end