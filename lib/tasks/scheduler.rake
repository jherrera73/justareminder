desc "This task is called by the Heroku scheduler add-on"

task :send_reminders => :environment do
  puts "Sending email reminders..."
  ReminderMailer.send_open_reminders
  puts "Done"
end

task :send_text_reminders => :environment do
  puts "Sending text reminders..."
  Message.send_text_open_reminders
  puts "Done"
end