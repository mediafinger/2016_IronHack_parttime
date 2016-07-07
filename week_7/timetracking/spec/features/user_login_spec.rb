require "rails_helper"

feature "User logs in" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:project) { FactoryGirl.create(:project, user: user) }

  scenario "with valid credentials" do
    visit "/login"

    fill_in :email, with: user.email
    fill_in :password, with: "foobar"

    click_on "Login"

    expect(page).to have_content("Welcome back")
  end

  scenario "with invalid credentials" do
    visit "/login"

    fill_in :email, with: user.email
    fill_in :password, with: "wrong"

    click_on "Login"

    expect(page).to have_content("Login failed")
    expect(current_url).to eq("http://www.example.com/login")
  end
end
