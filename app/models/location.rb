class Location < ActiveRecord::Base
  validates :name, :latitude, :longitude, presence: true
end