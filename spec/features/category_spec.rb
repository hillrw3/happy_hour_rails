require "rails_helper"
require 'capybara/rails'

feature 'Categories' do

  scenario 'User can view categories and click category to view corresponding locations' do
    create_category
    create_location
    create_location_category
    login
    click_on 'Categories'
    expect(page).to have_content "Trivia"
    click_on "Trivia"
    expect(page).to have_content "So you're looking for some trivia?"
    expect(page).to have_content "Pub on Penn"
  end
end