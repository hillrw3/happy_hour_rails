class Location < ActiveRecord::Base
  validates :name, :address, :latitude, :longitude, presence: true

  has_one :special
  accepts_nested_attributes_for :special

  has_many :location_categories
  has_many :categories, through: :location_categories

end