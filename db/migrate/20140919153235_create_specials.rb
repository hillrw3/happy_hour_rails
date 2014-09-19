class CreateSpecials < ActiveRecord::Migration
  def change
    create_table :specials do |t|
      t.string :sunday
      t.string :monday
      t.string :tuesday
      t.string :wednesday
      t.string :thursday
      t.string :friday
      t.string :saturday
      t.time :starts_at
      t.time :ends_at
    end
  end
end
