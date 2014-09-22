Location.destroy_all

File.open("#{Rails.root}/lib/assets/yelp_data.csv") do |locations|
  locations.read.each_line do |location|
    name, phone, address, latitude, longitude = location.chomp.split(',')
    location = Location.create!(name: name, phone: phone, address: address, latitude: latitude, longitude: longitude)
    Special.create!(location_id: location.id)
  end
end

Location.first.destroy