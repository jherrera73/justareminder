# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.find_by_email("john.herrera@comcast.net")

unless user
  user = User.create(:full_name => "John Herrera",
                     :email => "john.herrera@comcast.net",
                     :password => "erin1975",
                     :role => "Admin",
                     :password_confirmation => "erin1975")
  user.save!
end

user2 = User.find_by_email("user@comcast.net")

unless user2
  user2 = User.create(:full_name => "Test User",
                      :email => "user@comcast.net",
                      :password => "vision",
                      :role => "User",
                      :password_confirmation => "vision")
  user2.save!
end