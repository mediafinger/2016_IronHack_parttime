# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
  User.destroy_all
  Project.destroy_all # this destroys also all TimeEntries, as they depent on the Projects

  User.create!(name: "Andy", email: "andy@example.com", password: "foobar")
  User.create!(name: "Jose", email: "jose@example.com", password: "foobar")
  User.create!(name: "Nikki", email: "nikki@example.com", password: "foobar")

  User.all.each do |user|
    user.projects.create!(
      [
        { name: "TimeTracker", description: "a Rails app" },
        { name: "IronHack", description: "bla bla bla" },
        { name: "P123", description: "???" },
        { name: "Barcelona", description: "city, Spain" },
        { name: "Airport", description: "work" },
        { name: "Sant Cugat", description: "family home" },
        { name: "England", description: "home country, not playing great football" },
        { name: "Barcelona", description: "city of residence" },
      ]
    )
  end

  Project.all.each do |project|
    project.time_entries.create!(
      [
        { hours: rand(0..7), minutes: rand(0..59), date: Date.today, comments: "My first time entry" },
        { hours: rand(0..7), minutes: rand(0..59), date: Date.today, comments: "My second time entry" }
      ]
    )
  end
end
