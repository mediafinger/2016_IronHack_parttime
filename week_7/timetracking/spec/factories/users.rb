FactoryGirl.define do
  factory :user do
    name "Nikki"
    email "nikki@example.com"
    password "foobar"


    # If our user had a field admin...
    # call with: FactoryGirl.create(:user, :admin)

    # admin false

    # trait :admin do
    #   admin true
    # end
  end
end

# to create a user with an other email address:
# FactoryGirl.create(:user, email: "nikki@gmail.com")
