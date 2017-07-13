user = User.new(
  username: "user1",
  email: "user1@gmail.com",
  password: "password",
  password_confirmation: "password"
)
user.skip_confirmation!
user.save!

user = User.new(
  username: "user2",
  email: "user2@gmail.com",
  password: "password",
  password_confirmation: "password"
)
user.skip_confirmation!
user.save!
users = User.all

10.times do
  registered_app = RegisteredApp.new(
    name: Faker::Book.unique.title,
    url: Faker::Internet.unique.url,
    user: users.sample
  )
  registered_app.save!
end
registered_apps = RegisteredApp.all

30.times do
  event = Event.new(
    name: Faker::Music.instrument,
    registered_app: registered_apps.sample
  )
  event.save!
end



puts "Seeds finished"
puts "#{RegisteredApp.count} registered apps created."
puts "#{Event.count} events created."
