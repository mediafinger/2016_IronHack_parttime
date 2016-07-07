FactoryGirl.define do
  factory :project do
    name Faker::Company.catch_phrase
    description Faker::Lorem.paragraph(6)
    user { FactoryGirl.create :user, email: Faker::Internet.email }
  end
end
