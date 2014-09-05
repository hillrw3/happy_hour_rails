class Location < ActiveRecord::Base
  validates :name, :latitude, :longitude, presence: true

  has_many :location_categories
  has_many :categories, through: :location_categories
end