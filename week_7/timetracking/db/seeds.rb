# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
  Project.destroy_all # this destroys also all TimeEntries, as they depent on the Projects

  Project.create!(
    [
      { name: "TimeTracker", description: "a Rails app" },
      { name: "IronHack", description: "bla bla bla" },
      { name: "P123", description: "???" },
      { name: "Barcelona", description: "city, Spain" },
    ]
  )

  Project.all.each do |project|
    TimeEntry.create!(project: project, hours: 5, minutes: 33, date: Date.today, comments: "My first time entry")
  end
end
