def login
  visit '/'
  click_link "Not a member? Register here!"
  fill_in 'Username', with: 'rob'
  fill_in 'Email', with: 'rob@example.com'
  fill_in 'Password', with: '123'
  click_button "Register!"
end

def create_category
  Category.create!(id: 1, name: "Trivia")
end

def create_location
  Location.create!(id: 1, name: "Pub on Penn", latitude: 1.234, longitude: 1.234, address: "123 Fun St")
end

def create_location_category
  LocationCategory.create!(location_id: 1, category_id: 1)
end

def create_specials
  Special.create!(sunday: "fun", monday: "fun", tuesday: "fun", wednesday: "fun", thursday: "fun", friday: "fun", saturday: "fun", starts_at: "2000-01-01 10:00 UTC", ends_at: "2000-01-01 17:00 UTC", location_id: 1)
end

def create_location_with_category_and_specials
  create_category
  create_location
  create_location_category
  create_specials
end
