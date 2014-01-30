class CreateRentableRooms < ActiveRecord::Migration
  def change
    create_table :rentable_rooms do |t|
      t.integer :value
      t.date :start

      t.timestamps
    end
  end
end
