class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :number
      t.string :house
      t.string :floor_short
      t.string :features
      t.integer :square_meters
      t.text :security_hint
      t.string :location

      t.timestamps
    end
  end
end
