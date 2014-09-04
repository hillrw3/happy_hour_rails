require "rails_helper"
require 'capybara/rails'

feature "Welcome page" do

  def register
    visit '/'
    click_link "Not a member? Register here!"
    fill_in 'Username', with: 'rob'
    fill_in 'Email', with: 'rob@example.com'
    fill_in 'Password', with: '123'
    click_button "Register!"
  end

  scenario "homepage should contain greeting" do
    visit '/'
    expect(page).to have_content("Hour Hound")
  end

  scenario "click link and register" do
    register
    expect(page).to have_content("Thanks for registering, rob")
  end

  scenario "sign in to website" do
    User.create!(username: "rob", email: "rob@rob.com", password: "123")
    visit '/'
    click_on "Log In"
    fill_in 'Username', with: 'rob'
    fill_in 'Password', with: '123'
    click_button "Sign in!"
    expect(page).to have_content("Hello again, rob!")
  end

end