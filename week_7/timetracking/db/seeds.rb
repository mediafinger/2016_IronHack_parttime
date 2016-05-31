# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
  Project.destroy_all

  Project.create!(
    [
      { name: "TimeTracker", description: "a Rails app" },
      { name: "IronHack", description: "bla bla bla" },
      { name: "P123", description: "???" },
      { name: "Barcelona", description: "city, Spain" },
    ]
  )
end
