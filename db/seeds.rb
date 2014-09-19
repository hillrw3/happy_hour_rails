File.open("#{Rails.root}/lib/assets/yelp_data.csv") do |locations|
  locations.read.each_line do |location|
    name, phone, address, latitude, longitude = location.chomp.split(',')
    Location.create!(name: name, phone: phone, address: address, latitude: latitude, longitude: longitude)
  end
end

Location.first.destroy