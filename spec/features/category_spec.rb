require "rails_helper"
require 'capybara/rails'

feature 'Categories' do

  def sign_in
    User.create!(username: "rob", email: "rob@rob.com", password: "123")
    visit '/'
    click_on "Log In"
    fill_in 'Username', with: 'rob'
    fill_in 'Password', with: '123'
    click_button "Sign in!"
  end

  scenario 'User can view categories and click category to view corresponding locations' do
    Category.create!(category: "Trivia")
    sign_in
    click_on 'Categories'
    expect(page).to have_content "Trivia"
    click_on "Trivia"
    expect(page).to have_content "So you're looking for some Trivia?"
    expect(page).to have_content "Pub on Penn"
  end
end