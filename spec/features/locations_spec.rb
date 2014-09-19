require 'rails_helper'
require 'capybara/rails'

feature "Locations" do

  scenario "User can see list of all locations" do
    create_location
    visit '/'
    click_on "All locations"
    expect(page).to have_content "Pub on Penn"
  end

  scenario "user can click on location and see that locations info" do
    create_location
    visit '/'
    click_on "All locations"
    expect(page).to have_content "Pub on Penn"
    click_on "Pub on Penn"
    expect(page).to have_content "123 Fun St"
  end

  scenario "As a signed in user, I can edit a location" do
    create_location
    login
    click_on "All locations"
    expect(page).to have_content "Pub on Penn"
    click_on "Pub on Penn"
    expect(page).to have_content "123 Fun St"
    click_on "Edit Pub on Penn"
    fill_in "Address", with: "456 Great Ave"
    click_on "Update Location"
    expect(page).to have_content "456 Great Ave"
  end

  scenario "As an anonymous user, I cannot edit a location" do
    create_location
    visit '/'
    click_on "All locations"
    expect(page).to have_content "Pub on Penn"
    click_on "Pub on Penn"
    expect(page).to have_content "123 Fun St"
    expect(page).to have_no_content "Edit Pub on Penn"
  end

end