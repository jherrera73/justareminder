desc "This task is called by the Heroku scheduler add-on"

task :send_reminders => :environment do
  RemainderMailer.send_open_reminders
end