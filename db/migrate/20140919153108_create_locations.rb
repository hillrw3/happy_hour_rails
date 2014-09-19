class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :website
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
